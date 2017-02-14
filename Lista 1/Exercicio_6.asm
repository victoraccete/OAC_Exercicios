# int fib(int n){
#	if(n <= 1) return n;
#	else return fib(n-1) + fib(n-2);
# }

addi $a0, $zero, 3	# passando n = 4 como argumento da fun��o 
addi $t0, $zero, 1 	# definindo um auxliar como 1

fib:
bgt $a0, $t0, recursion	# se n for maior que um (ou seja, n�o for <= 1), vai para a recurs�o
#add $v0, $a0, $zero	# coloca o valor do argumento no valor de retorno v0
move $v0, $a0
jr $ra			# voltando para o endere�o de retorno

recursion:
addi $sp, $sp, -12	# tamanho para salvar 3 itens 
sw $ra, 0($sp) 		# salvando o endere�o de retorno na pilha
sw $a0, 4($sp)		# salvando 'n' no estado atual na pilha

# PRIMEIRA CHAMADA RECURSIVA fib(n-1)
addi $a0, $a0, -1	# (n-1)
jal fib			# chamando a recurs�o
lw $a0, 4($sp)		# restaura n para o estado anterior
sw $v0, 8($sp)		# salvando o valor retornado na pilha de fib(n-1)

# SEGUNDA CHAMADA RECURSIVA fib(n-2)
addi $a0, $a0, -2	# (n-2)
jal fib			# chamando a recurs�o

# se n�o salvarmos o valor que foi guardado da primeira recurs�o fib(n-1), a segunda recurs�o fib(n-2) vai sobrescrever
# se sobrescrever, n�o poderemos fazer a soma depois, ent�o vamos salvar o retorno de fib(n-1) em t0
lw $t1, 8($sp)

# AGORA, TEMOS fib(n-1) EM t1 E fib(n-2) EM v0, TEMOS QUE SOMAR
add $v0, $t1, $v0	# o retorno da fun��o � a soma de fib(n-1) e fib(n-2)

lw $ra, 0($sp)		# restaurando o endere�o de retorno 
addi $sp, $sp, 12	# restaurando a pilha
jr $ra