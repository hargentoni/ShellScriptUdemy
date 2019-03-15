#!/bin/bash
# EXECÍCIO CONDICIONAL IF

# comando para a data: date +%Y%m%d

# comando para zipar: tar cfpz destino/nomedozipado quemseracompactado

# comando para criar diretorio: mkdir diretorio

# Crie um script que gere um arquivo compactado de backup de todo o diretório
# home do usuário atual (/home/<usuario>).
# Considere que:
# • O arquivo de backup será criado no diretório /home/<usuario>/Backup
# • O nome do arquivo de backup deve seguir o padrão
# backup_home_AAAAMMDDHHMM.tgz, exemplo
# backup_home_201708241533.tgz
# • Caso o diretório /home/<usuario>/Backup não exista, o script deve criá-lo
# • Antes de criar o backup, o script deve consultar se existe algum arquivo
# de backup criado na última semana. Se exisitir, o usuário deve ser
# consultado se deseja continuar. Se o usuário optar por não continuar, o
# script deve abortar com código de saída 1.
# • Após gerar o backup, o script deve informar o nome do arquivo gerado.


DIR="$HOME/Backup"

if [ ! -d $DIR ]
then
	echo "Criando diretório $DIR..."
	sleep 2
	mkdir -p $DIR # Serve para criar diretórios dentro do outro.
fi


PROCURA="$(find $DIR -ctime -7 -iname backup_home\*tgz)" # Tem que usar a barra antes do sinal * para proteger o sinal.

if [ "$PROCURA" ] # Essa sintaxe testa se a Variavel é nula ou não.
then
	echo "Já existe um arquivo de backup nos últimos 7 dias."
	echo
	read -p "Deseja continuar? (n/s): " OPCAO
	echo
	if [ "$OPCAO" = N ] || [ "$OPCAO" = n ] || [ "$OPCAO" = "" ]
	then
		echo "Backup Abortado!"
		exit 1
		elif [ "$OPCAO" = S ] || [ "$OPCAO" = s ] 
		then
			echo "Será criado mais um backup para a mesma semana"
		else
			echo "Opção Inválida"
			exit 2
	fi
fi

	
echo "Criando Backup..."
ARQ="backup_home_$(date +%Y%m%d%H%M).tgz"
tar vcfpz $DIR/$ARQ --absolute-names --exclude=$HOME/Videos --exclude="$DIR" "$HOME"/* > /dev/null # absolute-names não faz a quebra da barra.
echo "O backup de nome \""$ARQ"\" foi criado em "$DIR" "

echo "Backup Concluído!"
