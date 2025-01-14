#!/bin/bash

# Vérifier si un répertoire est passé en argument
if [ -z "$1" ]; then
  echo "Veuillez fournir un répertoire en argument."
  exit 1
fi

# Vérifier si le répertoire existe
if [ ! -d "$1" ]; then
  echo "Le répertoire '$1' n'existe pas."
  exit 1
fi

# Nom du fichier de sortie
output_file="file_list.txt"

# Initialiser la liste des fichiers
file_list=()

# Parcourir les fichiers du répertoire
for file in "$1"/*; do
  if [ -f "$file" ]; then
    file_list+=("$(basename "$file")")  # Ajouter le nom de fichier à la liste
  fi
done

# Enregistrer la liste des fichiers dans un fichier texte
echo "Liste des fichiers dans le répertoire '$1' :" > "$1/$output_file"
for file in "${file_list[@]}"; do
  echo "$file" >> "$1/$output_file"
done

# Confirmer la création du fichier
echo "La liste des fichiers a été enregistrée dans '$1/$output_file'."

