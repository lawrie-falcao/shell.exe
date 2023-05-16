#!/bin/bash

count=1
while [ $count -le 10 ]
do
    echo "Je suis un script qui arrive à faire une boucle $count"
    ((count++))
done
