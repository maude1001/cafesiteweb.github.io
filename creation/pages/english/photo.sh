#!/bin/bash

# Définition des répertoires
current_dir=$(pwd)
output_dir="$current_dir/photos"

# Créer le répertoire 'photos' avec les privilèges sudo si nécessaire
if [[ ! -d "$output_dir" ]]; then
    echo "Le répertoire 'photos' n'existe pas. Création du répertoire."
    sudo mkdir -p "$output_dir"
    if [[ $? -ne 0 ]]; then
        echo "Erreur lors de la création du répertoire 'photos'."
        exit 1
    fi
fi

# Parcours tous les fichiers HTML dans le répertoire courant
for file in *.html; do
    if [[ -f "$file" ]]; then
        echo "Traitement du fichier $file..."
        # Affiche les lignes contenant "https:" pour déboguer
        https_lines=$(grep '^https:' "$file")
        
        if [[ -z "$https_lines" ]]; then
            echo "Aucune ligne ne commence par 'https:' dans $file"
        else
            # Si des lignes sont trouvées, les enregistrer dans le fichier de sortie
            echo "$https_lines" >> "$output_dir/$(basename "$file").txt"
            echo "Données extraites depuis $file vers $output_dir/$(basename "$file").txt"
        fi
    else
        echo "Aucun fichier HTML trouvé dans le répertoire."
    fi
done

# Vérifie si l'opération a réussi
echo "Opération terminée. Si aucune erreur n'a été signalée, les fichiers sont dans le répertoire $output_dir."

