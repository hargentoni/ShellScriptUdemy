#!/bin/bash



DATA=$(echo $2 |tr -d "/")
VAL1=$(echo $DATA |cut -c-2)
VAL2=$(echo $DATA |cut -c-3-4)
ANO=$(echo $DATA |cut -c-5-8)

RetornaFormato () {

	if [ $VAL1 -le 12 -a $VAL1 -eq $VAL2 ] #DIA = MÊS Formato BR
	then
		return 0
	elif [ $VAL1 -gt 12 -a $VAL2 -le 12 ] #Formato BR
	then
		return 0
	elif [ $VAL1 -le 12 -a $VAL2 -gt 12 ] #Formato US
	then
		return 1
	elif [ $VAL1 -le 12 -a $VAL2 -le 12 ] #Formato indefinido, mas válido
	then
		return 2
	else
		return 3
	fi
}

InverteFormato () {
	RetornaFormato $1
	local TIPODATA = $?
	
	if [ $TIPODATA -ne 3 ]
	then
		echo "$VAL2/$VAL1/$ANO"
	else
		echo "Formato de data inválido"
	fi
}
IncluirBarra () {
	RetornaFormato $1
	local TIPODATA = $?

	if [ $TIPODATA -ne 3 ]
	then
		echo "$VAL1/$VAL2/$ANO"
	else
		echo "Formato de data inválido"
	fi
}

DataExtenso () {
	RetornaFormato $1
	local RETURN_FORM=$?
	case $RETURN_FORM in
		0)
			local DIA=$VAL1	#Data formato Brasil
			local MES=$VAL2
			;;
		1)
			local DIA=$VAL2	#Data formato US
			local MES=$VAL1
			;;
		2)
			local USERESCOLHE=0		#Formato indefinido. Solicitar ao Usuário
			until [ "$USERESCOLHE" = 1 -o "$USERESCOLHE" = 2 ]
			do
				echo
				echo "Impossível determinar o padrão de data."
				echo "1 - BR (DD/MM/YYYY)"
				echo "2 - US (MM/DD/YYYY)"
				read -p "Informe o formato (1 ou 2) " $USERESCOLHE
				case $USERESCOLHE in
					0)
						local DIA=$VAL1
						local MES=$VAL2
						;;
					1)
						local DIA=$VAL2
						local MES=$VAL1
						;;
					*)
						echo "Opção Inválida"
						;;
				esac
			done
	esac
case $MES in
	01)
		local MESEXTENSO=janeiro
		;;
	02)
		local MESEXTENSO=fevereiro
		;;
	03)
		local MESEXTENSO=março
		;;
	04)
		local MESEXTENSO=abril
		;;
	05)
		local MESEXTENSO=maio
		;;
	06)
		local MESEXTENSO=junho
		;;
	07)
		local MESEXTENSO=julho
		;;
	08)
		local MESEXTENSO=agosto
		;;
	09)
		local MESEXTENSO=setembro
		;;
	10)
		local MESEXTENSO=outubro
		;;
	11)
		local MESEXTENSO=novembro
		 ;;
	 12)
		local MESEXTENSO=dezembro
		;;
esac
echo "$DIA de $MESEXTENSO de $ANO"
}

#Inicio do fluxo do script#

case $1 in
	"-f")
		RetornaFormato $2
		echo $?
		;;
	"-i")
		InverteFormato $2 
		echo $?
		;;
	"-b")
		IncluirBarra $2
		echo $?
		;;
	"-e")
		DataExtenso $2
		echo $?
		;;
	"--help")

			echo "Uso $0 OPÇÃO DATA"
			echo
			echo "Opções:"
			echo
			echo "DATA nos formatos DDMMYYYY ou MMDDYYYY, com ou sem /"
			echo
			echo "-f = Retorna 0 para BR, 1 para US e 2 quando impossível determinar, 3 Inválido"
			echo "-i = Inverte formato BR para US e US para BR. Inclui as Barras"
			echo "-b = Inclui Barras de Data. Exemplo: de 13081981 para 13/08/1981"
			echo "-e = Exibe a data em formato extenso. Exemplo de 13081918 para 13 de Agosto de 1981"
			;;
		*)
			echo "Uso inválido. Utilize $0 --help"
			;;
	esac



