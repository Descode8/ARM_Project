@ Jaden D. Humphries(jdhumph)
@ CPSC 2310 Section 1
@ Programming Assingment 3 - Subroutines and Parameters
@ Purpose: The purpose of this program is to create the subroutine 'offset' that will calculate the offset of a 2-D array.

@ Parameters:
@	r0: i, row number (1st parameter)
@	r1: j, col number (2nd parameter)
@	r2: n, number of columns per row (3rd parameter)
@ Return Value:
@ 	r0: offset
@ Assume:
@	i and j are valid indicies of a 2-D array and n is a valid value for the number of columns per row

.section .text
.global offset
offset:
	push {lr}		@ load argv
	mul r3, r0, r2 		@ r3 = i * n
	add r3, r1		@ r3 = i * n + j
	lsl r0, r3, #2		@ r0 = (i * n + j) * 4
	pop {pc}		@ restore pc return to main