#!/bin/bash

#Rinomina episodi delle serie tv prese da pahe.in con titoli salvati in file 'titoli.txt nella stessa cartella degli episodi e di questo script

FolderName="$(pwd | sed s#"/home/luigi/Video-audio/film/"#""#g)"

echo -e "\n\nRINOMINO EPISODI DELLA SERIE TV\n\n$FolderName\n\n"

echo -e "Comincio..."

x="1"
for OldName  in *.mkv
do
  Title="$(awk NR==${x} titoli.txt)"
  
  echo -e "\n\n$x° episodio\n"
  echo -e "Vecchio nome\t:\t$OldName"
  echo -e "Titolo nuovo\t:\t$Title"
  
  mv -vi "${OldName}" "${OldName/720p.BluRay.x264.350MB-Pahe.in/${Title}}"
  
  x=$(( x+1 ))
done

echo -e "\n\nFinito."