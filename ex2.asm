ori $t1, $zero, 0xAAAA #4 valores sendo colocado no registrador t1
sll $t1, $t1, 16 #Shift para liberar espaço para os 4 novos valores
ori $t1, $t1, 0xAAAA
srl $t2, $t1, 1 #shifta para direita t1 (divide por 2) e armazena em t2 
or $t3, $t1, $t2 #armazena o resultado da or entre t1 e t2 em t3
and $t4, $t1, $t2 #armazena o restultado da and entre t1 e t2 em t4
xor $t5, $t1, $t2 #armazena o restultado da xor entre t1 e t2 em t5
# Resultados:
# t1 = AAAAAAA 
# t2 = 5555555 dividiu por 2
# t3 = fffffff 
# t4 = 0000000
# t5 = FFFFFFF
