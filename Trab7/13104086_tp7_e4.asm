.data 
array: .word 1, 2, 3, 4, 5
.text
lui $t0, 0x1001
lw $t1, 0($t0)
lw $t2, 16($t0)
or $t3, $t1, $t3
or $t1, $0, $t2
or $t2, $0, $t3
sw $t1, 0($t0)
sw $t2, 16($t0)

lw $t1, 4($t0)
lw $t2, 12($t0)
or $t3, $t1, $0
or $t1, $0, $t2
or $t2, $0, $t3
sw $t1, 4($t0)
sw $t2, 12($t0)
