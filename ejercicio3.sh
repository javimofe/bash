#!/bin/bash
#Ejercicio 3 Practica 1 PAS
#control de errores
#si la carpeta pequeno mediano grande existen borrarlas(rm -d)
#crear carpetas mkdir
#recorrer directorio $1 y mirar tamaños, si tamaño es mas pequeño que umbral 1 copiamos a carpeta pequeños(cp $x donde_copiar)
if [ $# -eq 1 -o $# -eq 2 -o $# -eq 3 ] && [ -d $1 ];
then
    #fijamos valores por defecto para umbrales
     umbralBajo=10000
     umbralAlto=100000
    if [ $# -eq 2 ]
    then
        umbralBajo=$2
    fi
    if [ $# -eq 3 ]
    then
        umbralBajo=$2
        umbralAlto=$3
    fi
    #comprobamos si existen las carpetas y las borramos
    if [ -e pequeno ]
    then
        echo "borrando carpeta pequeno..."
        rm -d -r pequeno
    fi
    if [ -e mediano ]
    then 
        echo "borrando carpeta mediano..."
        rm -d -r mediano
    fi
    if [ -e grande ]
    then
        echo "borrando carpeta grande..."
        rm -d -r grande
    fi
    #creamos las carpetas
    echo "Creando carpetas pequeno, mediano y grande..."
    mkdir pequeno
    mkdir mediano 
    mkdir grande
    #en $1 esta directorio, $2 esta el primer umbral, $3 esta el segundo umbral
    for x in $(find $1)#recorre el directorio que esta en $1
	do
        if [ -f $x ]
        then
            #sacar tamaño de cada fichero y los if para meterlo en cada uno
            tam=$(stat -c %s $x)
            if [ $tam -lt $umbralBajo ]
            then
                if [ -f $x ]
                then
                    cp $x pequeno
                fi
            fi
            if [ $tam -gt $umbralBajo -a $tam -lt $umbralAlto ]
            then
                cp $x mediano
            fi
            if [ $tam -gt $umbralAlto ]
            then
                cp $x grande
            fi
        fi
		
	done
    echo "Ya se han repartido los ficheros"
fi