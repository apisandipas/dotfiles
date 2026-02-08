# Sets Config home for zsh
export ZDOTDIR="$HOME/.config/zsh"

# Loads personal scripts into the PATH
export PATH="$PATH:$HOME/.dotfiles/bin"
export PATH="$PATH:$GEM_HOME/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:/home/bryan/.local/bin"
export PATH="$PATH:`yarn global bin`"
export PATH="$PATH:$HOME/.config/emacs-doom/bin"

# Fixes TMUX colors, i think?
if [[ "$TERM" == screen ]]; then
    TERM=screen-256color
fi

# Use emacs as our editor, with default server, create a frame, otherwise, start emacs.
export EDITOR="emacsclient -s doom -c -a emacs"
export VISUAL=$EDITOR
export TERMINAL=$(which kitty)
export BROWSER=$(which zen-browser)

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export SBCL_HOME=/usr/lib/sbcl/
#export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
#. "$HOME/.cargo/env"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export QT_QPA_PLATFORM=wayland
export GOPATH=$HOME/.local/go
export ELECTRON_OZONE_PLATFORM_HINT=auto

include () {
    [[ -f "$1" ]] && source "$1"
}

include ~/.config/zsh/.secrets-do-not-commit

if [ -d /opt/android-sdk ]; then
    export ANDROID_HOME='/opt/android-sdk'
    export PATH=${PATH}:"$ANDROID_HOME/tools/bin/"
    export PATH=${PATH}:"$ANDROID_HOME/platform-tools/"
    export PATH=${PATH}:"$ANDROID_HOME/cmdline-tools/latest/bin"
    export PATH=${PATH}:"$ANDROID_HOME/emulator"
fi
