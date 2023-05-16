#!/bin/bash


csv_file="/chemin/vers/le/fichier.csv"


create_user() {
  username="$1"
  password="$2"


  useradd "$username"


  echo "$username:$password" | chpasswd


  if [[ "$3" == "admin" ]]; then

    usermod -aG sudo "$username"
  fi
}


check_changes() {

  current_hash=$(md5sum "$csv_file" | awk '{print $1}')


  if [[ "$current_hash" != "$last_hash" ]]; then
    echo "Le fichier CSV a été modifié. Mise à jour des utilisateurs..."


    unset users


    while IFS="," read -r username password role; do
      users+=("$username|$password|$role")
    done < "$csv_file"


    for existing_user in $(awk -F':' '$3 >= 1000 && $1 != "root" {print $1}' /etc/passwd); do
      userdel -r "$existing_user"
    done


    for user_info in "${users[@]}"; do
      IFS="|" read -r username password role <<< "$user_info"
      create_user "$username" "$password" "$role"
    done


    last_hash="$current_hash"
  fi
}


hash_file="/chemin/vers/le/fichier_de_hash"


if [[ -f "$hash_file" ]]; then

  last_hash=$(cat "$hash_file")
else

  touch "$hash_file"
  last_hash=""
fi


check_changes


echo "$current_hash" > "$hash_file"


(crontab -l 2>/dev/null; echo "* * * * * /chemin/vers/accessrights.sh") | crontab -

echo "Le script accessrights.sh a été configuré avec succès."
