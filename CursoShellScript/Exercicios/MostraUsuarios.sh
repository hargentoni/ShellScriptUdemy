#!/bin/bash

# 1 - Exerício de Instruções de Loop

# Crie um script que mostre todos os usuários “humanos” da máquina seguidos...
# de seu UID, Diretório Home e Nome/Descrição.

#Dicas:
#• Baseie-se pelas informações do arquivo /etc/passwd
#• O arquivo /etc/login.defs mostra através dos parâmetros UID_MIN e
#UID_MAX os UID atribuídos aos usuários “normais” do sistema
#• Para definir apenas a quebra de linha como separador no IFS use:
#IFS=$'\n'
#• Use o a opção -e do echo para controlar o espaçamento da saída com
#tabs (\t)

MAX_UID=$(grep "^UID_MAX" /etc/login.defs |tr -s " " |cut -d " " -f2)
MIN_UID=$(grep "^UID_MIN" /etc/login.defs |tr -s " " |cut -d " " -f2)

OLDIFS=$IFS

IFS=$'\n'


#USUARIO=$(cat /etc/passwd |cut -d":" -f1)
#echo $USUARIO

echo -e "USUARIO\t\tUID\t\tDIR HOME\t\tNOME OU DESCRIÇÃO"
for i in $(cat /etc/passwd)
do
	
	USERID=$(echo $i |cut -d ":" -f3)
	if [ $USERID -ge $MIN_UID -a $USERID -le $MAX_UID ]
	then
		USUARIO=$(echo $i |cut -d ":" -f1)
		DIRHOME=$(echo $i |cut -d ":" -f6)
		DESCRICAO=$(echo $i |cut -d ":" -f5|tr -d ",")
		echo -e "$USUARIO\t\t$USERID\t\t$DIRHOME\t\t$DESCRICAO"
	fi

done
IFS=$OLDIFS
