#!/bin/bash


connection_count=$(grep -c "session ouverte" /var/log/auth.log)


filename="number_connection-$(date +'%d-%m-%Y-%H:%M')"


echo $connection_count > $filename


backup_dir="Backup"
mkdir -p $backup_dir


tar -czf $backup_dir/$filename.tar.gz $filename


rm $filename
