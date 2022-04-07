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

source $ZDOTDIR/lib/utils.zsh
source $ZDOTDIR/lib/functions.zsh

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"

alias ll="ls -alh" # Show all the files, nicely.
alias lll="ls -lh" # Show all but the hidden files, nicely
alias cl="clear" # Don't show me anything at all.
alias ..="cd ../"
alias ..."cd ../../"
alias cat="bat"
alias ls="exa"
alias gco="git checkout"
alias gst="git status"
alias zsrc="source $ZDOTDIR/.zshrc && echo 'zshrc reloaded!'"
alias dennis="curl -L http://git.io/unix"

# if [ -z "$TMUX" ]; then
#   tmux attach -t TMUX || tmux new -s TMUX
# fi

## History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$ZDOTDIR/.zsh_history"
[ "$HISTSIZE" -lt 50000 ] && HISTSIZE=50000
[ "$SAVEHIST" -lt 10000 ] && SAVEHIST=10000

## History command configuration
setopt extended_history       
setopt hist_expire_dups_first 
setopt hist_ignore_dups       
setopt hist_ignore_space      
setopt hist_verify            
setopt share_history          

# load Node Version Manager
#source '/usr/share/nvm/init-nvm.sh'

# load the starship prompt
#eval "$(starship init zsh)"

# load z-jump script
eval "$(zoxide init zsh)"

ufetch

GUIX_PROFILE="/home/bryan/.guix-profile"
. "$GUIX_PROFILE/etc/profile"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
