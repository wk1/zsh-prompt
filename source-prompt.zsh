#!/bin/zsh

# Pfad zur zsh_prompt Datei
prompt_path="$(brew --prefix)/share/zsh_prompt"

# Überprüfung, ob der source-Befehl bereits in .zshrc existiert
if ! grep -qF "source $prompt_path" ~/.zshrc; then
  # Fügt den source-Befehl am Anfang von .zshrc hinzu
  echo "source $prompt_path\n$(cat ~/.zshrc)" > ~/.zshrc
  echo "zsh_prompt wurde zu .zshrc hinzugefügt."
else
  echo "zsh_prompt ist bereits in .zshrc vorhanden."
fi
