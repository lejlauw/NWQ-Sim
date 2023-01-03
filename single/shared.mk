# Shared by dmsim and svsim under single
# This is for NERSC Perlmutter with NVIDIA A100

###################### NVIDIA GPU Configuration #######################
NVCC = /opt/nvidia/hpc_sdk/Linux_x86_64/22.5/cuda/11.7/bin/nvcc
NVCC_FLAGS = -O3 -arch=sm_80 -m64 -std=c++17 -rdc=true --compiler-options -fPIC
NVCC_LIBS = 
#######################################################################

####################### Host CPU Configuration ########################
CC = CC
CC_FLAGS = -O3 -m64 -std=c++14 -fPIC -fopenmp
CC_LIBS = 
#######################################################################


##################### Host Q#/QIR Configuration #######################
QIRCC = /global/common/software/nersc/cos1.3/llvm/11.0.1/bin/clang++
QIRCC_FLAGS = -std=c++17 -m64 -O3 -I. -fPIC
QIR_BRIDGE_PUBLIC = /global/homes/a/angli/qsharp-runtime/src/Qir/Runtime/public/
QIR_BRIDGE_TEST = 
QIR_BRIDGE_BUILD = /global/homes/a/angli/qsharp-runtime/src/Qir/Runtime/build/
QIR_BRIDGE_FLAGS = -I. -I$(QIR_BRIDGE_PUBLIC) -L$(QIR_BRIDGE_BUILD)/lib/QIR -L$(QIR_BRIDGE_BUILD)/lib/QSharpCore -L$(QIR_BRIDGE_BUILD)/lib/QSharpFoundation -L$(QIR_BRIDGE_BUILD)/lib/Tracer -lMicrosoft.Quantum.Qir.Runtime -lMicrosoft.Quantum.Qir.QSharp.Core -lMicrosoft.Quantum.Qir.QSharp.Foundation -lMicrosoft.Quantum.Qir.Tracer
#######################################################################


