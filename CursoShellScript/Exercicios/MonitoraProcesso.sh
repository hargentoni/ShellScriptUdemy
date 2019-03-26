#!/bin/bash
# Exercício 2 de loop

# Crie um script que receba um nome de processo como argumento e que
# constantemente irá verificar se o processo está em execução.
# Caso não esteja, deve ser exibida uma mensagem na sessão do usuário a cada
# x segundos.
# O processo deve rodar como Daemon, ou seja, deve estar sempre em
# execução, verificando o processo em questão a cada x segundos.

if [ $# -eq 0 ]
then
	echo "Informe alguma valor"
	echo "Exemplo: ./MonitoraProcesso.sh <nome do processo>"
	exit 1
fi


while true
do
	if  ps aux |grep $1|grep -v grep|grep -v $0 > /dev/null
	then
		sleep 2
	else	
		echo "ATENÇÃO!! O processo $1 não esta em execução!"
		sleep 2
	fi
done


