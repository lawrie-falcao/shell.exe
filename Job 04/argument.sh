#!/bin/bash


if [ $# -ne 2 ]; then
    echo "Usage: $0 <nom_fichier_destination> <fichier_source>"
    exit 1
fi


nom_fichier_destination=$1
fichier_source=$2


touch $nom_fichier_destination


if [ ! -f $fichier_source ]; then
    echo "Le fichier source $fichier_source n'existe pas."
    exit 1
fi


cat $fichier_source > $nom_fichier_destination


echo "Le fichier $nom_fichier_destination a été créé et rempli avec le contenu de $fichier_source."
