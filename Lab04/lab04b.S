.globl factorial

factorial:
	// pre function stuff
	SUB SP,SP, #16 // move stack pointer to alloc more space
	STUR LR, [SP, #0]
	STUR X0, [SP, #8]
	
	// if not zero, then keep going to base case, else jump
	CBNZ X0, go
	MOV X0, #1 // return 1
	
	
	// post function stuff
	ADD SP, SP, #16 // reset stack pointer
	BR LR
	
	
go:
	// decrement input and call again
	SUB X0, X0, 1
	BL factorial
	
	LDUR X1,[SP,#8]	// load our old input into x1 (the second param)
	BL my_mul // x0 = x0 * x1
	
	// post function stuff
	LDUR LR, [SP, #0]
	ADD SP,SP, #16
	BR LR
