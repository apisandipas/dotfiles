#!/usr/bin/env zsh
#█████
#░░███
#█████████ █████ ░███████  ████████ ██████
#░█░░░░███ ███░░  ░███░░███░░███░░█████░░███
#░   ███░ ░░█████ ░███ ░███ ░███ ░░░███ ░░░
#███░   █░░░░███░███ ░███ ░███   ░███  ███
#██    ███████████████ ████ ██████████  ░░██████
#░░    ░░░░░░░░░░░░░░░ ░░░░ ░░░░░░░░░░    ░░░░░░

# I dont think this is used anymore
export DOTS_DIR=$HOME/.dotfiles

source $ZDOTDIR/lib/utils.zsh
source $ZDOTDIR/lib/functions.zsh
source $ZDOTDIR/lib/keybinds.zsh

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
#zsh_add_plugin "hlissner/zsh-autopair"

# if [ -z "$TMUX" ]; then
#   tmux attach -t TMUX || tmux new -s TMUX
# fi

# if type_exists "tmux"; then
# 	if [ "$TMUX" = "" ]; then tmux attach -t 0 || tmux new; fi
# fi

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

# these dont work on guix, for obvious reasons.
# TODO: wrap these in functions which gripe when you try to run then on GUIX
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
if type_exists "starship"; then
	eval "$(starship init zsh)"
fi

# load z-jump script
if type_exists "zoxide"; then
	eval "$(zoxide init zsh)"
fi

if type_exists "ufetch"; then
	nitch
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# bun completions
[ -s "/home/bryan/.bun/_bun" ] && source "/home/bryan/.bun/_bun"
  export BUN_INSTALL="$HOME/.bun"
  export PATH="$BUN_INSTALL/bin:$PATH"
