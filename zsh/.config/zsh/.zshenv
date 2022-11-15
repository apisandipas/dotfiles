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

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

setxkbmap -option ctrl:nocaps

export SBCL_HOME=/usr/lib/sbcl/
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"
