#!/usr/bin/env zsh
# Global Vars
export GO_PATH=$HOME/.local/share/go
export DENO_INSTALL=$HOME/.local/share/deno
export EDITOR=$(which vim)
export TERMINAL=$(which kitty)
export BROWSER=$(which brave)
export MANPAGER="nvim -c 'set ft=man' -"
export DEFAULT_USER="bryan"
export VIM_WIKI_DIR=$HOME/Mastermind
export ZDOTDIR=$DOTS_DIR/config/zsh

# Path Config/
export PATH=$HOME/.yarn/bin:$DENO_INSTALL/bin:$DOTS_DIR/bin:$GO_PATH:$PATH

if [[ "$TERM" == screen ]]; then
    TERM=screen-256color
fi

#
