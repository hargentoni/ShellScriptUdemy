#!/bin/bash

read -p "Informe o limite de processos: " MAXIMO
echo

while [ $(ps -aux |wc -l) -le $MAXIMO]
do
	echo "Tudo Ok"
	echo "Processos atuais: $(ps -aux |wc -l)"
	sleep 3
done
echo
echo "O limite de processos foi excedido"


