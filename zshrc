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
ZSH_THEME="agnoster"  #"powerlevel10k/powerlevel10k"
DEFAULT_USER="bryan"

# Path Config,
export PATH=$PATH:~/.composer/vendor/bin/
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
export PATH=$PATH:$HOME/.rvm/bin
export PATH=/usr/local/sbin:$PATH
export PATH=$HOME/.yarn/bin:$PATH
export PATH=$PATH:~/Library/Python/3.7/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/scripts
export PATH=$HOME/.symfony/bin:$PATH 

plugins=(git z zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

#Aliases
alias vim="nvim"
alias cat="bat"
alias ls="exa --icons"
alias ll="exa -alh --icons"
alias lt="exa -T --icons"
alias dennis="curl -L http://git.io/unix"
alias open="xdg-open"
alias gcan="git commit --amend --no-edit"
alias gfp="git push -f"
alias spi="sudo pacman -S"
alias i3c="vim ~/.i3/config"
alias vimrc="vim ~/.vimrc"
alias polyc="vim ~/.config/polybar/config"
alias zshrc="vim ~/.zshrc"
alias services-enabled="systemctl list-unit-files | grep enabled"
alias services-running="systemctl list-units --type=service --state=active" 
alias :x="echo 'nerd...'; sleep 1; exit;"
alias :wq=":x"

# Functions
mkcd() { mkdir -p "$@" && cd $_; }
gi() { echo "fetching $@ gitignore"; curl -sLw "\n" https://www.gitignore.io/api/$@ >> .gitignore;}
killport() { echo "Killing port $1"; sudo kill -9 $(sudo lsof -t -i:$1) }

flip() {
    echo;
    echo -en "( º_º）  ┬─┬   \r"; sleep .5;
    echo -en " ( º_º） ┬─┬   \r"; sleep .5;
    echo -en "  ( ºДº）┬─┬   \r"; sleep .5;
    echo -en "  (╯'Д'）╯︵⊏   \r"; sleep .5;
    echo -en "  (╯'□'）╯︵ ⊏  \r"; sleep .5;
    echo     "  (╯°□°）╯︵ ┻━┻"; sleep .5;
}



source ~/.nvm/nvm.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
