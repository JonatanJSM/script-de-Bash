#!/usr/bin/bash

pokeName=$1
#https://ioflood.com/blog/jq-linux-command/    https://askubuntu.com/questions/892604/what-is-the-meaning-of-exit-0-exit-1-and-exit-2-in-a-bash-script
if [ -z $pokeName ]; 
then
    echo "Por favor, ingrese un nombre de Pokemon".
    exit 1
else
    apiURL="https://pokeapi.co/api/v2/pokemon/$pokeName"
    dataJSON=$(curl -s $apiURL)
    if [ "$dataJSON" == "Not Found" ]; 
    then
        echo "Pokemon no encontrado"
        exit 1
    else
        id=$(echo $dataJSON| jq .id)
		name=$(echo $dataJSON | jq .name)
		weight=$(echo $dataJSON | jq .weight)
		height=$(echo $dataJSON | jq .height)
		order=$(echo $dataJSON | jq .order)
        clear
        pokeNameUpper=$(echo ${pokeName^})
        echo $pokeNameUpper "(No. $id)"
        echo Id=$order
        echo Weight=$weight
        echo Height=$height
    fi
fi