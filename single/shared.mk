# Shared by dmsim and svsim under single
# This is for OLCF Summit 

###################### NVIDIA GPU Configuration #######################
NVCC = /sw/summit/cuda/11.4.0/bin/nvcc
NVCC_FLAGS = -O3 -arch=sm_70 -m64 -std=c++17 -rdc=true --compiler-options -fPIC
NVCC_LIBS = -lm -lcuda 
#######################################################################

####################### Host CPU Configuration ########################
CC = mpicxx
CC_FLAGS = -O3 -m64 -std=c++17 -fPIC
CC_LIBS = 
#######################################################################

##################### Host Q#/QIR Configuration #######################
QIRCC = /sw/summit/llvm/11.0.0-rc1/11.0.0-rc1-0/bin/clang++ 
QIRCC_FLAGS = -std=c++17 -m64 -O3 -I. -fPIC
QIR_BRIDGE_PUBLIC = /ccs/home/angli/qsharp-runtime/src/Qir/Runtime/public/
QIR_BRIDGE_TEST = 
QIR_BRIDGE_BUILD = /ccs/home/angli/qsharp-runtime/src/Qir/Runtime/build/
QIR_BRIDGE_FLAGS = -I. -I$(QIR_BRIDGE_PUBLIC) -L$(QIR_BRIDGE_BUILD)/lib/QIR -L$(QIR_BRIDGE_BUILD)/lib/QSharpCore -L$(QIR_BRIDGE_BUILD)/lib/QSharpFoundation -L$(QIR_BRIDGE_BUILD)/lib/Tracer -lMicrosoft.Quantum.Qir.Runtime -lMicrosoft.Quantum.Qir.QSharp.Core -lMicrosoft.Quantum.Qir.QSharp.Foundation -lMicrosoft.Quantum.Qir.Tracer
#######################################################################

