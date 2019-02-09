#!/bin/bash

######################################################################################
#Autor: Hélio Argentoni								     #
#Descrição: Usuário vai informar dois valores e será exibido na tela a soma dos dois.#
#Nome do Script: SomaValores.sh							     #
######################################################################################

read -p "Informe o primeiro valor: " VALOR1
echo ""
read -p "Informe o segundo valor: " VALOR2
echo ""
echo "Soma dos dois valores informados é : $( expr $VALOR1 + $VALOR2 )"
