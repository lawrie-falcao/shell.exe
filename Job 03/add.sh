#!/bin/bash


if [ $# -ne 2 ]; then
    echo "Usage: $0 <nombre1> <nombre2>"
    exit 1
fi


nombre1=$1
nombre2=$2


resultat=$(($nombre1 + $nombre2))


echo "Le résultat de l'addition est : $resultat"

