;;;  This file contains packages used to build up the desktop environment.
;;; This shouldn't ideally be updates very often

(specifications->manifest
 '(
   ;; Set wallpapeuu
   "feh"

   ;; App launcher
   "rofi"

   ;; Terminal environment
   "kitty"
   "tmux"
   "neovim"
   "exa"
   "bat"

   ;; System monitor
   "bpytop"

   ;; Top Panel
   "polybar"

   ;; Compositor
   ;; TODO: May need to find a fork with blur patch
   "picom"

   ;; Fonts!
   "font-victor-mono"
   "font-microsoft-web-core-fonts"
   ))
