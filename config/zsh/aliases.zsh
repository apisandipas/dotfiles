#!/usr/bin/env zsh

# Aliases
alias vim="lvim"
alias mux="tmuxinator"
alias cat="bat"
alias tm='tmux attach || tmux new'

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
alias dots="cd $DOTS_DIR; vim; cd -"

# Open all changed files in the current repo.
alias fix='vim $(git diff --name-only | uniq)'

# git aliases
alias gco="git checkout"
alias gst="git status"

alias services-enabled="systemctl list-unit-files | grep enabled"
alias services-running="systemctl list-units --type=service --state=active"

alias fzf='rg --files --ignore-case --hidden -g "!{.git,node_modules,vendor,.config,.cargo,.cache}" | fzf'

alias dennis="curl -L htt://git.io/unix"


# Docker Commands
alias dcu="docker-compose up"
alias dcuh="docker-compose up -d"
alias dcs="docker-compose stop"
alias dcr="docker-compose restart"
