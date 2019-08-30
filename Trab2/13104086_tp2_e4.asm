# Inicializa os valores e monta a equação 4x - 2y + 3z em $t1, $t2 e $t3
# Neste teste cada registrador estão com o valor 1 deve se trocar os valores dos mesmos para outros casos(Cuidado com overflows) 
# Tambem devido as atuais configuracoes eh necessario duas novas instrucoes para carregar numeros com mais de 16 Bits
# Provavel em caso de numeros negativos
ori $t1, $zero, 0x1 # X
sll $t1, $t1, 2 # 4X
ori $t3, $zero, 0x1 # Z
# Usar t2 como auxiliar para conseguir 3Z
or $t2, $t2, $t3  
sll $t3, $t3, 1 #2Z
# Soma t2(Z) com t3(2Z) 
add $t3, $t3, $t2 #3Z
# t2 agora armazenara Y
ori $t2, $zero, 0x1 # Y
sll $t2, $t2, 1 # 2Y
# Agora eh so somar e subtrair de acordo com a equação resultado sera armazenado em $t7 Obs: Operacoes em C2
add $t7, $t1, $t7
sub $t7, $t7, $t2
add $t7, $t7, $t3  