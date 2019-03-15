#!/bin/bash
# Exercício 3 
# Estrutura de Condicionais CASE e IF
# 15/03/2019

# Crie um script que receba do usuário 2 valores e em seguida exiba um menu
# para ele escolha uma das 4 principais operações aritmétricas (soma,
# subtração, multiplicação e divisão). Após isso a operação e o resultado são
# exibidos ao usuário.
# Considere que:
#• O script deve validar e abortar a execução caso algum dos valores não
# seja informado
#• No caso de multiplicação, o script deve exibir uma mensagem de erro
# caso um dos valores seja 0, e então abortar
#• No caso de divisão, o script deve exibir uma mensagem de erro caso um
# dos valores seja 0, e então abortar
#• Também no caso de divisão, o script deve exibir se é uma divisão exata
# ou com resto.




read -p "Informe o primeiro Valor: " V1
read -p "Informe o segundo Valor: " V2

if [ "$V1" = "" ] || [ "$V2" = "" ]
then
	echo "Não foi Informado um valor válido"
	exit 1
fi

echo
echo
echo "Escolha uma Operação:"
echo "1 = Soma"
echo "2 = Subtração"
echo "3 = Multiplicação"
echo "4 = Divisão"
echo "Q = Sair"
echo
read -p "Opção: " OPCAO
echo

case $OPCAO in
	1)
		OPER="+"
		;;
	2)
		OPER="-"
		;;
	3)
		if [ "$V1" -eq 0 ] || [ "$V2" -eq 0 ]
		then
			echo "0 não é um valor válido!"
			exit 1
		fi
		OPER="*"
		;;
	4)
		
		if [ "$V1" -eq 0 ] || [ "$V2" -eq 0 ]
		then
			      
			echo "0 não é um valor válido!"
			exit 1
		fi
		
			if [ $(expr $V1 % $V2) -ne 0 ]
			then
				echo "Divisão com resto = $(expr $V1 % $V2)"
			else
				echo "Divisão Exata"

		fi
		OPER="/"
		;;
	[Qq])
		echo "Saindo..."
		exit
		;;
	*)
		echo "Opção Inválida"
		exit 1
		;;

esac

echo "$V1 $OPER $V2 = $(expr $V1 "$OPER" $V2)"
		

