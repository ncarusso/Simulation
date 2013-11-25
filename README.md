<h1>Queue Theory Simulaton</h1>

queueTheorySimulation es un script de bash que implementa la solución al ejemplo de teoría de colas planteado en la página 13 del libro <cite>"Simulación de Sistemas de Robert Shannon (1975)"  </cite>


<h3>Proposed example</h3>

El ejemplo en cuestión plantea lo siguiente:<br>
Consider a single-channel queueing (waiting line) system such as a checkout stand at a small gift shop. Assume that
the time between arrivals of the customers is uniformly distributed from 1 through 10 minutes (for simplicity we
round off all times to the nearest whole minute). Let us assume further that the amount of time required to service
each customer is uniformly distributed from 1 through 6 minutes. We are interested in the average time a customer
spends in the system (both waiting and being serviced) and the percentage of time that the check-out clerk is not
occupied with work.


Resumiendo, se busca

<ul>
<b>i</b>. Tiempo promedio de un cliente en la cola de un sistema.
</ul>
<ul>
<b>ii</b>. % de tiempo que el cajero esta desocupado.
</ul>

<h3>Solución</h3>

Utilicé únicamente los comandos disponibles en el intérprete de comandos bash en un sistema linux debian. La única limitación que encontré fue la imposibilidad de obtener resultados no enteros en divisiones. Por está razón, instalé bc (bash calculator). <br><br>
<code>apt-get install bc</code> <br><br>
Probé el script en sistemas ubuntu y derivados, mint, y bc ya forma parte de la instalación de los mismos.

<h3>Ejecución</h3>

Para ejecutar el script basta con otorgarle permisos de ejecución haciendo<br><br>
<code>chmod +x queueTheorySimulation.sh</code><br>

y luego

<code> ./queueTheorySimulation.sh </code>

Finalmente, se pide por pantalla introducir la cantidad de clientes que se desean utilizar en la simulación, llamemosla n, Se generaran dos arrays con n enteros aleatorios normalmente distribuidos cada uno. El primero con valores [1..10] y el segundo con valores [1..6].  
