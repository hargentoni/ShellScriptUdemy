#!/bin/bash
###########################
#Autor Hélio Argentoni
#Descrição: Recebe o nome de usuário como parâmetro e exiba as seguintes informaçõe:
# UID do usuário
# Nome Completo / Descrição do Usuário
# Total em uso no /home do usuário
# Informações do último login do usuário
# [Opcional] Validar se o usuário existe ou não sem o usuo do IF, que ainda não foi estudado...
# Se não existir retorne o exit code 1, se existir retorne exit 0
#
# Data de criação: 09/02/2019
################################

ls /home/$1 > /dev/null 2>&1 || echo "Usuário Inexistente"
ls /home/$1 > /dev/null 2>&1 || exit 1


USERID=$(grep $1 /etc/passwd |cut -d':' -f3)
DESC=$(grep $1 /etc/passwd |cut -d':' -f5|tr -d ,)
TOTALHOME=$(du -sh /home/$1|cut -f1)

echo "========================"
echo "Relatório do Usuário: $1"
echo "UID: $USERID"
echo "Nome ou Descrição: $DESC"
echo ""
echo "Total usado no /home/$1: $TOTALHOME"
echo ""
echo "Ultimo Login: "
lastlog -u $1
echo "========================"
exit 0

