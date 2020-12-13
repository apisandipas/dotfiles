
                       #█████
                      #░░███ 
       #█████████ █████ ░███████  ████████ ██████ 
      #░█░░░░███ ███░░  ░███░░███░░███░░█████░░███
      #░   ███░ ░░█████ ░███ ░███ ░███ ░░░███ ░░░ 
        #███░   █░░░░███░███ ░███ ░███   ░███  ███
 #██    ███████████████ ████ ██████████  ░░██████ 
#░░    ░░░░░░░░░░░░░░░ ░░░░ ░░░░░░░░░░    ░░░░░░  


# Global env Vars
export GO_PATH=$HOME/go
export DENO_INSTALL=$HOME/deno
export DOTS_DIR=$HOME/.dotfiles
export EDITOR=$(which nvim)
export BROWSER=$(which firefox-developer-edition)
export MANPAGER="nvim -c 'set ft=man' -"
#
# Local Vars
ZSH=$HOME/.oh-my-zsh
# ZSH_THEME="powerlevel10k/powerlevel10k"
DEFAULT_USER="bryan"
VIM_WIKI_DIR=$HOME/Dropbox/vimwiki

# Path Config
export PATH=$PATH:$HOME/.yarn/bin:$DENO_INSTALL/bin:$DOTS_DIR/bin:$GO_PATH

# Load oh-my-zsh plugins
plugins=(git vi-mode tmux yarn z zsh-autosuggestions zsh-syntax-highlighting)

# External scripts
source $ZSH/oh-my-zsh.sh
source ~/.nvm/nvm.sh

# Disabled CapsLock
setxkbmap -option ctrl:nocaps

# Aliases
alias vim="nvim"
alias vim8="/usr/bin/vim"
alias mux="tmuxinator"
alias cat="bat"
alias ls="exa --icons"
alias ll="exa -lh --icons"
alias lll="exa -alh --icons"
alias lt="exa -T --icons --git-ignore"
alias cl="clear"
alias open="xdg-open"
alias dots="cd $DOTS_DIR; vim ; cd -;"  # avoids netrw
alias ec="vim $DOTS_DIR/zshrc"
alias sc="source ~/.zshrc; echo '~/.zshrc reloaded! ☮ '"
alias services-enabled="systemctl list-unit-files | grep enabled"
alias services-running="systemctl list-units --type=service --state=active"
alias fzf='rg --files --ignore-case --hidden -g "!{.git,node_modules,vendor,.config,.cargo,.cache}" | fzf'
alias fix='vim $(git diff --name-only | uniq)'
alias XX='trash'


# Sets up ruby env
eval "$(rbenv init -)"

# Functions
mkcd() { mkdir -p "$@" && cd $_; }
gi() { echo "fetching $@ gitignore"; curl -sLw "\n" https://www.gitignore.io/api/$@ >> .gitignore;}
killport() { echo "Killing port $1"; sudo kill -9 $(sudo lsof -t -i:$1) }
path() { echo $PATH | tr ":" "\n" | nl; }

vimwiki () {
    if [[ $# == 0 ]]
    then
        nvim +'VimwikiIndex'
    elif [[ $1 == 'git' ]]
    then
        git -C $VIM_WIKI_DIR ${@:2}
    else
        echo 'Usage: vimwiki [git] [args ...]'
    fi
}

yolo() {
 if [ ! -d ./.git ]; then
  echo "$PWD is not a git repository";
  return 1;
 fi

  echo 'YOLO INCOMING!';
  clear;
  sleep .5;
  git add -A
  git commit --amend --no-edit
  git push -f
  echo 'YOLO COMPLETE';
  return 0;
}

flip() {
    echo;
    echo -en "( º_º）  ┬─┬   \r"; sleep .5;
    echo -en " ( º_º） ┬─┬   \r"; sleep .5;
    echo -en "  ( ºДº）┬─┬   \r"; sleep .5;
    echo -en "  (╯'Д'）╯︵⊏   \r"; sleep .5;
    echo -en "  (╯'□'）╯︵ ⊏  \r"; sleep .5;
    echo     "  (╯°□°）╯︵ ┻━┻"; sleep .5;
}

alias dennis="curl -L http://git.io/unix"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"



eval "$(starship init zsh)"
