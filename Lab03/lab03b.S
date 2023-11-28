.globl lab03b

lab03b:
	ADR X2, UIN // X2 points to UIN
	LDUR X3, [X2, 0] // X3 has value of UIN
	EOR X1, X1, X1
loop:
	SUBS XZR, X1, #10
	B.GE end // Exit loop
	SUB X3, X3, 1 // subtract UIN VALUE by 1
	ADD X1, X1, #1 // Incremet counter (i)
	B loop

end:
	STUR X3, [X2, 0] // Store result
	MOV X0, X2 // Return pointer for testing purposes
	BR X30


.section .data

UIN:
.quad 31
