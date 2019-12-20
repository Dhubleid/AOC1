.data 
string: .space 30
msg: .asciiz "Enter the string to invert case:\n"

.text

la $a0, msg
li $v0, 4
syscall

lui $a0, 0x1001 # string adress
li $a1, 30 # size max string

li $v0, 8
syscall

jal caseChange

lui $a0, 0x1001
li $v0, 4
syscall

li $v0, 10
syscall
#--------------------subroutines-----------------------------------

caseChange: # change case of given string
# Arguments: a0 = stringadress
# t0 - flag to check if smaller
	lb $t1, ($a0)
	beq $t1, $0, return # /0 case
	
	slti $t0, $t1, 123
	beq $t0, $0, prox # bigger than z
	slti $t0, $t1, 97 
	bne $t0, $0, bCase
	# lower case
	addi $t1, $t1, -32
	sb $t1, ($a0)
	j prox
	
	bCase:
		slti $t0, $t1, 91
		beq $t0, $0, prox
		slti $t0, $t1, 65
		bne $t0, $0, prox # smaller than A
		# bigger case
		addi $t1, $t1, 32
		sb $t1, ($a0)
	prox:
		addi $a0, $a0, 1
		j caseChange
	return:
		jr $ra	
	 
