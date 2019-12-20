.data
n: .word 10
.space 4

.text
lui $t0, 0x1001
lw  $t1, 0($t0) # valor de n do fatorial e contador  
ori $t2, $zero, 1 # variavel fatorial restultado
# Aux t3 
ori $t3, $zero, 1 
loop:
beq $t1, $zero, fim
mult $t1, $t2
mflo $t2
sub $t1, $t1, $t3
j loop
fim:
sw $t2, 4($t0)

  