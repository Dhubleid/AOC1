.data
bgn: .asciiz "Area to calculate:\n1 - Circle\n2 - Triangle \n3 - Retangle\n"
r: .asciiz "Enter the radius: "
base: .asciiz "Enter the base:"
high: .asciiz "Enter the heigh: "
error: .asciiz "Invalid option\n"
is: .asciiz " is the Area\n"
pi: .float 3.14

.text

jal area

li $v0, 10
syscall
#--------------------Subroutines------------------------
	area:	# Main subroutine
		addi $sp, $sp, -4 	# STACK RA
		sw $ra, ($sp)

	menu:		
		li $v0, 4 	# Print menu options
		la $a0, bgn	
		syscall
		
		li $v0, 5	# read option input
		syscall
		
		move $t0, $v0 # move input to t0 and check if its case 1
		bne $t0, 1 op2
		jal circle
		j end
	
	op2:	# case 2
		bne $t0, 2, op3
		jal triangle
		j end
	op3:	# check if case 3 or else invalid input
		bne $t0, 3, invalid
		jal retangle
		j end
	
	invalid: # print error message and go back
		li $v0, 4
		la $a0, error
		syscall
		j menu

	end: # print results of selected area
		move $a0, $v0
		li $v0, 1
		syscall
		
		li $v0, 4
		la $a0, is
		syscall
		
		# get RA from stack to leave subroutine 
		lw $ra, ($sp)
		addu $sp, $sp, 4
		jr $ra

# subroutines to calculate each area
circle:
	# read radius integer
	li $v0, 4 
	la $a0, r
	syscall
	
	li $v0, 5
	syscall
	
	move $t0, $v0
	
	# integer to float to calculate the operation of area with pi
	l.s $f1, pi 	# pi to f1
	mtc1 $t0, $f0 mt 	# radius to f0 
	cvt.s.w $f0, $f0 	# covert radius to float 
	# calculate pi*r^2
	mul.s $f0, $f0, $f0
	mul.s $f0, $f1, $f0 
	# covert the result to integer and return 
	cvt.w.s $f0, $f0
	mfc1 $v0, $f0
	jr $ra

triangle:
	# Load the arguments
	# Heigh
	li $v0, 4
	la $a0, high
	syscall
	
	li $v0, 5
	syscall
	
	move $t0, $v0
	# Base
	li $v0, 4
	la $a0, base
	syscall
	
	li $v0, 5
	syscall
	
	move $t1, $v0
	# get the result of (B*H)/2 and return
	mult $t0, $t1
	mflo $v0
	div $v0, $v0, 2
	jr $ra

retangle:
	# Load the arguments
	# Heigh
	li $v0, 4
	la $a0, high
	syscall
	
	li $v0, 5
	syscall
	
	move $t0, $v0
	
	# Base
	li $v0, 4
	la $a0, base
	syscall
	
	li $v0, 5
	syscall
	
	move $t1, $v0
	# get B*H and return
	mult $t0, $t1
	mflo $v0
	jr $ra

