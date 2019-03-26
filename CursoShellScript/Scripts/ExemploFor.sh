#!/bin/bash

for i in /home/hargentoni@predicta.local/Documents/*
do
	if [ -f $i ]
	then
		LINHAS=$(cat $i | wc -l)
		echo "O arquivo $i tem $LINHAS linhas"
	fi
done

