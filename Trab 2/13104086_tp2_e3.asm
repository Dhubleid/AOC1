#Inicializar $t0 com 7000 0000 HEX
ori $t0, $zero, 0x7000
sll $t0, $t0, 16
#Soma $t0 + $t0
addu $t0, $t0, $t0
#Resultado: E000 0000 HEX 
#Não em C2 estaria incorreto e haveria overflow pois os ultimos dois bits de carry são diferentes.
#Se a soma for feita com a instrucao add, a soma eh considerada em C2 e portando eh encontrado um overflow nesta soma