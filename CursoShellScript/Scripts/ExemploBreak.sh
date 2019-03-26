#!/bin/bash

# Exemplo de uso da Instrução Break no laço de repetição

read -p "Qual é o(a) melhor aluno(a): " MELHOR

for i in $(cat ../arquivos/alunos.txt)
do
	if [ $i = $MELHOR ] 
	then
		echo "$i é o melhor(a) aluno(a)" 
		break
	fi
	echo "Aluno(a): $i"
done

