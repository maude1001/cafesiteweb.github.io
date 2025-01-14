#!/bin/bash

# Définir le nom du répertoire cible
target_dir="rassemblement_jpg"

# Créer le répertoire avec sudo
sudo mkdir -p "$target_dir"

# Vérifier si la création a réussi
if [ $? -eq 0 ]; then
    echo "Répertoire '$target_dir' créé avec succès."
else
    echo "Erreur lors de la création du répertoire '$target_dir'."
    exit 1
fi

# Trouver et déplacer tous les fichiers .jpg
find . -type f -iname "*.jpg" -exec sudo mv {} "$target_dir" \;

# Vérifier si l'opération de déplacement a réussi
if [ $? -eq 0 ]; then
    echo "Tous les fichiers .jpg ont été déplacés dans '$target_dir'."
else
    echo "Erreur lors du déplacement des fichiers."
    exit 1
fi

