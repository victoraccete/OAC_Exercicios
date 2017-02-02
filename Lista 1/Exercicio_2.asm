addi $s0, $zero, 3 	# a em $s0. Atribuindo valor qualquer
addi $s1, $zero, 2	# b em $s1. Atribuindo valor qualquer
add  $s2, $zero, $zero 	# x = 0. x em $s2

			# Agora, queremos a express�o a >= 0 && a < b
			# Queremos descobrir se a >= 0, ent�o:
slt  $t0, $s0, $zero 	# se a < 0, t0 = 1. Logo, se a >= 0, t0 = 0
slt  $t1, $s0, $s1	# se a < b, t1 = 1. 
			# Ou seja, para entrar no if devemos ter t0 = 0 e t1 = 0
			
if:			# label para melhorar a legiblidade
bne  $t0, $zero, elseif	# se t0 != 0, ent�o a < 0. Mas quer�amos t0 = 0 (a >= 0), ent�o vai para o elseif
beq  $t1, $zero, elseif	# se t1 = 0, ent�o a >= b. Mas quer�amos t1 = 1 (a < b), ent�o vai para o elseif
addi $s2, $zero, 1	# no if, x = 1
j end			

elseif:			# Para o elseif, queremos a < 0 (t0 = 1) e a > b (t1 = 0 e que b == a seja falso)
beq  $t0, $zero, else 	# Se t0 = 0, ent�o a >= 0. Mas quer�amos a < 0; ent�o vai para o else
addi $t2, $zero, 1	# Gurdando um temp = 1 como auxiliar, em t2
beq  $t1, $t2, else	# Se t1 = 1, ent�o a < b. Mas quer�amos a > b. Por�m, se t1 = 0, a >= b;
beq  $s0, $s1, else	# Ent�o preciamos garantir que a != b. Se a == b, ele vai pro else
addi $s2, $zero, 2	# no elseif, x = 2
j end

else:			# �ltimo caso, sem nenhuma condi��o
addi $s2, $zero, 3	# x = 3
end: