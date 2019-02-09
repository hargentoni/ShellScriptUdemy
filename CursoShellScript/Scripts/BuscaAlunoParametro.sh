#!/bin/bash

##############################################################
# Buscaaluno.sh - Procurar nome completo do aluno
# Autor: Hélio Argentoni
#Data Crianção: 09/02/2019
#Descrição: Script de exemplo para uso de Parâmetro.
#	    A partir de uma entrada do usuário, será feita uma
#	    busca no arquivo aluno2.txt
#Exemplo de uso: ./Buscaaluno.sh
##############################################################

######      Forma 1 de fazer esse script    ########

# ARQALUNOS="/home/vasconcelos/Documents/cursos/ShellScriptUdemy/CursoShellScript/arquivos/alunos2.txt"
# clear
# echo "=======Scrtipt de Busca de Aluno========"
# echo ""
# echo -n "Por favor, informe o nome do aluno: "
# read ALUNO
# echo ""
# echo "O nome completo do aluno é: $( grep "$ALUNO" "$ARQALUNOS" ) "
# echo ""
# echo "Fim do Script"

##### Forma 2 de fazer esse script #######

ARQALUNOS="/home/vasconcelos/Documents/cursos/ShellScriptUdemy/CursoShellScript/arquivos/alunos2.txt"
clear
echo "=======Scrtipt de Busca de Aluno========"
echo ""
ALUNONOMECOMPLETO=$(grep "$1" "$ARQALUNOS")
echo""
echo "O nome completo do aluno é: $ALUNONOMECOMPLETO"
echo ""
echo "Fim do Script"
