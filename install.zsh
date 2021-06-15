#!/bin/zsh

ADD_CONFIG_COMMAND="source /Users/shared/.zsh_prompt"

if [ $(id -u) = 0 ]
    then
        dscacheutil -q user | grep -A 3 -B 2 -e uid:\ 5'[0-9][0-9]' > users.tmp
        cat users.tmp | grep "name:" | cut -d' ' -f 2 >> names.tmp
        echo Cancel >> names.tmp
        cat users.tmp | grep "dir:" | cut -d' ' -f 2 >> dirs.tmp

        # solution to create an array from https://stackoverflow.com/questions/30988586/creating-an-array-from-a-text-file-in-bash
        namesArray=()
        while IFS= read -r line; do
            namesArray+=("$line")
        done < names.tmp

        dirsArray=()
        while IFS= read -r line; do
            dirsArray+=("$line")
        done < dirs.tmp

        rm names.tmp
        rm dirs.tmp
        rm users.tmp

        print -P "\n$(tput bold).zsh_prompt$(tput sgr0) file will be installed in %F{magenta}/Users/shared%F{color_reset}, but still needs to be sourced from each user in the respective .zshrc file. Choose the user you want to install the prompt for. (To install for multiple but not all users just re-run the script and choose another user)\n"
        # namesArray=( michael richard steven robert exit ) #example for namesArray
        select name in "${namesArray[@]}"; do
            [[ $name == Cancel ]] && return
            # echo "You have chosen $name"
            break
        done

        for i in {1..$#namesArray}; do
            echo "Index: $i, value: ${namesArray[i]}"
            if [[ $namesArray[i] = $name ]]; then
                # echo "index of chosen user: ${i}"
                # echo "path of chosen user: $dirsArray[i]"
                installPath=$dirsArray[i]
            fi
        done

        ZSH_CONFIG_FILE=$installPath/.zshrc

        print -P "\n$(tput bold)Installing $(tput sgr0) .zsh_prompt file in %F{77}/Users/shared ...%F{color_reset}"
        cp zsh_prompt /Users/shared/.zsh_prompt
        print -P "$(tput bold)Success! $(tput sgr0)\n"

        if [[ -f "$ZSH_CONFIG_FILE" ]]; then
            echo ".zshrc file exists. checking for prompt integration."
            if grep $ADD_CONFIG_COMMAND $ZSH_CONFIG_FILE; then
                print -P "$(tput bold)Prompt already sourced.$(tput sgr0) No action needed! Installation finished.\n" # Command already installed
            else 
                print -P "Sourcing zsh_prompt to .zshrc file..."
                echo $ADD_CONFIG_COMMAND >> $ZSH_CONFIG_FILE
                print -P "$(tput bold)Done!$(tput sgr0) Installation finished.\n"
            fi
        fi
    else
        print -P "$(tput bold)%F{red}\nSorry:$(tput sgr0)%F{color_reset} \nRoot priviliges mandatory to install zsh_prompt in shared folder. Re-run script with%F{magenta} \e[3msudo zsh install.zsh\e[0m\n%F{color_reset}\n"
fi

