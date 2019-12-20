ori $t1, $0, 2047
ori $t2, $0, 32
ori $t4, $0, 1
loop:
beq $t2, $zero, fim
srl $t3, $t1, 31
beq $t3, $zero, prox
j fim
prox:
sub $t2, $t2, $t4
sll $t1, $t1, 1
j loop
fim: