# Sets Config home for zsh
export ZDOTDIR="$HOME/.config/zsh"

# Loads personal scripts into the PATH
export PATH="$HOME/.dotfiles/bin:$PATH"

# Fixes TMUX colors, i think?
if [[ "$TERM" == screen ]]; then
    TERM=screen-256color
fi

# Use emacs as out editor, with default server, create a frame, otherwise, start emacs.
export EDITOR="emacsclient -s default -c -a emacs"
export VISUAL=$EDITOR
export TERMINAL=$(which kitty)
export BROWSER=$(which firefox)


setxkbmap -option ctrl:nocaps
