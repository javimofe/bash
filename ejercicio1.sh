#!/bin/bash

if [ $# -eq 1 -a -d $1 ];
then	
numarchivosh=$(find $1 -name "*.h"|wc -l)
numarchivosc=$(find $1 -name "*.c"|wc -l)
echo "Hay "$numarchivosc" archivos.h y "$numarchivosh" archivos.c"

for x in $(find $1)
do
	echo "$x tiene $(cat $x|wc -l)lineas y $(cat $x|wc -m) caracteres."
done | sort -nr -k6
fi