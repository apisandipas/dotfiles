
                       #█████
                      #░░███
       #█████████ █████ ░███████  ████████ ██████
      #░█░░░░███ ███░░  ░███░░███░░███░░█████░░███
      #░   ███░ ░░█████ ░███ ░███ ░███ ░░░███ ░░░
        #███░   █░░░░███░███ ░███ ░███   ░███  ███
 #██    ███████████████ ████ ██████████  ░░██████
#░░    ░░░░░░░░░░░░░░░ ░░░░ ░░░░░░░░░░    ░░░░░░


# 🔨 TODO -
# - drop oh-my-zsh dependency
# - further configure starship

DOTS_DIR=$HOME/.dotfiles

# Load plugins
plugins=(
  git
  vi-mode
  tmux
  yarn
  z
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Modules
source $DOTS_DIR/config/zsh/globals.zsh
source $DOTS_DIR/config/zsh/keybinds.zsh
source $DOTS_DIR/config/zsh/aliases.zsh
source $DOTS_DIR/config/zsh/functions.zsh

# External scripts
source $HOME/.oh-my-zsh/oh-my-zsh.sh
source $HOME/.nvm/nvm.sh

# Sets up ruby vers mgmt
eval "$(rbenv init -)"

# load the starship prompt
eval "$(starship init zsh)"
