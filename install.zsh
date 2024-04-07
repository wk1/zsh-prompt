#!/bin/zsh

# Neuer Pfad zur zsh_prompt Datei
ziel="/etc/.zsh_prompt"

# Kopiert und benennt `zsh-prompt` um und verschiebt es ins Zielverzeichnis
sudo cp zsh_prompt $ziel

# Fügt den Source-Befehl zu /etc/zshrc hinzu, falls nicht bereits vorhanden
if ! grep -qxF "source $ziel" /etc/zshrc; then
  echo "source $ziel" | sudo tee -a /etc/zshrc > /dev/null
fi
