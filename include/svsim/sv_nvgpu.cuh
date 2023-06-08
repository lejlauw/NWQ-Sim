#pragma once

#include "../state.hpp"
#include "../util.hpp"
#include "../circuit.hpp"
#include "../gate.hpp"
#include "../macros.hpp"
#include "../nvgpu_util.cuh"

#include "../circuit_pass/fusion.hpp"

#include <assert.h>
#include <random>
#include <complex.h>
#include <cooperative_groups.h>
#include <vector>
#include <algorithm>
#include <string>
#include <iostream>
#include <cuda.h>
#include <mma.h>

namespace NWQSim
{
    using namespace cooperative_groups;
    using namespace std;

    // Simulation kernel runtime
    class SV_NVGPU;
    __global__ void simulation_kernel_nvgpu(SV_NVGPU *sv_gpu, IdxType n_gates);

    class SV_NVGPU : public QuantumState
    {
    public:
        SV_NVGPU(IdxType _n_qubits) : QuantumState(_n_qubits)
        {
            // Initialize the GPU
            n_qubits = _n_qubits;
            dim = (IdxType)1 << (n_qubits);
            half_dim = (IdxType)1 << (n_qubits - 1);
            sv_size = dim * (IdxType)sizeof(ValType);

            // always be 0 since 1-MPI maps to 1-GPU
            i_proc = 0;
            cudaSafeCall(cudaSetDevice(i_proc));

            // CPU side initialization
            SAFE_ALOC_HOST_CUDA(sv_real_cpu, sv_size);
            SAFE_ALOC_HOST_CUDA(sv_imag_cpu, sv_size);
            memset(sv_real_cpu, 0, sv_size);
            memset(sv_imag_cpu, 0, sv_size);
            // State-vector initial state [0..0] = 1
            sv_real_cpu[0] = 1.;

            // NVSHMEM GPU memory allocation
            SAFE_ALOC_GPU(sv_real, sv_size);
            SAFE_ALOC_GPU(sv_imag, sv_size);
            SAFE_ALOC_GPU(m_real, sv_size + sizeof(ValType));
            SAFE_ALOC_GPU(m_imag, sv_size + sizeof(ValType));

            cudaCheckError();
            gpu_mem = sv_size * 4;

            // GPU memory initilization
            cudaSafeCall(cudaMemcpy(sv_real, sv_real_cpu, sv_size,
                                    cudaMemcpyHostToDevice));
            cudaSafeCall(cudaMemcpy(sv_imag, sv_imag_cpu, sv_size,
                                    cudaMemcpyHostToDevice));
            cudaSafeCall(cudaMemset(m_real, 0, sv_size + sizeof(ValType)));
            cudaSafeCall(cudaMemset(m_imag, 0, sv_size + sizeof(ValType)));

            rng.seed(time(0));
        }

        ~SV_NVGPU()
        {
            // Release for CPU side
            SAFE_FREE_HOST_CUDA(sv_real_cpu);
            SAFE_FREE_HOST_CUDA(sv_imag_cpu);
            SAFE_FREE_HOST_CUDA(randoms);
            SAFE_FREE_HOST_CUDA(results);

            // Release for GPU side
            SAFE_FREE_GPU(sv_real);
            SAFE_FREE_GPU(sv_imag);
            SAFE_FREE_GPU(m_real);
            SAFE_FREE_GPU(m_imag);

            SAFE_FREE_GPU(gates_gpu);

            SAFE_FREE_GPU(randoms_gpu);
            SAFE_FREE_GPU(results_gpu);
        }

        void reset_state() override
        {
            // Reset CPU input & output
            memset(sv_real_cpu, 0, sv_size);
            memset(sv_imag_cpu, 0, sv_size);
            // State Vector initial state [0..0] = 1
            sv_real_cpu[0] = 1.;
            // GPU side initialization
            cudaSafeCall(cudaMemcpy(sv_real, sv_real_cpu,
                                    sv_size, cudaMemcpyHostToDevice));
            cudaSafeCall(cudaMemcpy(sv_imag, sv_imag_cpu,
                                    sv_size, cudaMemcpyHostToDevice));
            cudaSafeCall(cudaMemset(m_real, 0, sv_size + sizeof(ValType)));
            cudaSafeCall(cudaMemset(m_imag, 0, sv_size + sizeof(ValType)));
        }

        void set_seed(IdxType seed) override
        {
            rng.seed(seed);
        }
#define PRINT_SIM_TRACE

        void sim(Circuit *circuit) override
        {
            fuse_circuit(circuit);
            IdxType n_measures = prepare_measure(circuit->get_gates());
            // Copy the circuit to GPU
            IdxType n_gates = circuit->num_gates();
            copy_gates_to_gpu(circuit);

            SV_NVGPU *sv_gpu;
            SAFE_ALOC_GPU(sv_gpu, sizeof(SV_NVGPU));
            // Copy the simulator instance to GPU
            cudaSafeCall(cudaMemcpy(sv_gpu, this,
                                    sizeof(SV_NVGPU), cudaMemcpyHostToDevice));
#ifdef PRINT_SIM_TRACE
            printf("SVSim_gpu is running! Requesting %lld qubits.\n", n_qubits);
            double sim_time;
            gpu_timer sim_timer;
#endif
            dim3 gridDim(1, 1, 1);
            cudaDeviceProp deviceProp;
            cudaSafeCall(cudaGetDeviceProperties(&deviceProp, 0));
            // 8*16 is per warp shared-memory usage for C4 TC, with real and imag
            // unsigned smem_size = THREADS_CTA_NVGPU/32*8*16*2*sizeof(ValType);
            unsigned smem_size = 0 * sizeof(ValType);
            int numBlocksPerSm;
            cudaSafeCall(cudaOccupancyMaxActiveBlocksPerMultiprocessor(&numBlocksPerSm,
                                                                       simulation_kernel_nvgpu, THREADS_CTA_NVGPU, smem_size));
            gridDim.x = numBlocksPerSm * deviceProp.multiProcessorCount;
            void *args[] = {&sv_gpu, &n_gates};
            cudaSafeCall(cudaDeviceSynchronize());
#ifdef PRINT_SIM_TRACE
            sim_timer.start_timer();
#endif
            cudaLaunchCooperativeKernel((void *)simulation_kernel_nvgpu, gridDim,
                                        THREADS_CTA_NVGPU, args, smem_size);
            cudaSafeCall(cudaDeviceSynchronize());
#ifdef PRINT_SIM_TRACE
            sim_timer.stop_timer();
            sim_time = sim_timer.measure();
#endif
            // Copy the results back to CPU
            cudaSafeCall(cudaMemcpy(results, results_gpu, n_measures * sizeof(IdxType), cudaMemcpyDeviceToHost));
            cudaCheckError();
#ifdef PRINT_SIM_TRACE
            printf("\n============== SV-Sim ===============\n");
            printf("nqubits:%lld, sim_gates:%lld, ngpus:%d, comp:%.3lf ms, comm:%.3lf ms, sim:%.3lf ms, mem:%.3lf MB, mem_per_gpu:%.3lf MB\n",
                   n_qubits, n_gates, 1, sim_time, 0.,
                   sim_time, gpu_mem / 1024 / 1024, gpu_mem / 1024 / 1024);
            printf("=====================================\n");
            fflush(stdout);
#endif
            SAFE_FREE_GPU(sv_gpu);
        }

        IdxType *get_results() override
        {
            return results;
        }

        IdxType measure(IdxType qubit) override
        {
            Circuit *circuit = new Circuit(n_qubits);
            circuit->M(qubit);
            sim(circuit);
            delete circuit;
            return results[0];
        }

        IdxType *measure_all(IdxType repetition = DEFAULT_REPETITIONS) override
        {
            Circuit *circuit = new Circuit(n_qubits);
            circuit->MA(repetition);
            sim(circuit);
            delete circuit;
            return results;
        }

        ValType get_exp_z(const std::vector<size_t> &in_bits) override
        {

            return 0;
        }

        ValType get_exp_z() override
        {

            return 0;
        }

        void print_res_sv() override
        {
            cudaSafeCall(cudaMemcpy(sv_real_cpu, sv_real, sv_size, cudaMemcpyDeviceToHost));
            cudaSafeCall(cudaMemcpy(sv_imag_cpu, sv_imag, sv_size, cudaMemcpyDeviceToHost));

            IdxType num = ((IdxType)1 << n_qubits);
            printf("----- SVSim ------\n");
            for (IdxType i = 0; i < num; i++)
            {
                printf("(%.3lf,%.3lfj) ", sv_real_cpu[i], sv_imag_cpu[i]);
                if ((i + 1) % 8 == 0)
                    printf("\n");
            }
            printf("\n");
        }

    public:
        // n_qubits is the number of qubits
        IdxType n_qubits;

        IdxType sv_size;

        IdxType dim;
        IdxType half_dim;

        // GPU memory usage
        ValType gpu_mem;
        // CPU arrays
        ValType *sv_real_cpu;
        ValType *sv_imag_cpu;

        // GPU arrays
        ValType *sv_real;
        ValType *sv_imag;
        // For joint measurement
        ValType *m_real;
        ValType *m_imag;
        // For measurement randoms
        ValType *randoms = NULL;
        ValType *randoms_gpu = NULL;
        // For measurement result
        IdxType *results = NULL;
        IdxType *results_gpu = NULL;

        // Random
        std::mt19937 rng;
        std::uniform_real_distribution<ValType> uni_dist;

        // GPU-side simulator instance
        Gate *gates_gpu = NULL;

        void copy_gates_to_gpu(Circuit *circuit)
        {
            std::vector<Gate> cpu_vec = circuit->get_gates();

            // Allocate memory on CPU
            size_t vec_size = cpu_vec.size() * sizeof(Gate);

            // Allocate memory on GPU
            SAFE_FREE_GPU(gates_gpu);
            SAFE_ALOC_GPU(gates_gpu, vec_size);
            cudaSafeCall(cudaMemcpy(gates_gpu, cpu_vec.data(), vec_size, cudaMemcpyHostToDevice));
        }

        IdxType prepare_measure(std::vector<Gate> gates)
        {
            // Determine the total number of measurements
            IdxType n_slots = 0;
            for (auto g : gates)
            {
                if (g.op_name == OP::M)
                    n_slots++;
                else if (g.op_name == OP::MA)
                    n_slots += g.repetition;
            }

            // Prepare randoms and results memory
            SAFE_FREE_HOST_CUDA(results);
            SAFE_ALOC_HOST_CUDA(results, sizeof(IdxType) * n_slots);
            memset(results, 0, sizeof(IdxType) * n_slots);

            SAFE_FREE_GPU(results_gpu);
            SAFE_ALOC_GPU(results_gpu, sizeof(IdxType) * n_slots);
            cudaSafeCall(cudaMemset(results_gpu, 0, sizeof(IdxType) * n_slots));

            SAFE_FREE_HOST_CUDA(randoms);
            SAFE_ALOC_HOST_CUDA(randoms, sizeof(ValType) * n_slots);
            for (IdxType i = 0; i < n_slots; i++)
                randoms[i] = uni_dist(rng);

            SAFE_FREE_GPU(randoms_gpu);
            SAFE_ALOC_GPU(randoms_gpu, sizeof(ValType) * n_slots);
            cudaSafeCall(cudaMemcpy(randoms_gpu, randoms,
                                    sizeof(ValType) * n_slots, cudaMemcpyHostToDevice));

            return n_slots;
        }

        //================================= Gate Definition ========================================

        //============== Local Unified 1-qubit Gate ================
        __device__ __inline__ void C1_GATE(const ValType *gm_real, const ValType *gm_imag, const IdxType qubit)
        {
            grid_group grid = this_grid();
            const IdxType tid = blockDim.x * blockIdx.x + threadIdx.x;
            for (IdxType i = tid; i < half_dim; i += blockDim.x * gridDim.x)
            {
                IdxType outer = (i >> qubit);
                IdxType inner = (i & (((IdxType)1 << qubit) - 1));
                IdxType offset = (outer << (qubit + 1));
                IdxType pos0 = (offset + inner);
                IdxType pos1 = (offset + inner + ((IdxType)1 << qubit));
                const ValType el0_real = LOCAL_G_NVGPU(sv_real, pos0);
                const ValType el0_imag = LOCAL_G_NVGPU(sv_imag, pos0);
                const ValType el1_real = LOCAL_G_NVGPU(sv_real, pos1);
                const ValType el1_imag = LOCAL_G_NVGPU(sv_imag, pos1);
                ValType sv_real_pos0 = (gm_real[0] * el0_real) - (gm_imag[0] * el0_imag) + (gm_real[1] * el1_real) - (gm_imag[1] * el1_imag);
                ValType sv_imag_pos0 = (gm_real[0] * el0_imag) + (gm_imag[0] * el0_real) + (gm_real[1] * el1_imag) + (gm_imag[1] * el1_real);
                ValType sv_real_pos1 = (gm_real[2] * el0_real) - (gm_imag[2] * el0_imag) + (gm_real[3] * el1_real) - (gm_imag[3] * el1_imag);
                ValType sv_imag_pos1 = (gm_real[2] * el0_imag) + (gm_imag[2] * el0_real) + (gm_real[3] * el1_imag) + (gm_imag[3] * el1_real);
                LOCAL_P_NVGPU(sv_real, pos0, sv_real_pos0);
                LOCAL_P_NVGPU(sv_imag, pos0, sv_imag_pos0);
                LOCAL_P_NVGPU(sv_real, pos1, sv_real_pos1);
                LOCAL_P_NVGPU(sv_imag, pos1, sv_imag_pos1);
            }
            grid.sync();
        }

        //============== Local 2-qubit Gate  ================
        __device__ __inline__ void C2_GATE(const ValType *gm_real, const ValType *gm_imag, const IdxType qubit0, const IdxType qubit1)
        {
            grid_group grid = this_grid();
            const int tid = blockDim.x * blockIdx.x + threadIdx.x;
            const IdxType per_pe_work = ((dim) >> 2);
            assert(qubit0 != qubit1); // Non-cloning

            const IdxType q0dim = ((IdxType)1 << max(qubit0, qubit1));
            const IdxType q1dim = ((IdxType)1 << min(qubit0, qubit1));
            const IdxType outer_factor = ((dim) + q0dim + q0dim - 1) >> (max(qubit0, qubit1) + 1);
            const IdxType mider_factor = (q0dim + q1dim + q1dim - 1) >> (min(qubit0, qubit1) + 1);
            const IdxType inner_factor = q1dim;
            const IdxType qubit0_dim = ((IdxType)1 << qubit0);
            const IdxType qubit1_dim = ((IdxType)1 << qubit1);

            for (IdxType i = tid; i < per_pe_work; i += blockDim.x * gridDim.x)
            {
                IdxType outer = ((i / inner_factor) / (mider_factor)) * (q0dim + q0dim);
                IdxType mider = ((i / inner_factor) % (mider_factor)) * (q1dim + q1dim);
                IdxType inner = i % inner_factor;
                IdxType pos0 = outer + mider + inner;
                IdxType pos1 = outer + mider + inner + qubit1_dim;
                IdxType pos2 = outer + mider + inner + qubit0_dim;
                IdxType pos3 = outer + mider + inner + q0dim + q1dim;

                const ValType el0_real = LOCAL_G_NVGPU(sv_real, pos0);
                const ValType el0_imag = LOCAL_G_NVGPU(sv_imag, pos0);
                const ValType el1_real = LOCAL_G_NVGPU(sv_real, pos1);
                const ValType el1_imag = LOCAL_G_NVGPU(sv_imag, pos1);
                const ValType el2_real = LOCAL_G_NVGPU(sv_real, pos2);
                const ValType el2_imag = LOCAL_G_NVGPU(sv_imag, pos2);
                const ValType el3_real = LOCAL_G_NVGPU(sv_real, pos3);
                const ValType el3_imag = LOCAL_G_NVGPU(sv_imag, pos3);

                // Real part
                ValType sv_real_pos0 = (gm_real[0] * el0_real) - (gm_imag[0] * el0_imag) + (gm_real[1] * el1_real) - (gm_imag[1] * el1_imag) + (gm_real[2] * el2_real) - (gm_imag[2] * el2_imag) + (gm_real[3] * el3_real) - (gm_imag[3] * el3_imag);
                ValType sv_real_pos1 = (gm_real[4] * el0_real) - (gm_imag[4] * el0_imag) + (gm_real[5] * el1_real) - (gm_imag[5] * el1_imag) + (gm_real[6] * el2_real) - (gm_imag[6] * el2_imag) + (gm_real[7] * el3_real) - (gm_imag[7] * el3_imag);
                ValType sv_real_pos2 = (gm_real[8] * el0_real) - (gm_imag[8] * el0_imag) + (gm_real[9] * el1_real) - (gm_imag[9] * el1_imag) + (gm_real[10] * el2_real) - (gm_imag[10] * el2_imag) + (gm_real[11] * el3_real) - (gm_imag[11] * el3_imag);
                ValType sv_real_pos3 = (gm_real[12] * el0_real) - (gm_imag[12] * el0_imag) + (gm_real[13] * el1_real) - (gm_imag[13] * el1_imag) + (gm_real[14] * el2_real) - (gm_imag[14] * el2_imag) + (gm_real[15] * el3_real) - (gm_imag[15] * el3_imag);

                // Imag part
                ValType sv_imag_pos0 = (gm_real[0] * el0_imag) + (gm_imag[0] * el0_real) + (gm_real[1] * el1_imag) + (gm_imag[1] * el1_real) + (gm_real[2] * el2_imag) + (gm_imag[2] * el2_real) + (gm_real[3] * el3_imag) + (gm_imag[3] * el3_real);
                ValType sv_imag_pos1 = (gm_real[4] * el0_imag) + (gm_imag[4] * el0_real) + (gm_real[5] * el1_imag) + (gm_imag[5] * el1_real) + (gm_real[6] * el2_imag) + (gm_imag[6] * el2_real) + (gm_real[7] * el3_imag) + (gm_imag[7] * el3_real);
                ValType sv_imag_pos2 = (gm_real[8] * el0_imag) + (gm_imag[8] * el0_real) + (gm_real[9] * el1_imag) + (gm_imag[9] * el1_real) + (gm_real[10] * el2_imag) + (gm_imag[10] * el2_real) + (gm_real[11] * el3_imag) + (gm_imag[11] * el3_real);
                ValType sv_imag_pos3 = (gm_real[12] * el0_imag) + (gm_imag[12] * el0_real) + (gm_real[13] * el1_imag) + (gm_imag[13] * el1_real) + (gm_real[14] * el2_imag) + (gm_imag[14] * el2_real) + (gm_real[15] * el3_imag) + (gm_imag[15] * el3_real);

                LOCAL_P_NVGPU(sv_real, pos0, sv_real_pos0);
                LOCAL_P_NVGPU(sv_real, pos1, sv_real_pos1);
                LOCAL_P_NVGPU(sv_real, pos2, sv_real_pos2);
                LOCAL_P_NVGPU(sv_real, pos3, sv_real_pos3);

                LOCAL_P_NVGPU(sv_imag, pos0, sv_imag_pos0);
                LOCAL_P_NVGPU(sv_imag, pos1, sv_imag_pos1);
                LOCAL_P_NVGPU(sv_imag, pos2, sv_imag_pos2);
                LOCAL_P_NVGPU(sv_imag, pos3, sv_imag_pos3);
            }
            // BARR_NVGPU;
        }

        __device__ __inline__ void M_GATE(const IdxType qubit, const IdxType cur_index)
        {
            ValType rand = randoms_gpu[cur_index];

            grid_group grid = this_grid();
            const IdxType tid = blockDim.x * blockIdx.x + threadIdx.x;
            // ValType *m_real = m_real;
            IdxType mask = ((IdxType)1 << qubit);

            for (IdxType i = tid; i < dim; i += blockDim.x * gridDim.x)
            {
                if ((i & mask) == 0)
                    m_real[i] = 0;
                else
                    m_real[i] = sv_real[i] * sv_real[i] + sv_imag[i] * sv_imag[i];
            }
            BARR_NVGPU;

            // Parallel reduction
            for (IdxType k = ((IdxType)1 << (n_qubits - 1)); k > 0; k >>= 1)
            {
                for (IdxType i = tid; i < k; i += blockDim.x * gridDim.x)
                {
                    m_real[i] += m_real[i + k];
                }
                BARR_NVGPU;
            }
            ValType prob_of_one = m_real[0];
            grid.sync();

            if (rand < prob_of_one)
            {
                ValType factor = 1. / sqrt(prob_of_one);
                for (IdxType i = tid; i < dim; i += blockDim.x * gridDim.x)
                {
                    if ((i & mask) == 0)
                    {
                        sv_real[i] = 0;
                        sv_imag[i] = 0;
                    }
                    else
                    {
                        sv_real[i] *= factor;
                        sv_imag[i] *= factor;
                    }
                }
            }
            else
            {
                ValType factor = 1. / sqrt(1. - prob_of_one);
                for (IdxType i = tid; i < dim; i += blockDim.x * gridDim.x)
                {
                    if ((i & mask) == 0)
                    {
                        sv_real[i] *= factor;
                        sv_imag[i] *= factor;
                    }
                    else
                    {
                        sv_real[i] = 0;
                        sv_imag[i] = 0;
                    }
                }
            }
            if (tid == 0)
                results_gpu[cur_index] = (rand <= prob_of_one ? 1 : 0);
            BARR_NVGPU;
        }

        __device__ __inline__ void MA_GATE(const IdxType repetition, const IdxType cur_index)
        {
            grid_group grid = this_grid();
            const IdxType n_size = (IdxType)1 << (n_qubits);
            const IdxType tid = blockDim.x * blockIdx.x + threadIdx.x;
            // ValType *m_real = m_real;

            for (IdxType i = tid; i < dim; i += blockDim.x * gridDim.x)
            {
                m_real[i] = sv_real[i] * sv_real[i] + sv_imag[i] * sv_imag[i];
            }
            BARR_NVGPU;

            // Parallel prefix sum
            for (IdxType d = 0; d < (n_qubits); d++)
            {
                IdxType step = (IdxType)1 << (d + 1);
                for (IdxType k = tid * step; k < n_size; k += step * blockDim.x * gridDim.x)
                {
                    m_real[(k + ((IdxType)1 << (d + 1)) - 1)] += LOCAL_G_NVGPU(m_real, k + ((IdxType)1 << d) - 1);
                }
                BARR_NVGPU;
            }

            if (tid == 0)
            {
                ValType val = LOCAL_G_NVGPU(m_real, n_size - 1);
                m_real[n_size] = val;
                LOCAL_P_NVGPU(m_real, n_size - 1, 0);
                ValType purity = fabs(val);
                if (abs(purity - 1.0) > ERROR_BAR)
                    printf("MA: Purity Check fails with %lf\n", purity);
            }

            BARR_NVGPU;

            for (IdxType d = (n_qubits)-1; d >= 0; d--)
            {
                IdxType step = (IdxType)1 << (d + 1);
                for (IdxType k = tid * step; k < n_size - 1; k += step * blockDim.x * gridDim.x)
                {
                    ValType tmp = LOCAL_G_NVGPU(m_real, k + ((IdxType)1 << d) - 1);
                    ValType tmp2 = LOCAL_G_NVGPU(m_real, (k + ((IdxType)1 << (d + 1)) - 1));
                    LOCAL_P_NVGPU(m_real, k + ((IdxType)1 << d) - 1, tmp2);
                    m_real[(k + ((IdxType)1 << (d + 1)) - 1)] = tmp + tmp2;
                }
                BARR_NVGPU;
            }

            for (IdxType j = tid; j < n_size; j += blockDim.x * gridDim.x)
            {
                ValType lower = LOCAL_G_NVGPU(m_real, j);
                ValType upper = (j + 1 == n_size) ? 1 : LOCAL_G_NVGPU(m_real, j + 1);
                for (IdxType i = 0; i < repetition; i++)
                {
                    ValType r = randoms_gpu[cur_index + i];
                    if (lower <= r && r < upper)
                        results_gpu[cur_index + i] = j;
                }
            }
            BARR_NVGPU;
        }

        __device__ __inline__ void RESET_GATE(const IdxType qubit)
        {
            grid_group grid = this_grid();
            const IdxType tid = blockDim.x * blockIdx.x + threadIdx.x;
            // ValType *m_real = m_real;
            IdxType mask = ((IdxType)1 << qubit);

            for (IdxType i = tid; i < dim; i += blockDim.x * gridDim.x)
            {
                if ((i & mask) == 0)
                    m_real[i] = 0;
                else
                    m_real[i] = sv_real[i] * sv_real[i] + sv_imag[i] * sv_imag[i];
            }

            BARR_NVGPU;
            for (IdxType k = ((IdxType)1 << (n_qubits - 1)); k > 0; k >>= 1)
            {
                for (IdxType i = tid; i < k; i += blockDim.x * gridDim.x)
                {
                    m_real[i] += m_real[i + k];
                }
                BARR_NVGPU;
            }

            BARR_NVGPU;
            ValType prob_of_one = m_real[0];
            grid.sync();

            if (prob_of_one < 1.0) // still possible to normalize
            {
                ValType factor = 1.0 / sqrt(1.0 - prob_of_one);
                for (IdxType i = tid; i < dim; i += blockDim.x * gridDim.x)
                {
                    if ((i & mask) == 0)
                    {
                        sv_real[i] *= factor;
                        sv_imag[i] *= factor;
                        m_real[i] = sv_real[i] * sv_real[i] + sv_imag[i] * sv_imag[i];
                    }
                    else
                    {
                        sv_real[i] = 0;
                        sv_imag[i] = 0;
                        m_real[i] = 0;
                    }
                }
                BARR_NVGPU;
                for (IdxType k = ((IdxType)1 << (n_qubits - 1)); k > 0; k >>= 1)
                {
                    for (IdxType i = tid; i < k; i += blockDim.x * gridDim.x)
                    {
                        m_real[i] += m_real[i + k];
                    }
                    BARR_NVGPU;
                }
                ValType norm = m_real[0];
                grid.sync();
                if (abs(norm - 1.0) > 0)
                {
                    ValType factor = 1.0 / sqrt(norm);
                    for (IdxType i = tid; i < dim; i += blockDim.x * gridDim.x)
                    {
                        sv_real[i] *= factor;
                        sv_imag[i] *= factor;
                    }
                }
            }
            // becuase qubit=0 probability is 0, we can't simply normalize
            else
            {
                for (IdxType i = tid; i < dim; i += blockDim.x * gridDim.x)
                {
                    if ((i & mask) == 0)
                    {
                        IdxType dual_i = i ^ mask;
                        sv_real[i] = sv_real[dual_i];
                        sv_imag[i] = sv_imag[dual_i];
                        sv_real[dual_i] = 0;
                        sv_imag[dual_i] = 0;
                    }
                }
            }
            BARR_NVGPU;
        }
    };

    __global__ void simulation_kernel_nvgpu(SV_NVGPU *sv_gpu, IdxType n_gates)
    {
        IdxType cur_index = 0;
        grid_group grid = this_grid();

        for (IdxType t = 0; t < n_gates; t++)
        {
            auto op_name = (sv_gpu->gates_gpu)[t].op_name;
            auto n_qubits = (sv_gpu->gates_gpu)[t].n_qubits;
            auto qubit = (sv_gpu->gates_gpu)[t].qubit;

            auto ctrl = (sv_gpu->gates_gpu)[t].ctrl;
            auto gm_real = (sv_gpu->gates_gpu)[t].gm_real;
            auto gm_imag = (sv_gpu->gates_gpu)[t].gm_imag;

            auto repetition = (sv_gpu->gates_gpu)[t].repetition;

            if (op_name == OP::RESET)
            {
                sv_gpu->RESET_GATE(qubit);
            }
            else if (op_name == OP::M)
            {
                sv_gpu->M_GATE(qubit, cur_index);
                cur_index++;
            }
            else if (op_name == OP::MA)
            {
                sv_gpu->MA_GATE(repetition, cur_index);
                cur_index += repetition;
            }
            else if (n_qubits == 1)
            {
                sv_gpu->C1_GATE(gm_real, gm_imag, qubit);
            }
            else if (n_qubits == 2)
            {
                sv_gpu->C2_GATE(gm_real, gm_imag, ctrl, qubit);
            }
            grid.sync();
        }
    }

} // namespace NWQSim