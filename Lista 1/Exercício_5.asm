# FAZENDO AS ATRIBUIÇÕES #
addi $s0, $zero, -3	# atribuindo um valor a s0
addi $s1, $zero, 0	# atribuindo um valor a s1
addi $s2, $zero, 0	# registrador que vai guardar o resultado
addi $t0, $zero, 0 	# contador t0

# SE A MULTIPLICAÇÃO FOR POR 0, PULA PARA O LABEL END #
# antes que qualquer atribuição seja feita a s2, ele vai para o fim
beq $s0, $zero, end 
beq $s1, $zero, end	

# CHECANDO SE O SEGUNDO É NEGATIVO #
slt $t1, $s1, $zero		# se s1 < 0, então t1 = 1
bne $t1, $zero, second_negative	# se t1 != 0, então t1 = 1. Então s0 < 0. 

mult_add:
add  $s2, $s2, $s0  		# fazendo uma das somas. s2 = s2+s0
addi $t0, $t0, 1      		# incrementando o contador
bne  $s1, $t0, mult_add 	# se já tiver sido somado s1 vezes, t0 e s1 serão iguais. 
j end				# se já tiver sido somado todas as vezes, vai para o fim da execução

second_negative:
sub $s2, $s2, $s0 		# caso o segundo seja negativo, ele vai fazer subtrações
addi $t0, $t0, -1		# e vai incrementar decrementar 1 do contador
bne  $s1, $t0, second_negative  # e vai repetir até que todas as subtrações tenham sido feitas
j end

end:				# faz o store double e então finaliza
sd $s2, 0($s2)