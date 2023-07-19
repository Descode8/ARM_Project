@ Jaden D. Humphries(jdhumph)
@ CPSC 2310 Section 1
@ Programming Assingment 3 - Subroutines and Parameters
@ Purpose: This program will retrieve the command-line arguments and convert them to integers. It will call the 
@ 'offset' subroutine in offset.s, and it will return the offset back to this main.s and print the element, followed
@ by the offset. 

@ Command-Line Args from User:
@ 	argc: number of commands
@	argv: array of strings
@ Then:                                       Address:
@ 	argv[0]: .exe                            0
@	argv[1]: i, row                          4
@ 	argv[2]: j, col                          8
@	argv[3]: n, number of cols per row	 12
@ Registers:
@	r0: used for converting i, j, n to int
@	r1: argv
@  Temp:r4-r6: i, j, n

.section .text	
.global main
.global offset
.extern printf
.extern atoi

main:
@ Load the command-line args into respective registers
	push {r4-r6, lr}
	ldr r4, [r1, #4]	@ load i @ argv[1] into r4
	ldr r5, [r1, #8]	@ load j @ argv[2] into r5
	ldr r6, [r1, #12]	@ load n @ argv[3] into r6
@ Convert arguments into integers
@ i handling
	mov r0, r4		@ r0 = r4 = argv[1] = i
	bl atoi			@ convert to int
	mov r4, r0		@ put int into r4
@ j handling
	mov r0, r5		@ r0 = r5 = argv[2] = j
	bl atoi			
	mov r5, r0		@ put int into r5
@ n handling
	mov r0, r6		@ r0 = r6 = argv[3] = n
	bl atoi
	mov r6, r0		@ put int into r6
@ Copy registers for offset call
	mov r0, r4		@ move i into r0
	mov r1, r5		@ move j into r1
	mov r2, r6		@ move n into r2

@ Call offset
	bl offset
	mov r3, r0		@ r3 = offset value
 	mov r1, r4		@ r1 = i 
	mov r2, r5		@ r2 = j
	
	ldr r0, =console
	bl printf

        mov r0, #0
        pop {r4-r6, pc}

       .section ".rodata"
   
console: 	.asciz "the offset for a[%d][%d] is %d\n"