.data
msg1: .asciiz "Enter the amount of numbers:\n"
msg2: .asciiz "Enter the number:\n"
msg3: .asciiz "Even Sum: "
msg4: .asciiz "\nNumber of evens: "
.text

# Read ammount of numbers
la $a0, msg1
li $v0, 4
syscall

li $v0, 5
syscall

#---read numbers--- 
move $a0, $v0
move $s1, $v0
la $a1, 0x10010060 # adress to store numbers
move $s0, $a1 # save adress

jal readNumbers

#-------evenSum------
move $a1, $s0
jal evenSum

move $t0, $v0 # t0 = sum of evens

la $a0, msg3 
li $v0, 4
syscall

move $a0, $t0 # print sum
li $v0, 1
syscall

la $a0, msg4
li $v0, 4
syscall

move $a0, $v1 # print number of evens
li $v0, 1
syscall

li $v0, 10 # exit
syscall

#-----------------Subroutines-----------------------------

readNumbers: # arguments: a0 = numbers to read, a1 = memory adress 
	li $t0, 0
	move $t2, $a0
	loopRead:
		beq $t0, $t2, return # end loop 
	
		la $a0, msg2
		li $v0, 4
		syscall
	
		li $v0, 5
		syscall
			
		sw $v0,($a1)
		addi $a1, $a1, 4
		addi $t0, $t0, 1
		
		j loopRead
	
	return:
		jr $ra

#----------------------------------------------------------------

evenSum: # arguments : a0 = number ammount, a1: memory adress, return: v0 = sum of even numbers, v1 = ammount of even numbers  
	li $t0, 0
	li $t1, 0
	li $t2, 0
	li $t3, 0
	li $t4, 2
	
	loopE:
		beq $t0, $s1, evenReturn
	
		lw $t1, ($a1)
		div $t1, $t4
		
		mfhi $t5 
		bne $t5, $0, odd
		add $t2, $t2, $t1 # even case 
		addi $t3, $t3, 1
	
	odd:
		addi $a1, $a1, 4
		addi $t0, $t0, 1
		j loopE
		
	evenReturn:
		move $v0, $t2
		move $v1, $t3
		jr $ra
		
#-----------------------------------------------------------------
		
