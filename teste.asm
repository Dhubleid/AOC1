.data 
login1: .asciiz "Vai toma no cu"
login2: .asciiz "123456"
menu1: .asciiz "\n1 - Login\n0 - Sair\n"
menu2: .asciiz "\n1 - Balanço\n2 - Deposito\n3 - Saque\n4 - Extrato\n5 - Voltar\n"
msg1: .asciiz "\nEntrada Invalida\n"

.text
Men1:
#----- Login-----Sair----
la $a0, menu1 
li $v0, 4 
syscall
#----Entrada----
li $v0, 5
syscall


beq $v0, $0, sair 

la $a0, 0x10040000 # Endereco no heap para leitura
li $a1, 30
li $v0, 8
syscall

move $a1, $a0 # Compara
la $a0, login1
jal comparaString

beq $v0, $0, igual
la $a0, msg1 # Strings Diferente Entrada invalida
li $v0, 4 
syscall

igual:

la $a0, menu2 # Segundo Menu
li $v0, 4 
syscall  

sair:
li $v0, 10
syscall

###############################################################
# Subroutinas

comparaString: 
	#a0 = string de entrada
	#a1 = string de entrada
	#return : $v0 = 0 strings iguais, diferente de 0 strings diferentes
	loop: 
		lb $t0, ($a0) 						
		lb $t1, ($a1) 						
		beq $t0, $0, fim			# fim caso t0 = '\0'
		bne $t0, $t1, nIgual			# testa igualdade
		addi $a0, $a0, 1
		addi $a1, $a1, 1
		beq  $t0, $t1, loop 		
	nIgual:
		li $v0,1				# return 1
		jr $ra              	 		
	fim:
		bne $t1, 10, nIgual			# Entrata tem espaco antede do \0
		li $v0, 0	             		# return 0
		jr $ra              	 		
		

###############################################################