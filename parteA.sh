#!/bin/bash

#Lleg=(0 3 7 3 9 10 6 8 8 8 7 3 8 4 4 7 1 6 7 6)
#Serv=(1 4 4 2 1 5 4 6 1 3 5 5 3 6 1 1 6 1 2 2)


		for ((l=1; l<20; l++))
 		do



 			if [ ${Lleg[l]} -ge ${Serv[l-1]} ]
    			then
       			Vector[$l]=${Serv[l]}
    			else
			Vector[$l]=$(( (${Serv[l-1]}) - (${Lleg[l]}) + (${Serv[l]}) ))
   			fi


 		done

#Agrego la primer posicion, a donde no existe l-1
Vector[0]=${Serv[0]}



########COMENTAR###################
echo "Vector de Espera del cliente:" ${Vector[*]}

suma=0
for ((m=0; m<20; m++))
                do
                suma=$(($suma+ ${Vector[$m]} ))
                done

#########COMENTAR#################
echo "La espera total en minutos es: "$suma

esperaTotal=$suma
cantidadDeClientes=${#Vector[@]}

echo -n "i. Tiempo de espera promedio del cliente: " 
echo  "scale=2; $esperaTotal/$cantidadDeClientes"  | bc


<<COMENTARIO
####ACLARACION#######
# Aqui te utiliza la aplicacion "bc" (bash calculator) porque en
interprete de comandos bash de linux no es posible realizar
divisiones de floating-point

bc se instala ejecutando :

apt-get install bc

COMENTARIO
#######################################
