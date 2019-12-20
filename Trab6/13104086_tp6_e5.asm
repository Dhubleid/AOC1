# valores vetor
.data
.word 5
.word 5
.word 5
.word 5
.word 5
.word 5

.text
addi $s0, $s0, 1  # valor 1
addi $s1, $s1, 5 #  valor 2
addi $s1, $s1, 1 # soma 1 para  slt
addi $s4, $s4, 6  # tamnanho do vetor
lui $s3, 0x1001 # endereco do vetor

# t0 contador - t1 flag - $t2  aux - $t3
loop:
beq $t3, $s4, fim
lw $t2, 0($s3) 
slt $t1, $t2, $s1
beq $t1, $zero, prox
slt $t1, $t2, $s0
bne $t1, $zero, prox
addiu $t0, $t0, 1 
prox:
addiu $s3, $s3, 4
addiu $t3, $t3, 1 
j loop
fim:
# resultado final no contador em t0 

