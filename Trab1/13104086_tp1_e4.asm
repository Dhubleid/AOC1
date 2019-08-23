ori $t1, $zero, 0x1234  #Carrega o valor 
sll $t1, $t1, 16	
ori $t1, $t1, 0x5678	#Carrega o valor 
srl $t2, $t1 28 #shifta e coloca 1 em t2
sll $t1, $t1 4 
srl $t3, $t1 28 #usa t3 como auxiliar e coloca o valor 1
sll $t3, $t3 4
or $t2, $t2, $t3 #valor 2
sll $t1, $t1 4 
srl $t3, $t1 28 #valor 3
sll $t3, $t3 8
or $t2, $t2, $t3
sll $t1, $t1 4 
srl $t3, $t1 28 #valor 4
sll $t3, $t3 12
or $t2, $t2, $t3
sll $t1, $t1 4 
srl $t3, $t1 28 #valor 5
sll $t3, $t3 16
or $t2, $t2, $t3
sll $t1, $t1 4 
srl $t3, $t1 28 #valor 6
sll $t3, $t3 20
or $t2, $t2, $t3
sll $t1, $t1 4 
srl $t3, $t1 28 #valor 7
sll $t3, $t3 24
or $t2, $t2, $t3
sll $t1, $t1 4 
srl $t3, $t1 28 #valor 8
sll $t3, $t3 28
or $t2, $t2, $t3