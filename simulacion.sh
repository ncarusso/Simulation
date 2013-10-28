#!/bin/bash


###############################################
# Author: Nicolas Carusso                     #
# Date: 10/15/2013                            #
###############################################


<<COMENTARIO1
		Script que permite determinar,
		i. Tiempo promedio de un cliente en la cola de un sistema.
		ii. % de tiempo que el cajero esta desocupado.
COMENTARIO1

#Comienzo a escribir el código


####################
# Ingreso CLIENTES
####################

echo -n "Ingrese la cantidad de clientes que sea utilizar en la simulacion: ";
read cliente

######################################################
# Genero TIEMPO DE LLEGADA entre los Clientes [1,10]
######################################################

<<COMENTARIO2
		Utilizo la función interna de bash RANDOM para generar los valores aleatoreos uniformemente distribuidos
		para el tiempo de llegada entre los clientes y para el tiempo de atención. Almaceno estos valores en respectivos
		arrays cuya longitus es igual a la cantidad de clienteS
COMENTARIO2

###################
# Random Function
###################

#For determine the random number between x and y is:
#((x + RANDOM%(y-x+1)))

<<ARRAYS


###############################################
# Genero TIEMPO DE ATENCION o DE SERVICIO [1,6]
###############################################

for ((j;j < cliente; j++))
do
	tiempoAtencion=$((1 + RANDOM%(6-1+1)))	
	ARRAY+=($tiempoAtencion)

done

echo ${ARRAY[*]};


###############################################
# Genero TIEMPO DESDE LA ULTIMA LLEGADA [1,10]
###############################################

#tiempoUltimaLlegada=$((1 + RANDOM%(10-1+1)))

for ((h;h < cliente; h++))
do
        tiempoUltimaLlegada=$((1 + RANDOM%(6-1+1)))
        ARRAY2+=($tiempoUltimaLlegada)

done

echo ${ARRAY2[*]};

# Comento los arrays porque ya se que funciona la generacion de los mismos con numeros aleatoreos.
Para lo que voy a seguir haciendo ahora, conviene usar arrays enteros con los mismo numeros que estan
en la tabla del ejemplo para luego verificar que obtengo los mismo resultados

ARRAYS


 
