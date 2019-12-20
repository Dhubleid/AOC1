.data
a: .word 3
b: .word 5
y: .space 4
.text
# inicializa t0 com 1001000
lui $t0, 0x1001
# carrega as words
lw $t1, 0($t0)
lw $t2, 4($t0)
# multiplica "a" e "b" e armazena em t3 depois mutiplica t3 por 32
multu $t1,$t2
mflo $t3
sll $t3, $t3, 5
# multiplica t1 por -3 e armazena em t8
addi $t8, $zero, -3
mult $t8, $t1
mflo $t8
# soma 32ab - 3a
add $t3, $t3, $t8
# -7b
addi $t8, $zero, 7
mult $t8, $t2
mflo $t8
# soma 32ab - 3a + 7b
add $t3, $t3, $t8
# carrega a word na memoria
sw $t3, 8($t0)
