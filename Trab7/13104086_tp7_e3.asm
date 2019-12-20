.data 
array: .word 1, 3, 5, 5, 6, 6, 7, 8, 9, 10
.text
lui $t1, 0x1001
li $t2, 9
loop:
beq $t2, $0, fim 
lw $t3, 0($t1)
lw $t4, 4($t1)
addi $t4, $t4, 1
slt $t0, $t3, $t4
beq $t0, $0, fim
addi $t1, $t1, 4
addi $t2, $t2, -1
j loop
fim:
