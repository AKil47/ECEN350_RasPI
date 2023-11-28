all: CPU run

CPU: SingleCycleProcTest.v ALU.v DataMemory.v InstructionMemory.v MiniRegisterFile.v Mux21.v NextPClogic.v SignExtender_Example.v SingleCycleControl.v SingleCycleProc.v
	iverilog -o CPU SingleCycleProcTest.v ALU.v DataMemory.v InstructionMemory.v MiniRegisterFile.v Mux21.v NextPClogic.v SignExtender_Example.v SingleCycleControl.v SingleCycleProc.v

run:
	./CPU
