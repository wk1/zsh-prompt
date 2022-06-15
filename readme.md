# Prompt file for Z Shell (zsh)

## Installation

### Manual installation:
1. Clone this repo.
2. Copy the zsh_prompt file to your `~/.zsh_prompt` users folder or to `/Users/Shared/.zsh_prompt` if you want to have it available for multiple users on your machine
3. If not already present, create a zsh config file with nano ~/.zshrc (or touch ~/.zshrc or code ~/.zshrc).
4. Source the copied file in your config file. For example with `. /Users/Shared/.zsh_prompt` or `source /Users/Shared/.zsh_prompt` or `. ~/.zsh_prompt`...
5. Optionally repeat 3. and 4. for each user that should be able to use the prompt (necessary to use the different emojis for admin/standard users)

### Automatic installation
To Automate this process you can simply run `sudo zsh install.zsh` from an administrator account. Remember to manually create .zshrc file with `nano .zshrc` in `~` beforehand if there is no such file yet. Also remember to that from all accounts that should support the new prompt. (admin icon will only show if the prompt is installed for the admin account aswell.)

