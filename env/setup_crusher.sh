#Environment settings for ORNL Summit HPC
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/work/qsharp-runtime/src/Qir/Runtime/build/lib/QIR:~/work/qsharp-runtime/src/Qir/Runtime/build/lib/QSharpCore/:~/work/qsharp-runtime/src/Qir/Runtime/build/lib/QSharpFoundation/:~/work/qsharp-runtime/src/Qir/Runtime/build/lib/:~/work/qsharp-runtime/src/Qir/Runtime/build/lib/Tracer/:/ccs/home/angli/nvshmem/nvshmem_src_2.6.0-1/build/lib/


module load cmake
module load rocm/5.1.0
module load cray-mpich

