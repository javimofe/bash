Pruebas de scripts con bash.

Para ejecutarlos primero se le deben dar permisos de ejecución a dichos ficheros con el comando chmod

Se debe usar chmod u+x el cual da al usuario permisos de ejecución.

Los parámestros del comando chmod modifican permisos al fichero, las opciones son las siguientes:
  u  -> usuario
  g  -> grupo
  o  -> resto usuarios del sistema
  
Depende lo que lo complementemos podemos dar o quitar permisos de lectura(r), escritura(w) y ejecución(x)

Aparte con la opción -R podemos concatenar varios permisos a la vez.

chmod -R u+x,go-r   :   Este comando dara al usuario permisos de ejecución y quitará al grupo y otros usuarios permisos de escritura.


Hay otro modo que es con números en binario. Consideramos rwx como tres numeros en binario. 
Si queremos dar permiso de escritura y quitar lectura y ejecución activariamos el bit w y descativariamos los otros que quedaría 010 que en decimal sería 2
En total son 3 numeros en decimal es decir 9 en binario. El primer numero pertenece a Usuario el segundo a Grupo y el tercero a otros Usuarios. Para dar todos los permisos a todos sería 777

ej: chmod 777 ejemplo1.sh   /    chmod 754 ejemplo1.sh

En el segundo caso estaríamos dando permisos de escritura solo al usuario propietario, de lectura a todos y de ejecución al usuario y al grupo.
