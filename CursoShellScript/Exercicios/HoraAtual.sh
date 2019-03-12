#!/bin/bash

# Exercício de Instruções Condicionais IF e CASE.

# Crie um script que baseado no horário atual escreva...
# Bom dia, Boa tarde ou Boa noite. Considere que o começo do dia às 06:00.
# O mesmo script deve mostrar trambém a hora atual no formato de 0 a 12...
# Indicando AM ou PM.
# Exemplo de Execução:
# Boa tarde!
# A hora atual é: 3:39 PM


HORA=$(date +%H)
MIN=$(date +%M)
if [ $HORA -ge 6 -a $HORA -le 11 ]
then
		echo "Bom dia!"
	elif [ $HORA -ge 12 -a $HORA -le 17 ]
	then
		echo "Boa tarde!"
	else
		echo "Boa noite!"
fi


if [ $HORA -ge 6 -a $HORA -le 11 ]
then
	AMPM=AM
else
	AMPM=PM
	
fi

echo
H=$(date +%I)	
echo "A hora atual é: $HORA:$MIN $AMPM"
