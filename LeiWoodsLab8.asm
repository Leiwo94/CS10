# CS10 Lab 8
# Development Environment:  MARS MIPS Simulator
# Name:  Lei Woods
# Solution File: LeiWoodsLab8.asm
# Date:  10/11/2021
# Registers Used:
# $a0 : holds address of strudent_ID
# $v0 : holds addr sycalls


	.data 
student_ID:	.asciiz "My Student ID is 20453094\n"
last_name:	.asciiz "My Last Name is Woods\n"

	.text
	
main:

	la	$a0, student_ID #print out address of student_ID
	li	$v0, 4 
	syscall
	
	la	$a0, last_name #print out address of last_name
	li	$v0, 4 
	syscall

	add 	$3, $2, $3
	
	nop 
	nop
	nop # adding no-op because $3 depends on the LW below
	    # $3 is in the last position so 2 are required.
	
	lw 	$4, 100($3)
	
	sub 	$7, $6, $2
	
	nop # Adding no-op here because $6 depends on
	    # $6 of xor or the program will stall.
	
	xor 	$6, $4, $3
	
	
	li 	$v0, 10 # End program
	syscall
	
	
