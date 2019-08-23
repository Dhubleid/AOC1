ori $t1, $zero, 0x01 
sll $t2, $t1, 1 #shifta para esquerda e armazena em t2
or $t1, $t1, $t2 #junta o resultado de t2 e t1
sll $t2, $t1, 1 
or $t1, $t1, $t2
sll $t2, $t1, 1
or $t1, $t1, $t2
sll $t2, $t1, 4 #shifta para esquerda e armazena em t2 agora com um f
or $t1, $t1, $t2
sll $t2, $t1, 8 #shifta para esquerda e armazena em t2 agora com um 2f
or $t1, $t1, $t2
sll $t2, $t1, 16 #shifta para esquerda e armazena em t2 agora com um 4f
or $t1, $t1, $t2 #resultado final