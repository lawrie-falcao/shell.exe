#!/bin/bash


if [ $# -ne 3 ]; then
    echo "Usage: $0 <nombre1> <opérateur> <nombre2>"
    exit 1
fi


nombre1=$1
operateur=$2
nombre2=$3


if [ "$operateur" != "+" ] && [ "$operateur" != "-" ] && [ "$operateur" != "/" ]; then
    echo "Opérateur non valide. Utilisez l'un des opérateurs suivants : +, -, /"
    exit 1
fi


case "$operateur" in
    "+")
        resultat=$(($nombre1 + $nombre2))
        ;;
    "-")
        resultat=$(($nombre1 - $nombre2))
        ;;
    "/")
        resultat=$(($nombre1 / $nombre2))
        ;;
esac


echo "Résultat : $resultat"
