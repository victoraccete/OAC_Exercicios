addi $s0, $zero, 2	# a = 2 está em s0
addi $s1, $zero, 1	# b = 1 está em s1
addi $s2, $zero, 0	# m = 0 está em s2
add  $s2, $s0, $zero	# m = a
slt  $t0, $s1, $s2	# se b < m, t0 = 1
beq  $t0, $zero, else	# se b < m for falso, t0 = 0, então ele vai pro else
if: 			# label apenas para melhorar a legibilidade do código
add $s2, $s1, $zero 	# se não for pro else, m = b
j end			# encerra depois do if, não vai pro else
else:	
addi $s2, $zero, 0 	# no else, m = 0
end:			# label guardando o fim do programa