#
#  LAB: Transformación de archivos con `sed`
#  ================================================
#
#  Una tarea común en Analytics es el procesamiento de archivos en bruto para que puedan 
#  ser usados en otros procesos, donde gran parte de dicho procesamiento corresponde a la 
#  transforamción del formato. Estos archivos suelen tener millones de registros por lo que 
#  la aplicación de procedimientos manuales no es práctica.
#  
#  El archivo `data.csv` contiene una muestra de los archivos generados automáticamente 
#  por un software. El archivo contiene cuatro (4) columnas, donde los valores válidos
#  para los campos son los siguientes:
#  
#  * Columna 1: `DD/MM/AA`.
#  * Columna 2: `A`, `B`, `C`. `\N` indica NULL.
#  * Columna 3: Número entero. `\N` indica NULL.
#  * Columna 4: Número decimal. `\N` indica NULL.
#  
#  
#  Usted debe escribir un script en bash que use sed para que realice 
#  las siguientes acciones:
#    
#  * Convierta el formato de las fechas de DD/MM/YY a YYYY-MM-DD.
#  
#  * Transforme el archivo para que todos los campos nulos aparezcan como `\N`.
#  
#  * Reemplace los `;` por `,`.
#  
#  * Use el `.` para indicar decimales.
#
#  El resultado del script se escribe en pantalla.
#
#  El programa se llamara por el evaluador tal como se indica a continuación:
#
#  $ bash question.sh data.csv > output.csv
#  
#  Rta/
#  2013-03-12,A,1,100.0
#  ...
#  2014-09-01,A,3,100.4
#
#  >>> Escriba su codigo a partir de este punto <<<
#
sed '12 s/\([0-9]\)\/\([0-9]\)\/\(20[0-9][0-9]\)/\3-0\2-0\1/g' data.csv> output1.csv
sed 's/\([0-9][0-9]\)\/\([0-9][0-9]\)\/\([0-9][0-9]\)/20\3-\2-\1/g' output1.csv> output2.csv
sed -e 's/[a-z]/\U&/g'  output2.csv> output3.csv
sed -E 's|^([^;]*;[^;]*;[^;]*;)([^,]*),([^;]*)$|\1\2.\3|'  output3.csv> output4.csv
sed 's/;\s*N/;\\N/g' output4.csv> output5.csv
sed 's/;;/;\\N;/g' output5.csv> output6.csv
sed '5 s/;/;\\\N/3' output6.csv> output7.csv
sed '7 s/;/;\\\N/3' output7.csv> output8.csv
sed 's/;/,/g' output8.csv> output.csv