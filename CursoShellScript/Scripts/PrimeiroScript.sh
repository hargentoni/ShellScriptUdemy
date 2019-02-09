#!/bin/bash

#############################################
#
# PrimeiroScript.sh - Script de Exemplo do curso na Udemy
# Autor: Hélio Argentoni
# Descrição: Scrtip de exemplo que le data e hora atual e exibe a lista de alunos
# Data: 06/02/2019
# 
#############################################
# Função para exibir a data
DATAHORA=$(date +%H:%M)
ARQALUNO="/home/vasconcelos/Documents/cursos/ShellScriptUdemy/CursoShellScript/arquivos/alunos2.txt"
clear
echo "======= Meu Primeiro Script ======"
echo ""
echo "Exibir data e hora atual: $DATAHORA"

# Area de leitura da lista de alunos
echo "=================================="
echo "Listagem dos Alunos: "
sort $ARQALUNO
echo "================================="
DATAHORA=$(date +%H:%M)
echo "A hora atual após o término do script: $DATAHORA"

