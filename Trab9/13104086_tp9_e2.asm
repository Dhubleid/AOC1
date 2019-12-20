#----------------------------------------Recursion Fatorial--------------------------------------------------------
# load the value to calculate fat
li $t0, 4
move $a0, $t0
# call of subroutine and return stored in t1
jal fat
move $t1, $v0 

li $v0, 10 # return
syscall

#-------------------------Subroutines--------------------------------

fat:	# Stack RA and S0( Values in fat that could be lost in the recursion)
	addiu $sp, $sp, -4
	sw $s0, ($sp)
	addiu $sp, $sp, -4
	sw $ra, ($sp)
	# if its zero return 1 else countinues and call recursion
	bne $a0, $0, nonZero
	li $v0, 1
	j return
	
	nonZero:
		# stack value of n
		move $s0, $a0
		addi $a0, $a0, -1
		jal fat
		# exit recursion with the multiplications
		mult $s0, $v0
		mflo $v0
		# end of rubroutine and each recursion call 	
	return: 
		lw $ra, ($sp)
		addiu $sp, $sp, 4
		lw $s0, ($sp)
		addiu $sp, $sp, 4
		jr $ra
