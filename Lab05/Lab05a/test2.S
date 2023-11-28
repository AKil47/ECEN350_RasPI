.section .text
.globl test2

test2:
	SUB	SP, SP, #16

        sub     X1, X0, X1
	ADR	X0, f_string
	STUR	LR, [SP, #0]
	bl	printf

	LDUR	LR, [SP, #0]
	ADD	SP, SP, #16
        br      LR

.section .data

f_string:
.asciz "Result of test2(6, 5) = %lld\n"
