# y = 3x^2 - 5x + 13
addi $t5, $zero, 0x2
mul $t1, $t5, $t5
ori $t2, $zero, 0x5
mul $t2, $t2, $t5
sub $t6, $t1, $t2
addi $t6, $t6, 0xD
# Se for utilizado "ori", nos numeros negativos ou positivos com mais de 16 bits eh necessario um shift, e
# e eh necessario armazenar de 16 em 16 bits, com "addi" numeros positivos com 16bits como "ffff" tambem eh necessario um shift e outra instrucao