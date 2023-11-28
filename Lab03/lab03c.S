.globl lab03c

lab03c:
	ADR X0, j
	LDUR X0, [X0, #0]
	ADR X2, my_array // X2 points to my_array[0]
	MOV X3, X2 // X3 is a copy of x2	
	EOR X1, X1, X1	// X1 is the counter
	B loop

loop:
	SUBS XZR, X1, #10
	B.GE done
	STUR X0, [X2, #0]
	ADD X2, X2, #8
	ADD X0, X0, #1
	ADD X1, X1, #1
	B loop

done:
	MOV X0, X3 // returning pointer to my_array for testing
	BR X30

.section .data

my_array:
.space 80

j:
.quad 9
