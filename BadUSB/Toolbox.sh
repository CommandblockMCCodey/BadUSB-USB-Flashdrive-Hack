#!/bin/bash
echo -ne "\033]0;BadUSB\007"
echo ""
echo Loading...

ASCII176="░"
ASCII177="▒"
ASCII178="▓"
ASCII219="█"
ASCII220="▄"
ASCII223="▀"

for char in "$ASCII178"; do
    for _ in {1..10}; do
        echo -n "$char"
        sleep 0.1
    done
    echo ""
    echo ""
done

scriptFolder="scripts/Linux"
counter=0

cd "$scriptFolder" || exit 1

echo "Durchsuche den Ordner $scriptFolder nach Skripten..."
echo "Liste der verfügbaren Dateien:"
echo "-----------------------------"

files=()

for file in *.sh; do
    ((counter++))
    echo "$counter. $file"
    files[$counter]=$file
done

echo "-----------------------------"
read -p "Bitte geben Sie die Nummer der auszuführenden Datei ein: " choice

if [[ ! "${files[$choice]}" ]]; then
    echo "Ungültige Auswahl. Das Skript wird beendet."
    exit 1
fi

selectedFile="${files[$choice]}"
echo "Ausführen von: $selectedFile"
./"$selectedFile"

echo "Ausführung abgeschlossen."
