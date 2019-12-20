# reading arrays
# t0 loop control
la $t1, 0x10010000
reading1:
	beq $t0, 5, next1 # count test
	li, $v0, 5
	syscall
	
	sw $v0, ($t1)
	addi $t1, $t1, 4
	addi $t0, $t0, 1
	j reading1
next1:
	li $t0, 0  	# count = 0
reading2: 
	beq $t0, 5, next2 # count test
	li, $v0, 5
	syscall
	
	sw $v0, ($t1)
	addi $t1, $t1, 4
	addi $t0, $t0, 1
	j reading2
next2:
	li $t0, 0
	la $t2, 0x10010000
	or $s0, $0, $t1		# copy addres of new array 
concat:
	beq $t0, 10, print	# count test
	lw $t3, ($t2)		# load from array to concatenat 
	sw $t3, ($t1)		# store in new array
	addi $t1, $t1, 4
	addi $t2, $t2, 4
	addi $t0, $t0, 1
	j concat
print:
	beq $t0, 0, end
	lw $a0, ($s0)	# getting values and printng array
	li $v0, 1
	syscall
	
	addi $s0, $s0, 4
	addi $t0, $t0, -1
	j print
end:
