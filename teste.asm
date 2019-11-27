.data 
string1: .asciiz "Casa A"
string2: .asciiz "Casa"
string3: .asciiz "Casa B"
string4: .asciiz "CasaA"
.text

la $a0, string1
la $a1, string2
jal StringCompare
move $t7, $v0
li $v0, 10
syscall

###############################################################
# Subroutinas

StringCompare: 
	#a0 = string de entrada
	#a1 = string de entrada
	#return : $v0 = 0 strings iguais, diferente de 0 strings diferentes
	loop: 
		lb $t0, ($a0) 						
		lb $t1, ($a1) 						
		beq $t0, 0, fim				# fim caso t0 = '\0'
		bne $t0, $t1 nIgual			# testa igualdade
		addi $a0, $a0, 1
		addi $a1, $a1, 1
		beq  $t0, $t1, loop 		
	nIgual:
		li $v0,1				# return 1
		jr $ra              	 		
	fim:		
		li $v0, 0	             		# return 0
		jr $ra              	 		
		

###############################################################