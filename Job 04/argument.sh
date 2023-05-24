#!/bin/bash


if [ $# -ne 2 ]; then
  echo "Usage: $0 <nom_fichier_cible> <nom_fichier_source>"
  exit 1
fi


touch "$1"


cat "$2" > "$1"

echo "Le fichier '$1' a été créé et rempli avec le contenu de '$2'."
