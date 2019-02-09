#!/bin/bash

########################
# Autor: Hélio Argentoni
# Descrição: Crie um script que gere um relatório de algumas informações da máquina
# nome da máquina
# data e hora atual
# desde quando a máquina está ativa
# versão do Kernel
# quantidade de CPU
# total de memória ram disponível
# partições
#
# Data de criação: 09/02/2019
#############################


echo "=================================="
echo "Relatório da Máquina: $(hostname)"
echo "Data/Hora: $(date)"
echo "=================================="
echo ""
echo ""
echo "Máquina Ativa desde: $(uptime -s)"
echo ""
echo "Versão do Kernel: $(cat /etc/issue)"
echo ""
echo "CPUs:"
echo "Quantidade de CPUs/Core: $(cat /proc/cpuinfo |grep "cpu cores" |tr -d 'cpu cores'':'|cut -f2|sed 's/ //g' |uniq)"
echo "Modelo da CPU: $(cat /proc/cpuinfo |grep "model name" |tr -d 'model name'':'|uniq)"
echo ""
echo "Memória Total: $(cat /proc/meminfo |grep "MemTotal" |sed 's/MemTotal\| \|://g' )"
echo ""
echo "Partições:"
echo "$(df)"
