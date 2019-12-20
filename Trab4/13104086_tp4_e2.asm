.data
a: .word 3
y: .space 4
.text
# inicializa t0 com 10010000 e carrega a word em t1
lui $t0, 0x1001
lw $t1, 0($t0)
# soma -5 + 9a
addi $t2, $zero, 9
mult $t2, $t1
mflo $t2
addi $t2, $t2, -5
# soma 7 + a(-5 +9a)
mult $t2, $t1
mflo $t2
addi $t2, $t2, 7
# soma 15 + a(7 + a(-5 +9a))
mult $t1, $t2
mflo $t2
addi $t2, $t2, 15
# carrega a word resultado na memoria
sw $t2, 4($t0)