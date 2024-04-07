#!/bin/zsh

# Pfad zur zsh_prompt Datei
prompt_path="$(brew --prefix)/share/zsh_prompt"

# Entfernt den source-Befehl aus .zshrc, verwendet | als Trennzeichen
if grep -qF "source $prompt_path" ~/.zshrc; then
  sed -i '' "\|source $prompt_path|d" ~/.zshrc
  echo "zsh_prompt wurde aus .zshrc entfernt."
else
  echo "zsh_prompt ist nicht in .zshrc vorhanden."
fi

echo "Bitte führe 'exec zsh' aus, um die Änderungen zu übernehmen."
