#!/usr/bin/env zsh
# Global Vars
export GO_PATH=$HOME/Code/go
export DENO_INSTALL=$HOME/Code/deno
export EDITOR=$(which vim)
export BROWSER=$(which brave)
export MANPAGER="nvim -c 'set ft=man' -"
export DEFAULT_USER="bryan"
export VIM_WIKI_DIR=$HOME/Mastermind

# Path Config/
export PATH=$HOME/.yarn/bin:$DENO_INSTALL/bin:$DOTS_DIR/bin:$GO_PATH:$PATH

if [[ "$TERM" = screen ]]; then
    TERM=screen-256color
fi
