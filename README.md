<h1>Simulacion de Teoría de colas</h1>

queueTheorySimuation es un script de bash que implementa la solución al ejemplo de teoría de colas planteado en la página 13 del libro <cite>"Simulación de Sistemas de Robert Shannon (1975)"  </cite>


<h3>Ejemplo propuesto</h3>

El ejemplo en cuestión plantea lo siguiente:<br>
Consideremos un sistema de formación de colas de un sólo canal (línea de espera) tal como el de una caja registradora en una pequeña tienda de regalos. Supongamos que el tiempo entre llegada de los clientes está uniformemente distribuido de 1 a 10 minutos (por simplicidad redondearemos todos los tiempos al minuto total más cercano). Además, supongamos que el tiempo para atender a cada clientes está uniformemente distribuido de 1 a 6 minutos. Estamos interesados en el tiempo promedio que un cliente permanece dentro del sistemas (el tiempo que transcurre cuando está esperando y mientras se lo atiende) y el porcentaje de tiempo que el cajero estás desocupado.
 
Resumiendo, se busca

<ul>
<b>i</b>. Tiempo promedio de un cliente en la cola de un sistema.
</ul>
<ul>
<b>ii</b>. % de tiempo que el cajero esta desocupado.
</ul>

<h3>Solución</h3>

Utilicé únicamente los comandos disponibles en el intérprete de comandos bash en un sistema linux debian. La única limitación encontrada fue la imposibilidad obtener resultados no enteros en divisiones. Por está razón, instalé bc (bash calculator). <br><br>
<code>apt-get install bc</code> <br><br>
Probé el script en sistemas ubuntu y derivados, mint, y bc ya forma parte de la instalación de los mismos.

<h3>Ejecución</h3>

Para ejecutar el script basta con otorgarle permisos de ejecución haciendo<br><br>
<code>chmod +x queueTheorySimuation.sh</code><br>

Luego introducir la cantidad de clientes que se desean utilizar en la simulación, llamemosla n, Se generaran dos arrays con n enteros aleatorios normalmente distribuidos cada uno. El primero con valores [1..10] y el segundo con valores [1..6].  
