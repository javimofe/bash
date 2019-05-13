#!/bin/bash 

function recorrer()
{
	find $1 -maxdepth 1 -name "*"  | while read x 
	do	
		if [ "$x" != "$1" ]
		then			
		echo $x	$fHtml				
			if [ -d $x ]
			then
				echo "<li><strong>$x</strong></li>" >> $fHtml 
				echo "<ul>">>$fHtml				
				recorrer $x
				echo "</ul>">>$fHtml
			else
				echo "<li> $x </li>">>$fHtml
			fi
		fi
	done
}


if [ $# -ne 1 ]
then
	echo -e "Se necesita un argumento."
	exit
fi
echo "Generando el listado de la carpeta $1 sobre el fichero $1.html..."
echo "Terminado!"
fHtml="$1.html"
echo "<html>" >> $1.html #etiqueta para abrir el html
echo "<head>" >> $1.html #etiqueta de la cabecera del documento
echo "<tittle> Listado del directorio $1 </title>" >> $1.html #etiqueta del titulo del documento
echo "</head>" >> $1.html #cerrar etiqueta cabecear
echo "<body>" >> $1.html #etiqueta cuerpo del documento
echo  -e "<style type=\"text/css\">\n 
    	body { font-family: sans-serif;}\n
 	</style>" >> $1.html
echo "<h1>Listado del directorio $1</h1>" >> $1.html #etiqueta titulo 1

recorrer $1

echo "</body>" >> $fHtml
echo "</html>" >> $fHtml