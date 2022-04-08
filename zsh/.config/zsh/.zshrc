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
source $ZDOTDIR/lib/keybinds.zsh

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"

# if [ -z "$TMUX" ]; then
#   tmux attach -t TMUX || tmux new -s TMUX
# fi

if [ "$TMUX" = "" ]; then tmux; fi


## History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$ZDOTDIR/.zsh_history"
[ "$HISTSIZE" -lt 50000 ] && HISTSIZE=50000
[ "$SAVEHIST" -lt 10000 ] && SAVEHIST=10000

## History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data

# load Node Version Manager
# source '/usr/share/nvm/init-nvm.sh'

# Aliases
alias cat="bat"

# Lazy movements
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"

# ls replacements
alias ls="exa --icons"
alias ll="exa -lh --icons"
alias lll="exa -alh --icons"
alias lt="exa -T --icons --git-ignore"

alias open="xdg-open"

# git aliases
alias gco="git checkout"
alias gst="git status"

alias services-enabled="systemctl list-unit-files | grep enabled"
alias services-running="systemctl list-units --type=service --state=active"

alias dennis="curl -L http://git.io/unix"

# Docker Commands
alias dcu="docker-compose up"
alias dcuh="docker-compose up -d"
alias dcs="docker-compose stop"
alias dcr="docker-compose restart"


alias zsrc="source $ZDOTDIR/.zshrc"

# load the starship prompt
eval "$(starship init zsh)"

# load z-jump script
eval "$(zoxide init zsh)"

ufetch

