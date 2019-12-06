.data 
#------------------------------------Usuarios----------------------------------------------
usuario1: .asciiz "Thiago Reis Porto"
senha1: .asciiz "420"
balanco1: .word 0x666
ponteiroExtrato1: .word 0x10040020

usuario2: .asciiz "Morrighan"
senha2: .asciiz "123456"
balanco2: .space 4
ponteiroExtrato2: .word 0x10040040

usuario3: .asciiz "Arch Enemy"
senha3: .asciiz "123456"
balanco3: .space 4
ponteiroExtrato3: .word 0x10040060

enderecos: .word usuario1, senha1, balanco1, usuario2, senha2, balanco2, usuario3, senha3, balanco3

#----------------------------------------Strings----------------------------------------------
menu1: .asciiz "\n1 - Login\n0 - Sair\n"
menu2: .asciiz "\n1 - Balanço\n2 - Deposito\n3 - Saque\n4 - Historico\n5 - Voltar\n"
msg1: .asciiz "\nEntrada Invalida\n"
msg2: .asciiz "\nLOGIN BEM SUCEDIDO\n"
uLgn: .asciiz "\nDigite o usuario:\n"
sLgn: .asciiz "\nDigite a senha:\n"
.text
Menu1:
#----- Login-----Sair----
la $a0, menu1 
li $v0, 4 
syscall
 
#-------Entrada-------
li $v0, 5
syscall

#------casos--------
beq $v0, $0, sair
bne $v0, 1, Menu1
#-------caso 1--------
jal login
beq $v0, $0, erro

li $v0, 4
la $a0, msg2
syscall

add $s0, $s0, 4
jal Menu2

li $v0, 10
syscall

#-------login-------
  
erro:
	li $v0, 4
	la $a0, msg1
	syscall
	j Menu1

sair:
li $v0, 10
syscall

#------------------------------------------SUBROTINAS-----------------------------------------------------
login:
	# v0 retorna 1 se login bem sucedido 0 se nao  
	la $s0, enderecos
	 
	li $t0, 0
	
	addi $sp, $sp, -4
	sw $ra, ($sp)
	
	li $v0, 4
	la $a0, uLgn
	syscall
	
	# Entrada de Usuario 		
	lui $a0, 0x1004 # Endereco no heap para leitura
	li $a1, 32 
	li $v0, 8
	syscall
	
	loopL:
		beq $t0, 3, returnL

		addi $sp, $sp, -4 # guarda t0 na pilha
		sw $t0, ($sp)
		
		lw $s1, ($s0)
		move $a1, $s1
		
		jal comparaString
		
		lw $t0, ($sp) # remove t0 da pilha
		addi $sp, $sp, 4
		
		beq $v0, 1, senha
		addi $s0, $s0, 12
		addi $t0, $t0, 1
		j loopL
	senha:
		
		li $v0, 4
		la $a0, sLgn
		syscall
		
		lui $a0, 0x1004 # Endereco no heap para leitura
		li $a1, 32 
		li $v0, 8
		syscall

		addi $s0, $s0, 4
		lw $s1, ($s0)
		move $a1, $s1
						
		jal comparaString
		
	returnL:
		lw $ra, ($sp) # remove ra da pilha
		addi $sp, $sp, 4
		jr $ra
	
	
	
#----------------------------------------------------------------------------------------------------------------
		 
comparaString: 
	#a0 = string de entrada
	#a1 = string de entrada
	#return : $v0 = 1 strings iguais, 0 se nao
	loop: 
		lb $t1, ($a0) 						
		lb $t0, ($a1) 						
		beq $t0, $0, fim			# fim caso t0 = '\0'
		bne $t0, $t1, nIgual			# testa igualdade
		addi $a0, $a0, 1
		addi $a1, $a1, 1
		beq  $t0, $t1, loop 		
	nIgual:
		li $v0, 0				# return 0
		jr $ra              	 		
	fim:
		bne $t1, 10, nIgual			# Entrato tem espaco antede do \0
		li $v0, 1	             		# return 1
		jr $ra              	 		
		

#---------------------------------------------------------------------------------------------------
Menu2:
		
	lw $a1, ($s0)		# Carrega ponteiro balanco

		or $t4, $0, $0
		lw $t1, 4($a1)		# Carrega ponteiro extrato
		la $t3, 4($t1)		# Carrega ponteiro a frente do ponteiro do extrato
	
loopM2:
	beq $t4, 4, resetaPonteiro
	
	li $v0, 4		# printa string do menu
	la $a0, menu2
	syscall
	
	li $v0, 5  		# Entrada
	syscall
	
	beq $v0, 2, dep
	beq $v0, 3, saq
	beq $v0, 4, ext
	beq $v0, 5, voltar
	bne $v0, 1, loopM2
	
#-------------------Caso 1-------------------BALANCO DA CONTA-------------------
	# Printa o balanço
	lw $a0, ($a1)		# Carrega valor do balanco
	li $v0, 1
	syscall
	
	li $v0, 5
	syscall
	
	j loopM2	
#------------------Caso 2----------------------DEPOSITO--------------------------
dep:
	li $v0, 5
	syscall
	lw $a0, ($a1)		# Carrega valor do balanco	
	addu $a0, $a0, $v0 	# Soma valor de deposito no balanco 
	sw $a0, ($a1)		# armazena novo balanco	
	ori $t0, $0, 1		# cod de deposito para t0
	sb $t0, ($t1)		# armazena t0 no historico
	addi $t1, $t1, 1	# incrementa ponteiro do historico
	addi $t4, $t4, 1 	# incrementa cont.
	sw $v0, ($t3)		# armazena valor deposito
	addi $t3, $t3, 4	# incrementa ponteiro balanco historico

	j loopM2	
#-------------------Caso 3------------------SAQUE--------------------------------
saq:
	li $v0, 5
	syscall
	
	ori $t0, $0, 2		# cod de saque para t0
	sb $t0, ($t1)		# armazena t0 no historico
	addi $t1, $t1, 1	# incrementa ponteiro do historico
	addi $t4, $t4, 1 	# incrementa cont
	sw $v0, ($t3)		# armazena valor saque
	addi $t3, $t3, 4	# incrementa ponteiro balanco historico
	
	lw $a0, ($a1)		# Carrega valor do balanco	
	subu $a0, $a0, $v0 	# Subtrai valor de saque do balaco
	sw $a0, ($a1)		# Armazena novo balanco
	
	j loopM2	
	
#---------------Caso 4---------------------Historico da Conta---------------------
ext:	
	beq $t4, $0 loopM2
	
	lw $t5, 4($a1)		# Carrega ponteiro extrato
	la $t6, 4($t5)		# Carrega ponteiro a frente do ponteiro do extrato	
loopH:
	beq $t7, $t4, loopM2
	lb $a0, ($t5)
	li $v0, 1
	syscall
	
	lw $a0, ($t6)
	li $v0, 1
	syscall
	
	addi $t7, $t7, 1
	addi $t5, $t5, 1
	addi $t6, $t6, 4
	
	j loopH
#------------------------------------Caso 5-----------------------------------
voltar:
	jr $ra