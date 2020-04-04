#                   .__
#    ________  _____|  |_________   ____
#    \___   / /  ___/  |  \_  __ \_/ ___\
#     /    /  \___ \|   Y  \  | \/\  \___
# /\ /_____ \/____  >___|  /__|    \___  >
# \/       \/     \/     \/            \/
#

export TERM="xterm-256color"
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="powerlevel9k/powerlevel9k"
DEFAULT_USER="bryan"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs time)

# Path Config
export PATH=$PATH:~/.composer/vendor/bin/
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
export PATH=$PATH:$HOME/.rvm/bin
export PATH=/usr/local/sbin:$PATH
export PATH=$HOME/.yarn/bin:$PATH
export PATH=$PATH:~/Library/Python/3.7/bin
export PATH=$PATH:$HOME/scripts

source $ZSH/oh-my-zsh.sh

#Aliases
alias zconf="code ~/.zshrc"
alias ohmy="code ~/.oh-my-zsh"
alias vim="nvim"
alias cat="bat"
alias ls='exa'
alias ll='exa -alh'
alias lll='exa -l | less'
alias lla='exa -la'
alias lt='exa -T'
alias llfu='exa -bghHliS --git'
alias dennis="curl -L http://git.io/unix"
alias gcan="git commit --amend --no-edit"
alias gfp="git push -f"

# Functions
mkcd() { mkdir -p "$@" && cd $_; }
gi() { echo "fetching $@ gitignore"; curl -sLw "\n" https://www.gitignore.io/api/$@ >> .gitignore;}

flip() {
    echo;
    echo -en "( º_º）  ┬─┬   \r"; sleep .5;
    echo -en " ( º_º） ┬─┬   \r"; sleep .5;
    echo -en "  ( ºДº）┬─┬   \r"; sleep .5;
    echo -en "  (╯'Д'）╯︵⊏   \r"; sleep .5;
    echo -en "  (╯'□'）╯︵ ⊏  \r"; sleep .5;
    echo     "  (╯°□°）╯︵ ┻━┻"; sleep .5;
}

plugins=(git osx z zsh-syntax-highlighting)

source ~/.nvm/nvm.sh

