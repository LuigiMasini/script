#!/bin/bash

#controlla duplicati da copia a origine: se in origine è presente, viene eliminato da copia
#attenzione: controlla solo se nome è uguale, futuro miglioramento è usare diff per contenuto

cd /home/luigi/foto/altro/altre/belle/ #copia
for i in *.jpg
do
check="$(ls /home/luigi/foto/belle/altre/$i)" #origine
if [ "$check" == "/home/luigi/foto/belle/altre/$i" ]
then
echo rimuovo $i
rm $i
fi
done