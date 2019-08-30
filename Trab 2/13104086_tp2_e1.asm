#Coloca 326 em $t0 e 211 em $t1
ori $t0, $zero, 0x146 
ori $t1, $zero, 0xD3 
#inverte $t1 e soma 1 resultando no complemento de 2: Neste Caso -211
nor $t1, $t1, $zero
addi $t1, $t1, 0x1 
#soma $t0 e $t1
add $t0, $t0, $t1 
#Repetir procedimento da linha 3 ate 8 para restande dos numeros para soma de negativos 
#311
addi $t0, $t0, 0x137 
#-684
ori $t1, $zero, 0x2AC
nor $t1, $t1, $zero
addi $t1, $t1, 0x1
add $t0, $t0, $t1 
#Resultado Final:
# Decimal: -258 Hexadecimal: FFFF FEFE Complemento de 2