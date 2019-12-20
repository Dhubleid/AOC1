.data
x: .word 7
y: .space 4
.text
lui $t0, 0x1001
lw $t1, 0($t0)
# Variaveis:
#	t2  = Contador, t3 =  Soma Fibonacci, t4 = Aux1, $t5 = Aux2  
ori $t5, $zero, 1
loop:
beq $t2, $t1, fim 
or $t4, $zero, $t3 # Armazena valor atual em soma
addu $t3, $t3, $t5 # Soma de fibbonacci
or $t5, $zero, $t4 # Passao valor na aux comantigo valor da soma para t4 
addiu $t2, $t2, 1  # incrementa o contador
j loop
fim: 
sw $t3, 4($t0)