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
clear
echo "======= Meu Primeiro Script ======"
echo ""
echo -n "Exibir data e hora atual"
date
# Area de leitura da lista de alunos
echo "=================================="
echo "Listagem dos Alunos: "
sort ../arquivos/alunos2.txt

