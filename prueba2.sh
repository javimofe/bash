#!/bin/bash
if [ $# -gt 0 ] && [ $# -lt 3 ] && [ -d $1 ]
then 
	if [ $# -eq 1 ]
	then
		let numerosbytes=0
	else
		let numerosbytes=$2
	fi
else
	echo "mensaje de error"
fi
	echo "Nombre;LongitudUsuario;FechaModificacion;FechaAcceso;Tamano;Bloques;Permisos;Ejecutable"
	echo "----------------------------------------------------------------------------------------------"

	for x in $(find $1 -size +$numerosbytes'c')
	#'c' para que coja lo de antes como bytes
	do
		nombre=$(basename $x)
		let longUser=$(stat -c "%u" $x|wc -m) -1
		fechaMod=$(stat -c "%y" $x)
		fechaAcceso=$(stat -c %x $x)
		permisos=$(stat -c %A $x)
		numBloques=$(stat -c %b $x)
		tamBytes=$(stat -c %s $x)
		ejec=0
		if [ -x $x ]
			then
			ejec=1
		fi

		echo "$nombre;$longUser;$fechaMod;$fechaAcceso;$tamBytes;$numBloques;$permisos;$ejec"
		
	done | sort 

	# 'stat' con la opcion '-c' formatea la salida
