#!/bin/bash

# 3 - Exercício de Loop

#Fazer um script que inspecione os diretórios /home/ de todos os usuários em
#busca de arquivos com as extensões .mp3, .mp4 e .jpg.
#O script deve gerar como saída final um relatório com a quantidade de cada
#tipo de arquivo para cada usuário.

for user in /home/*
do
	MP3=0
	MP4=0
	JPG=0
	OLDIFS=$IFS
	IFS=$'\n'
	for arquivos in $(find $user -name "*.mp3" -o -name "*.mp4" -o -name "*.jpg")
	do
		case $arquivos in
			*.mp3)
				MP3=$(expr $MP3 + 1)
				;;
			*.mp4)
				MP4=$(expr $MP4 + 1)
				;;
			*.jpg)
				JPG=$(expr $JPG + 1)
				;;
		esac
done

echo "Usuário: $(basename $user)"
echo "Arquivos MP3: $MP3"
echo "Arquivos MP4: $MP4"
echo "Arquivos JPG: $JPG"
echo

done
IFS=$OLDIFS
