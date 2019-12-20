.data
y: .space 4
.text
# Variaveis
ori $t0, $zero, 1 # contador
ori $t1, $zero, 0 # soma
ori $t2, $zero, 0x14d # teste
loop:
beq $t0, $t2, fim
addu $t1, $t0, $t1
addiu $t0, $t0, 1
j loop
fim:
addiu $t1, $t1, 0x14d # soma com 333 
lui $t0, 0x1001
sw $t1, 0($t0) 