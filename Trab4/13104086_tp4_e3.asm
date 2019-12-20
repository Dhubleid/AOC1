.data
a: .word -3
b: .word 7
c: .word 5
d: .word -2
e: .word 8
x: .word 4
y: .space 4
.text
# inicializa 10010000 em t0 e carrega as words
lui $t0, 0x1001
lw $t1, 0($t0) # a
lw $t2, 4($t0) # b
lw $t3, 8($t0) # c
lw $t4, 12($t0)# d 
lw $t5, 16($t0)# e
lw $t6, 20($t0)# x
# x(b - ax)
mult $t1, $t6
mflo $t7
sub $t7, $t2, $t7
mult $t6, $t7
mflo $t7
# x(-c + x(b - ax))
sub $t7, $t7, $t3
mult $t7, $t6
mflo $t7
# d + x(-c + x(b - ax))
add $t7, $t4, $t7
# -e + x(d + x(-c + x(b - ax)))
mult $t6, $t7
mflo $t7
sub $t7, $t7, $t5
# armazena a word resultante
sw $t7, 24($t0)