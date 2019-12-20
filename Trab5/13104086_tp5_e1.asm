.data
a: .half 30
b: .half 5
y: .space 4
.text
lui $t0, 0x1001	# Carrrega t0 com  primeiro endereco de memoria
lh $t1, 0($t0)	# Carrrega half word
# Carregar a word e depois dar shift para obter a half word mais significativa
lw $t2, 0($t0)
srl $t2, $t2, 16
# Dividir caso diferentes as half words e mult caso contrario
beq $t1, $t2, equal
div $t1, $t2
mflo $t1
sw $t1, 4($t0)
j fim
equal:
mult $t1, $t2
mflo $t1
sw $t1, 4($t0)
fim: