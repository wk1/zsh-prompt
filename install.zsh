#!/bin/zsh

# Pfad zur zsh_prompt Datei für den aktuellen Benutzer
ziel="$HOME/.zsh_prompt"

# Kopiert das Prompt in das Benutzerverzeichnis
cp zsh_prompt $ziel

# Fügt den Source-Befehl zu ~/.zshrc hinzu, falls nicht bereits vorhanden
if ! grep -qxF "source $ziel" $HOME/.zshrc; then
    echo "source $ziel" >> $HOME/.zshrc
fi
