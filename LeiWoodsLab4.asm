# CS10 Lab 4
# Development Environment:  MARS MIPS Simulator
# Name:  Lei Woods
# Solution File: LeiWoodsLab4.asm
# Date:  10/21/2021
# Registers Used:
# $a0: holds address of strudent_ID, last_name
# $a0: holds address of prompt, sum, plus
# $v0: holds addr sycalls
# $s0: holds address of user input number
# $t0: holds tempoary sum of $s0/2
# $t1: holds temporary addresses of full sum
# $t2: holds temporary addresses of initialized input
# $t3: holds temporary address of $s0-2
# $t4: holds temporary address of $t2

	.data
student_ID:	.asciiz "My Student ID is 20453094\n"
last_name:	.asciiz "My Last Name is Woods\n"
prompt:		.asciiz "Please enter the Top Number.\n"
sum:		.asciiz "\nThe sum of all ODD integers is: "
plus:		.asciiz "+"

	.text

main:

	la	$a0, student_ID # print out address of student_ID
	li	$v0, 4 
	syscall
	
	la	$a0, last_name # print out address of last_name
	li	$v0, 4 
	syscall

	la 	$a0, prompt # print out address of prompt
	li 	$v0, 4   
	syscall
	
	li 	$v0,5 # accept user input
	syscall 
	
check:

	move 	$s0, $v0 # load input to s0
	
	sub	$t3, $s0, 2
	
	div 	$t0, $s0, 2 # divide by zero
	mfhi 	$t0 # load reminder to t3
	bnez 	$t0, odds # if remainder is odd move to odds
	sub 	$s0, $s0, 1 # sub 1 from number and save to s0
	
odds:

	li 	$t1, 0 # initialize sum
	li 	$t2, 1 # Load 1 to t2
	
first_print:

	move	$a0, $t2 # move first value of $t2 to $a0 to print
	li	$v0, 1 # print value
	syscall # system call to print
	
	la	$a0, plus # call address of plus to print
	li	$v0, 4 # print
	syscall # system call to print
	
top_of_loop:

	bgt	$t2, $s0, end_of_loop #leave loop if $t2 > $s0
	
	add 	$t1, $t1, $t2 # Start adding odd numbers together
	add 	$t2, $t2, 2 # Move to next odd number
	
	move	$t4, $t2 # move the value of $t2 to $t3
	
	b	print_loop # branch down to print_llop
	
print_loop:

	bgt	$t4, $t3, top_of_loop # branch to top_of_loop if $t4 > $t3
	
	move	$a0, $t2 # move value of $t2 to $a0 to print
	li	$v0, 1 # print value
	syscall # system call to print
	
	la	$a0, plus # print address of plu
	li	$v0, 4
	syscall # system call to print
	
	b	top_of_loop # branch to top_of_loop
	
		
end_of_loop:	

	move	$a0, $s0 # move value of $s0 for print
	li	$v0, 1 #print value
	syscall

	la 	$a0, sum # print address of sum
	li 	$v0, 4
	syscall
	
	
	move 	$a0, $t1 # move sum of all odds to $a0
	li 	$v0, 1 # print value
	syscall

	li 	$v0, 10  # exit syscall
	syscall
	
