#!/bin/bash

#dumb script that kill and restart specified program

if [ -z "$2" ]
then
	#other argument in 1st position
	PGRNAME=$1
	PARAM=$2
else
	#program name as only argument
	PGRNAME=$1
fi

echo Wich of the following?
ps -ade | grep $PGRNAME | cut -c 25-
#it is always the first line if complete process name is given, but lets give choice
echo insert number :
read PGRline

#get comand line comand & pid
PGRCOMAND="$(ps -adeo args | grep $PGRNAME | awk NR==$PGRline)"
PGRPID="$(ps -ade | grep $PGRNAME | cut -c 1-6 | awk NR==$PGRline)"

#kill it
kill -9 $PGRPID
# echo kill $PGRPID

if [ -z "$PARAM" ]
then
	nohup $PGRCOMAND >/dev/null &
# 	echo che palle
fi


echo DONE!






# TODO

# processo lento, sveltisco e sottointendo a meno che specificato negli argomenti
# se passo passo sistemo output, magari con un numero per ogni linea di processo
# magari leggo tavola processi 1 volta all'inizio e salvarla in un file invece che 2/3 volte, che potrebbero cambiare nel frattempo