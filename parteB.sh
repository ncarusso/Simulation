#!/bin/bash

#Lleg=(0 3 7 3 9 10 6 8 8 8 7 3 8 4 4 7 1 6 7 6)
#Serv=(1 4 4 2 1 5 4 6 1 3 5 5 3 6 1 1 6 1 2 2)



              for ((n=1; n<20; n++))
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
for ((p=0; p<20; p++))
                do
                suma1=$(($suma1+ ${inactivo[$p]} ))
                done

suma2=0
for ((q=0; q<20; q++))
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

