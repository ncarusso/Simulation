<h1>Simulacion de Teoría de colas</h1>

queueTheorySimulation es un script de bash que implementa la solución al ejemplo de teoría de colas planteado en la página 13 del libro <cite>"Simulación de Sistemas de Robert Shannon (1975)"  </cite>


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

<table>
<tr>
<td>Cliente</td>
  <td>Tiempo desde la última llegada (min)</td>
  <td>Tiempo de servicio (min)</td>
  <td>Tiempo medido de las llegadas</td>
  <td>Iniciación del servicio</td>
  <td>Terminación del servicio</td>
  <td>Espera del cliente (min)</td>
  <td>Cajero inactivo (min)</td>
</tr>
<tr>
<td>1</td>
  <td>-</td>
  <td>1</td>
  <td>0:00</td>
  <td>0:00</td>
  <td>0:01</td>
  <td>1</td>
  <td>0</td>
</tr>
<tr>
<td>2</td>
  <td>2</td>
  <td>3</td>
  <td>0:03</td>
  <td>0:03</td>
  <td>0:07</td>
  <td>4</td>
  <td>2</td>
</tr>
<tr>
<td>3</td>
  <td>7</td>
  <td>4</td>
  <td>0:10</td>
  <td>0:10</td>
  <td>0:14</td>
  <td>4</td>
  <td>3</td>
</tr>
<tr>
<td>4</td>
  <td>3</td>
  <td>2</td>
  <td>0:13</td>
  <td>0:14</td>
  <td>0:16</td>
  <td>3</td>
  <td>0</td>
</tr>
<tr>
<td>5</td>
  <td>9</td>
  <td>1</td>
  <td>0:22</td>
  <td>0:22</td>
  <td>0:23</td>
  <td>1</td>
  <td>6</td>
</tr>
<tr>
<td>6</td>
  <td>10</td>
  <td>5</td>
  <td>0:32</td>
  <td>0:32</td>
  <td>0:37</td>
  <td>5</td>
  <td>9</td>
</tr>
<tr>
<td>7</td>
  <td>6</td>
  <td>4</td>
  <td>0:38</td>
  <td>0:38</td>
  <td>0:42</td>
  <td>4</td>
  <td>1</td>
</tr>
<td>8</td>
  <td>8</td>
  <td>6</td>
  <td>0:46</td>
  <td>0:46</td>
  <td>0:52</td>
  <td>6</td>
  <td>4</td>
</tr>
<tr>
<td>9</td>
  <td>8</td>
  <td>1</td>
  <td>0:54</td>
  <td>0:54</td>
  <td>0:55</td>
  <td>1</td>
  <td>2</td>
</tr>
<tr>
<td>10</td>
  <td>8</td>
  <td>3</td>
  <td>1:02</td>
  <td>1:02</td>
  <td>1:05</td>
  <td>3</td>
  <td>7</td>
</tr>
<tr>
<td>11</td>
  <td>7</td>
  <td>5</td>
  <td>1:09</td>
  <td>1:09</td>
  <td>1:14</td>
  <td>5</td>
  <td>4</td>
</tr>
<td>12</td>
  <td>3</td>
  <td>5</td>
  <td>1:12</td>
  <td>1:14</td>
  <td>1:19</td>
  <td>7</td>
  <td>0</td>
</tr>
<tr>
<td>13</td>
  <td>8</td>
  <td>3</td>
  <td>1:20</td>
  <td>1:20</td>
  <td>1:23</td>
  <td>3</td>
  <td>1</td>
</tr>
<tr>
<td>14</td>
  <td>4</td>
  <td>6</td>
  <td>1:24</td>
  <td>1:24</td>
  <td>1:30</td>
  <td>6</td>
  <td>1</td>
</tr>
<tr>
<td>15</td>
  <td>4</td>
  <td>1</td>
  <td>1:28</td>
  <td>1:30</td>
  <td>1:31</td>
  <td>3</td>
  <td>0</td>
</tr>
<tr>
<td>16</td>
  <td>7</td>
  <td>1</td>
  <td>1:35</td>
  <td>1:35</td>
  <td>1:36</td>
  <td>1</td>
  <td>4</td>
</tr>
<tr>
<td>17</td>
  <td>1</td>
  <td>6</td>
  <td>1:36</td>
  <td>1:36</td>
  <td>1:42</td>
  <td>6</td>
  <td>0</td>
</tr>
<tr>
<td>18</td>
  <td>6</td>
  <td>1</td>
  <td>1:42</td>
  <td>1:42</td>
  <td>1:43</td>
  <td>1</td>
  <td>0</td>
</tr>
<tr>
<td>19</td>
  <td>7</td>
  <td>2</td>
  <td>1:49</td>
  <td>1:49</td>
  <td>1:51</td>
  <td>2</td>
  <td>6</td>
</tr>
<tr>
<td>20</td>
  <td>6</td>
  <td>2</td>
  <td>1:55</td>
  <td>1:55</td>
  <td>1:57</td>
  <td>2</td>
  <td>4</td>
</tr>
</table> 

<h3>Solución</h3>

Utilicé únicamente los comandos disponibles en el intérprete de comandos bash en un sistema linux debian. La única limitación encontrada fue la imposibilidad obtener resultados no enteros en divisiones. Por está razón, instalé bc (bash calculator). <br><br>
<code>apt-get install bc</code> <br><br>
Probé el script en sistemas ubuntu y derivados, mint, y bc ya forma parte de la instalación de los mismos.

<h3>Ejecución</h3>

Para ejecutar el script basta con otorgarle permisos de ejecución haciendo<br>
<code>chmod +x queueTheorySimulation.sh</code>

Luego introducir la cantidad de clientes que se desean utilizar en la simulación, llamemosla n, Se generaran dos arrays con n enteros aleatorios normalmente distribuidos cada uno. El primero con valores [1..10] y el segundo con valores [1..6].  

<h3>Números Aleatorios</h3>

He creado un menú que permite seleccionar de que forma de generaran los números aleatorios,
<ol>
<li>Números Pseudoaleatorios generados por el Generador de números aleatorios de linux (Está era la única forma de generar los números en la versión anterior del script)
<li>Números Aleatorios
Estos números son obtenidos del proyecto <link>http://www.random.org/</link>. RANDOM.ORG ofrece números aleatorios de forma gratuita. Los números son extraídos del ruido atmosférico.
</ol>

El detalle de la implementación de la interfaz HTTP para obtener los números (en el caso particular de este script es un simple HTTP GET) <link>http://www.random.org/analysis/</link> 
<br>
Para conocer el análisis que se hizo para verficar que los números son genuinamente aleatorios <link>http://www.random.org/analysis/</link>
