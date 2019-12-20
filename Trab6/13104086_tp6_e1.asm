.data
.word 1
.word 2
.word 3
.word 4
.word 5
.word 6
.word 7
.word 8

.text
lui $t0, 0x1001
# $t1 - Contador, $t2 - Aux, $t3 - Aux2, $t0 acesso do vetor
loop:
ori $t2, $zero, 7 
beq $t1, $t2, fim # Condicao de parada do loop
ori $t2, $zero, 2 
div $t1, $t2 
mfhi $t2 
bne $t2, $zero, resto  # Teste se o resto da divisao eh zero
sll $t2, $t1, 1
sw $t2, 0($t0)
addi $t1, $t1, 1 # Incrementa contador 
addi $t0, $t0, 4  # Incrementa endereco do vetor
j loop
resto:
lw $t2, 0($t0)
lw $t3, -4($t0)
addu $t2, $t2, $t3
sw $t2, 0($t0)
addi $t1, $t1, 1 # Incrementa contador
addi $t0, $t0, 4 # Incrementa endereco do vetor
j loop
fim:
