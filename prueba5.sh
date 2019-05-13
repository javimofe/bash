#!/bin/bash

mkdir $HOME/copia

#si haces un bucle de 4 para acceder a cada uno dentro pones $($x)
for x #te recorre toda la linea de argumentos
do  
    fechaActual=$(date +%s)
    tar czvf copia-$USER-$fechaActual.tar.gz $x #creo el archivo comprimido
    mv copia-$USER-$fechaActual.tar.gz $HOME/copia/ #lo muevo a el directorio copia      
done
echo "La copia de seguridad de ha creado correctamente"

for x in $(find $HOME/copia)
do
    fechaCreac=$(stat -c %Y $x)
    fechaActual=$(date +%s)
    resta=$(($fechaActual-$fechaCreac)) #segundos que lleva creado
    if [ $resta -gt 200 ]
    then   
        rm -r $x
    fi
    echo "borrando $x de $resta segundos"
done
