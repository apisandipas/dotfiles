#                   .__
#    ________  _____|  |_________   ____
#    \___   / /  ___/  |  \_  __ \_/ ___\
#     /    /  \___ \|   Y  \  | \/\  \___
# /\ /_____ \/____  >___|  /__|    \___  >
# \/       \/     \/     \/            \/
#
export GITSTATUS_LOG_LEVEL=DEBUG
export DENO_INSTALL="/home/bryan/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export TERM="xterm-256color"
EDITOR=$(which nvim)
BROWSER=$(which google-chrome-stable)
export BAT_THEME="Nord"
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"  
DEFAULT_USER="bryan"
DOTS_DIR="~/.dotfiles"

# Path Config,
export PATH=$PATH:$HOME/.yarn/bin:$HOME/scripts

# Load oh-my-zsh plugins
plugins=(git z zsh-autosuggestions zsh-syntax-highlighting)

# External scripts
source $ZSH/oh-my-zsh.sh
source ~/.nvm/nvm.sh

# Disabled CapsLock
setxkbmap -option ctrl:nocaps

# Aliases
alias vim="nvim"
alias cat="bat"
alias ls="exa --icons"
alias ll="exa -alh --icons"
alias lt="exa -T --icons"
alias dennis="curl -L http://git.io/unix"
alias open="xdg-open"
alias dots="vim $DOTS_DIR"
alias i3c="vim $DOTS_DIR/i3config"
alias vimrc="vim $DOTS_DIR/vimrc"
alias polyc="vim $DOTS_DIR/polybar/config"
alias zshrc="vim $DOTS_DIR/zshrc"
alias services-enabled="systemctl list-unit-files | grep enabled"
alias services-running="systemctl list-units --type=service --state=active" 
alias yolo="echo 'YOLO INCOMING!'; sleep .5; git add -A; git commit --amend --no-edit; git push -f; echo 'YOLO COMPLETE'; sleep .5;";

# Functions
mkcd() { mkdir -p "$@" && cd $_; }
gi() { echo "fetching $@ gitignore"; curl -sLw "\n" https://www.gitignore.io/api/$@ >> .gitignore;}
killport() { echo "Killing port $1"; sudo kill -9 $(sudo lsof -t -i:$1) }
path() { echo $PATH | tr ":" "\n" | nl; }

flip() {
    echo;
    echo -en "( º_º）  ┬─┬   \r"; sleep .5;
    echo -en " ( º_º） ┬─┬   \r"; sleep .5;
    echo -en "  ( ºДº）┬─┬   \r"; sleep .5;
    echo -en "  (╯'Д'）╯︵⊏   \r"; sleep .5;
    echo -en "  (╯'□'）╯︵ ⊏  \r"; sleep .5;
    echo     "  (╯°□°）╯︵ ┻━┻"; sleep .5;
}


