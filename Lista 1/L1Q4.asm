main:
# a0 � onde come�a e a1 � onde termina #
addi $a0, $zero, 1	# a como a0
addi $a1, $zero, 4	# b como a1
addi $t1, $zero, 1	# auxiliar de valor 1

# TRATANDO AS ENTRADAS
slt $t0, $a1, $a0 		# se b < a, t0 = 1
beq $t0, $t1, wronginput	# se t0 = 1, a entrada foi errada.
beq $a0, $a1, samenumbers	# caso sejam iguais, o tratamento ser� diferente

# OBS: considerei o intervalo aberto (a range seria come�ando em a e terminando em b)
# ou seja, todos os valores, incluindo a e b.
sum:
add $v0, $v0, $a0	# v0 += a; somando no endere�o de retorno
beq $a1, $a0, end	# se a, que est� sendo incrementado a cada chamada, finalmente chegar a b, para de rodar.
addi $a0, $a0, 1	# incrementando 1 a a
jal sum			# chamada recursiva ap�s o incremento

wronginput:
addi $v0, $zero, 1	# caso a entrada seja inv�lida, o retorno ser� 1

samenumbers:
add $v0, $a0, $a1	# caso sejam iguais, vai retornar a soma dos dois 

end: