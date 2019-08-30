#Inicializa $t7 com 1
ori $t7, $zero, 0x1
#Deloca para esquerda 5 bits = multiplicar por 32
sll $t7, $t7, 5 