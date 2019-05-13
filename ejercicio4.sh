#!/bin/bash

arch=$(ls | wc -l) 
let arch=$arch-$(ls -ld */ | wc -l)

echo "El numero de archivos en la carpeta actual es: $arch"

echo $(who -q | sed '$d') 

echo "¿Qué carácter quieres contar?"

read -s -t5 -n1 x

if [ -z $x ]
	then
	echo "No se ha introducido ningun caracter"
	x="a"
fi

ls >> aux.txt  

numVeces=$(grep -o $x aux.txt | wc -l) 

echo "El caracter $x aparece $numVeces en los nombres de archivo del directorio actual"
rm aux.txt