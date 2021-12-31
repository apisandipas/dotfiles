#!/usr/bin/env zsh
# Global Vars
export GO_PATH=$HOME/.local/share/go
export DENO_INSTALL=$HOME/.local/share/deno
export EDITOR=$(which vim)                # $EDITOR opens in terminal
# export VISUAL="emacsclient -c -a emacs"         # $VISUAL opens in GUI mode

export TERMINAL=$(which kitty)
export BROWSER=$(which firefox)
export DEFAULT_USER="bryan"
export ZDOTDIR=$DOTS_DIR/config/zsh
export COMPOSER_PATH=/home/bryan/.config/composer/vendor/bin
export HOME_SCRIPTS=~/bin
export CARGO_PATH=$HOME/.cargo/bin
export DOOM_PATH=$HOME/.emacs.d/bin

# Path Config/
export PATH=$HOME/.yarn/bin:$DENO_INSTALL/bin:$DOTS_DIR/bin:$GO_PATH:$COMPOSER_PATH:$HOME_SCRIPTS:$CARGO_PATH:$DOOM_PATH:$PATH

if [[ "$TERM" == screen ]]; then
    TERM=screen-256color
fi
