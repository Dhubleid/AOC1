# Load variables
li, $t0, 150
li, $t1, 230
li, $t2, 991
# load arguments
move $a0, $t0
move $a1, $t1
move $a2, $t2 
# subroutine call
jal soma3n
move $t3, $v0
# return
li $v0, 10
syscall

#----------------------Subroutines-----------------------------

# add subroutine that call a recursion 
soma3n:
addiu $sp, $sp, -4 # stack ra
sw $ra, ($sp)

jal soma
move $a0, $a2
move $a1, $v0
jal soma

lw $ra, ($sp)
addiu $sp, $sp, 4 # unstack RA

jr $ra
# ruturn some of 2 integers
soma:	
addu $v0, $a0, $a1
jr $ra
