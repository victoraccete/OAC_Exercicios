main:
addi $sp, $sp, -4	# reservando um lugar na pilha
sw   $ra, 0($sp)	# salva o endereço de retorno
addi $a0, $zero, 3	# a0 guarda o parâmetro da função
jal  fib


lw $ra, 0($sp)		# recupera o endereço de retorno salvo
addi $sp, $sp, 4	# reestabelece a pilha

fib:
addi $sp, $sp, -12	# reservando mais 3 lugares na filha
sw $s0, 0($sp)		# salvando o conteúdo de s0 e
sw $s1, 4($sp)		#			 s1 na pilha
sw $ra, 8($sp)		# e salvando o endereço de retorno atual

			# if (a < 2) return 1
slti $t0, $a0, 2	# se o argumento a < 2, t0 = 1.
beq  $t0, $zero, else	# se t0 = 0, então a >= 2. Assim, ele vai pro else
addi $v0, $zero, 1	# "retorna" 1
j return

else:			# fib(n-1) + fib(n-2)
addi $s0, $a0, 0	# armazenando o valor do argumento a em s0 também
addi $a0, $a0, -1	# a = (a-1) para chamar a primeira recursão
jal fib			

addi $s1, $v0, 0 	# s1 armazena o conteúdo de v0, que é o retorno
addi $a0, $s0, -2	# a = (a-2) para chamar a segunda recursão
jal fib

add $v0, $s1, $v0 	# Somando os resultados das recursões 

return: 		# carrega todas as palavras salvas de volta
lw $s0, 0($sp) 
lw $s1, 4($sp)
lw $ra, 8($sp)
addi $sp, $sp, 12 	# reestabelece a pilha
jr $ra  		# retorna 	
