#!/bin/bash

#Informe o nome do arquivo a ser criado: arquivo_teste.out
#Informe um conjunto de caracteres que será usado para preencher o arquivo: a
#Informe o tamanho final do arquivo (em bytes): 100000

read -p "Informe o nome do arquivo a ser criado: " ARQUIVO
read -p "conjunto de caracteres que será usado p/ preencher o arquivo: " PALAVRA
read -p "Informe o tamanho final do arquivo (em bytes):  " TAMANHO

cat /dev/null > $ARQUIVO
PORC_EXIBIDA=0

while [ $TAMANHO -ge $(stat --printf=%s "$ARQUIVO") ]
do
	echo -n $PALAVRA >> $ARQUIVO
	TAMANHO_ATUAL=$(stat --printf=%s "$ARQUIVO")

	PORC_ATUAL=$(expr $TAMANHO_ATUAL \* 100 / $TAMANHO)

	if [ $(expr $PORC_ATUAL % 10) -eq 0 -a $PORC_EXIBIDA -ne $PORC_ATUAL ]
	then
		echo "Concluído: $PORC_ATUAL% - Tamanho do Arquivo: $TAMANHO_ATUAL"
		PORC_EXIBIDA=$PORC_ATUAL
	fi
done


