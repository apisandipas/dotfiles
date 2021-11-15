#!/usr/bin/env zsh
# Global Vars
export GO_PATH=$HOME/.local/share/go
export DENO_INSTALL=$HOME/.local/share/deno
export EDITOR=$(which vim)
export TERMINAL=$(which kitty)
export BROWSER=$(which brave)
export DEFAULT_USER="bryan"
export ZDOTDIR=$DOTS_DIR/config/zsh
export COMPOSER_PATH=/home/bryan/.config/composer/vendor/bin
export HOME_SCRIPTS=~/bin


# Path Config/
export PATH=$HOME/.yarn/bin:$DENO_INSTALL/bin:$DOTS_DIR/bin:$GO_PATH:$COMPOSER_PATH:$HOME_SCRIPTS:$PATH

if [[ "$TERM" == screen ]]; then
    TERM=screen-256color
fi

#
