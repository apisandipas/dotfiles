#!/usr/bin/env zsh
                       #█████
                      #░░███
       #█████████ █████ ░███████  ████████ ██████
      #░█░░░░███ ███░░  ░███░░███░░███░░█████░░███
      #░   ███░ ░░█████ ░███ ░███ ░███ ░░░███ ░░░
        #███░   █░░░░███░███ ░███ ░███   ░███  ███
 #██    ███████████████ ████ ██████████  ░░██████
#░░    ░░░░░░░░░░░░░░░ ░░░░ ░░░░░░░░░░    ░░░░░░

export DOTS_DIR=$HOME/.dotfiles

source $DOTS_DIR/config/zsh/utils.zsh
source $DOTS_DIR/config/zsh/functions.zsh
source $DOTS_DIR/config/zsh/globals.zsh
source $DOTS_DIR/config/zsh/keybinds.zsh
source $DOTS_DIR/config/zsh/aliases.zsh

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"

# load Node Version Manager
source $HOME/.nvm/nvm.sh

# load the starship prompt
eval "$(starship init zsh)"

# load z-jump script
eval "$(zoxide init zsh)"

nerdfetch
