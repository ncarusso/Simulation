<h1>Queuing Theory Simulation</h1>

queueTheorySimulation is a bash script that implements the solution of the queuing theory example proposed in pages 3 and 4 of the book <cite>"Systems Simulation: The Art and Science" by Robert Shannon (1975)</cite> 

<h3>Proposed example</h3>

Consider a single-channel queueing (waiting line) system such as a checkout stand at a small gift shop. Assume that
the time between arrivals of the customers is uniformly distributed from 1 through 10 minutes (for simplicity we
round off all times to the nearest whole minute). Let us assume further that the amount of time required to service
each customer is uniformly distributed from 1 through 6 minutes. We are interested in the average time a customer
spends in the system (both waiting and being serviced) and the percentage of time that the check-out clerk is not
occupied with work.


In brief, we are looking for:

<ul>
<b>i</b> Average time a customer spends in the system
</ul>
<ul>
<b>ii</b>. % of time that the check-out clerk is not occupied with work.

</ul>

<h3>Solution</h3>

I have only used the commands available in the BASH command interpreter in a linux debian system. 
Nevertheless, I have found a limitation while trying to obtain non-integer values in a division operation.
For this reason, I have installed bash calculator.<br>

<code>apt-get install bc</code> <br>

I have tested the script in ubuntu and derivatives (such as mint) and I have noticed that bc is already installed
on them.

<h3>Run</h3>

To run the script you must grant execution permissions to the user by doing<br>

<code>chmod +x queueTheorySimulation.sh</code><br>

and then

<code> ./queueTheorySimulation.sh </code>

Finally, you need to enter the amount of customers to be used in the simulation, for instance, n.
Two arrays with n random integers each will be generated. The first one is time between arrivals of the customers [1..10] and the second represents the time required to service each customer [1..6].

