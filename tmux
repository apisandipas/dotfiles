#_____________________________________________________________________
#____oo__________________________________________________________oooo_
#____oo____oo_oo_oo__oo____o_o____o_____ooooo___ooooo__oo_ooo___oo____
#___oooo___ooo_oo__o_oo____o__oo_o_____oo___oo_oo___oo_ooo___o_ooooo__
#____oo____oo__oo__o_oo____o___oo______oo______oo___oo_oo____o_oo_____
#oo__oo__o_oo__oo__o_ooo___o__o_oo__oo_oo______oo___oo_oo____o_oo_____
#oo___ooo__oo______o_oo_ooo__o___oo_oo__ooooo___ooooo__oo____o_oo_____
#_____________________________________________________________________
#
#  Author: Bryan Paronto <bparonto@gmail.com> - github.com/apisandipas
#

set -g default-terminal "tmux-256color" # Fix issue with incorrect Vim colors /  fonts

# Fixes vim mode switchin delay
set -s escape-time 0

# Change the main leader key
unbind C-b
set -g prefix C-a
bind C-a send-prefix

# Enable mouse mode
set -g mouse on

# find session
bind C-f command-prompt -p find-session 'switch-client -t %%'

# Kill the window
bind k confirm kill-window

# split current window horizontally
bind - split-window -v

# split current window vertically
bind \\ split-window -h

# Nice to haves
set -g base-index 1           # start windows numbering at 1
setw -g pane-base-index 1     # make pane numbering consistent with windows
setw -g automatic-rename on   # rename window to reflect current program
set -g renumber-windows on    # renumber windows when a window is closed
set -g set-titles on          # set terminal title
set -g display-panes-time 800 # slightly longer pane indicators display time
set -g display-time 1000      # slightly longer status messages display time
set -g status-interval 10     # redraw status line every 10 seconds

# Window navigation
bind-key -n M-Left previous-window
bind-key -n M-Right next-window

# Smart pane switching with awareness of Vim splits
is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
    | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h'  'select-pane -L'
bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j'  'select-pane -D'
bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k'  'select-pane -U'
bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l'  'select-pane -R'
tmux_version='$(tmux -V | sed -En "s/^tmux ([0-9]+(.[0-9]+)?).*/\1/p")'
if-shell -b '[ "$(echo "$tmux_version < 3.0" | bc)" = 1 ]' \
    "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\'  'select-pane -l'"
if-shell -b '[ "$(echo "$tmux_version >= 3.0" | bc)" = 1 ]' \
    "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\\\'  'select-pane -l'"

bind-key -T copy-mode-vi 'C-h' select-pane -L
bind-key -T copy-mode-vi 'C-j' select-pane -D
bind-key -T copy-mode-vi 'C-k' select-pane -U
bind-key -T copy-mode-vi 'C-l' select-pane -R
bind-key -T copy-mode-vi 'C-\' select-pane -l

# Resource the config file
bind-key r source-file ~/.tmux.conf \; display-message "~/.tmux.conf reloaded"

# Use vim keybindings in copy mode
setw -g mode-keys vi

# Theme settings


# The modes {{{2
  setw -g clock-mode-colour colour117
  setw -g mode-style fg=colour117,bg=colour238,bold
# }}}2

# The panes {{{2
  set -g pane-border-style fg=blue
  set -g pane-active-border-style "bg=default fg=blue"
# }}}2

# The statusbar {{{2
  set -g status-style fg=green,bg=black
  set -g status-left '#[fg=yellow,bold] #H '
  set -g status-right '#[fg=cyan,bold] %H:%M '

  setw -g window-status-style fg=black,bg=green
  setw -g window-status-format "#[bg=green,fg=black] #W #[fg=green,bg=black]\uE0C6 "
  setw -g window-status-current-format "#[bg=blue,fg=black] #W #[fg=blue,bg=black]\uE0C6 "
  setw -g window-status-separator " "
# }}}2

# The messages {{{2
  set -g message-style fg=colour117,bg=colour235,bold
# }}}2

# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-urlview'
set -g @plugin 'tmux-plugins/tmux-logging'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)2
run -b '~/.tmux/plugins/tpm/tpm'
