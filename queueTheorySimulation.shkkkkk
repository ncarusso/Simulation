#!/bin/bash


###############################################
# Author: Nicolas Carusso                     #
# Author's email: ncarusso at gmail dot com   #
# Date: 28/02/2014                            #
###############################################


<<COMENTARIO1
		Script que permite determinar,
		i. Tiempo promedio de un cliente en la cola de un sistema.
		ii. % de tiempo que el cajero esta desocupado.
COMENTARIO1


	
#####################################################################################
#"Anyone who attempts to generate random numbers by deterministic means is, of course,
#living in a state of sin."
#
#--John von Neumann
#
####################################################################################
###################################################################################



#################################
#################################
#Funcion linuxRandom
#################################
#################################
#genera los numeros aleatorios a partir con el PRNG de linux
####################################################################################
###################################################################################


<<COMENTARIO2
        Utilizo la funcion interna de bash RANDOM para generar los valores pseudoaleatorios (uniformemente distribuidos?)
        para el tiempo de llegada entre los clientes y para el tiempo de atencion. Almaceno estos valores en respectivos
        arrays cuyas longitudes son iguales a la cantidad de clientes.
COMENTARIO2

###################
# Random Function
###################

#For determine the random number between x and y is:
#((x + RANDOM%(y-x+1)))



function linuxRandom () {

###############################################
# Genero TIEMPO DE ATENCION o DE SERVICIO [1,6]
###############################################


for ((j=0;j < $cliente; j++))
do
    tiempoAtencion=$((1 + RANDOM%(6-1+1)))  
    Serv[$j]=$tiempoAtencion

done

echo "Vector aleatorio de tiempos de servicio" ${Serv[*]}



###############################################
# Genero TIEMPO DESDE LA ULTIMA LLEGADA [1,10]
###############################################

#tiempoUltimaLlegada=$((1 + RANDOM%(10-1+1)))

for ((h=0;h < ($cliente); h++))
do
        tiempoUltimaLlegada=$((1 + RANDOM%(10-1+1)))
        Lleg[$h]=$tiempoUltimaLlegada

done
Lleg[0]=0

echo "Vector aleatorio de tiempos de llegada" ${Lleg[*]};

}

#################################
#################################
#Funcion randomOrg (REAL RANDOM)
#################################
#################################
<<COMENTARIO3
    genera los numeros aleatorios conectandose al sitio www.random.org. 
    estos numeros son ALEATORIOS, generados por fenomenos de la naturaleza
COMENTARIO3


function randomOrg () {

###############################################
# Genero TIEMPO DE ATENCION o DE SERVICIO [1,6]
###############################################


    #Serv=($(curl -s "http://www.random.org/integers/?num=${cliente}&min=1&max=6&col=1&base=10&format=plain&rnd=new"))  
    Serv=($(wget -qO- "http://www.random.org/integers/?num=${cliente}&min=1&max=6&col=1&base=10&format=plain&rnd=new"))

echo "Vector aleatorio de tiempos de servicio (REAL RANDOM!!!!!!)" ${Serv[*]}



###############################################
# Genero TIEMPO DESDE LA ULTIMA LLEGADA [1,10]
###############################################

         #Lleg=($(curl -s "http://www.random.org/integers/?num=${cliente}&min=1&max=10&col=1&base=10&format=plain&rnd=new"))
         Lleg=($(wget -qO- "http://www.random.org/integers/?num=${cliente}&min=1&max=10&col=1&base=10&format=plain&rnd=new"))

# A continuacion, indico que el primer elemento del vector sea 0 (el primer cliente no tiene tiempo de ultima llegada)

Lleg[0]=0

echo "Vector aleatorio de tiempos de llegada (REAL RANDOM!!!!!!)" ${Lleg[*]};


}



#Comienzo a escribir el código


####################
# Ingreso CLIENTES
####################

echo -n "Ingrese la cantidad de clientes que sea utilizar en la simulacion: ";
read cliente

#################################
# Selección de tipo de numero
#################################


        echo "Seleccione una opcion para generar numeros: "
        echo "1. Pseudoaleatorios"
        echo "2. Aleatorios (www.random.org)"
        echo "3. Salir"
        echo -n "opcion: "

        read opcion
        case $opcion in
            1) linuxRandom;;
            2) randomOrg;;
            3) exit;;
            *) echo "Opcion Incorrecta";;
        esac





 
###############################################
#Parte A
###############################################


                for ((l=1; l<$cliente; l++))
                do



                        if [ ${Lleg[l]} -ge ${Serv[l-1]} ]
                        then
                        VectorEspera[$l]=${Serv[l]}
                        else
                        VectorEspera[$l]=$(( (${Serv[l-1]}) - (${Lleg[l]}) + (${Serv[l]}) ))
                        fi


                done

#Agrego la primer posicion, a donde no existe l-1
VectorEspera[0]=${Serv[0]}



########COMENTAR###################
echo "Vector de Espera del cliente:" ${VectorEspera[*]}

suma=0
for ((m=0; m<$cliente; m++))
                do
                suma=$(($suma+ ${VectorEspera[$m]} ))
                done

#########COMENTAR#################
echo "La espera total en minutos es: "$suma

esperaTotal=$suma
cantidadDeClientes=${#VectorEspera[@]}

echo -n "i. Tiempo de espera promedio del cliente en minutos:" 
echo "scale=2; $esperaTotal/$cantidadDeClientes" | bc


<<COMENTARIO
####ACLARACION#######
# Aqui se utiliza la aplicacion "bc" (bash calculator) porque en el
interprete de comandos bash de linux no es posible realizar
divisiones de floating-point

bc se instala ejecutando :

apt-get install bc

COMENTARIO
#######################################

#############
#############
#############
# PARTE B   #
#############
#############
#############



for ((n=1; n<$cliente; n++))
                do



                        if [ ${Lleg[n]} -gt ${Serv[n-1]} ]
                        then
                        inactivo[$n]=$(( (${Lleg[n]}) - (${Serv[n-1]}) ))
                        else
                        inactivo[$n]=0
                        fi


               done



#Agrego la primer posicion, a donde no existe n-1
inactivo[0]=0


echo "El vector de cajero inactivo: " ${inactivo[@]}

########COMENTAR###################

suma1=0
for ((p=0; p<cliente; p++))
                do
                suma1=$(($suma1+ ${inactivo[$p]} ))
                done


suma2=0
for ((q=0; q<cliente; q++))
                do
                suma2=$(($suma2+ ${Lleg[$q]} ))
                done




#########COMENTAR#################
echo "Tiempo total de cajero inactivo: "$suma1
echo "Tiempo total de llegadas: "$suma2

producto=$(($suma1 * 100 ))

#echo $producto

#cantidadDeClientes=${#Vector[@]}#
#
echo -n "ii. El porcentaje del tiempo de inactividad del cajero es : % "
echo  "scale=2; $producto/$suma2"  | bc

