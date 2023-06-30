(in-package :nyxt-user)

(define-command-global bp/reload-config ()
  "Reload the Nyxt configuration file."
  (load-config-file)
  (echo "Configuration reloaded!"))

(defvar *my-buffer-keymap* (make-keymap "*my-buffer-keymap*"))
(define-key *my-buffer-keymap*
  "k" 'delete-current-buffer
  "p" 'switch-buffer-previous
  "n" 'switch-buffer-next
  "w" 'switch-buffer)

(defvar *my-history-keymap* (make-keymap "*my-history-keymap*"))
(define-key *my-history-keymap*
  "f" 'nyxt/mode/history:history-forwards
  "b" 'nyxt/mode/history:history-backwards
  "F" 'nyxt/mode/history:history-forwards-query
  "B" 'nyxt/mode/history:history-backwards-query)

(defvar *my-help-keymap* (make-keymap "*my-help-keymap*"))
(define-key *my-help-keymap*
  "k" 'describe-key
  "b" 'describe-bindings
  "c" 'describe-command
  "o" 'describe-any
  "f" 'describe-function
  "v" 'describe-variable
  "C" 'describe-class
  "s" 'describe-slot)

(defvar *my-open-keymap* (make-keymap "*my-open-keymap*"))
(define-key *my-open-keymap*
  "l" 'set-url
  "L" 'set-url-new-buffer
  "n" 'make-buffer-focus)


(defvar *my-follow-keymap* (make-keymap "*my-follow-keymap*"))
(define-key *my-follow-keymap*
  "l" 'nyxt/mode/hint:follow-hint
  "L" 'nyxt/mode/hint:follow-hint-new-buffer-focus
  "b" 'nyxt/mode/hint:follow-hint-new-buffer)

(defvar *my-media-keymap* (make-keymap "*my-media-keymap*"))
(define-key *my-media-keymap*
  "p" 'bp/play-video-in-current-page
  "d" 'bp/yt-download-video-in-current-page)

(defvar *my-leader-keymap* (make-keymap "*my-leader-keymap*"))
(define-key *my-leader-keymap*
  "b" *my-buffer-keymap*
  "h" *my-history-keymap*
  "H" *my-help-keymap*
  "o" *my-open-keymap*
  "f" *my-follow-keymap*
  "m" *my-media-keymap*)

(defvar *my-normal-keymap* (make-keymap "*my-normal-keymap*"))
(define-key *my-normal-keymap*
  "/" 'nyxt/mode/search-buffer:search-buffers
  "\\" 'nyxt/mode/search-buffer:search-buffer

  "space " *my-leader-keymap*)


(defvar *my-insert-keymap* (make-keymap "*my-insert-keymap*"))
(define-key *my-insert-keymap*
  "C-[" 'nyxt/mode/vi:vi-normal-mode
  "C-w" 'nyxt/mode/input-edit:delete-backwards-word
  "C-f" 'nyxt/mode/input-edit:cursor-forwards
  "C-b" 'nyxt/mode/input-edit:cursor-backwards)

(define-mode my-states-mode
    nil
  "Dummy mode for the custom key bindings in *my-insert-keymap*."
  ((keyscheme-map
    (nkeymaps/core:make-keyscheme-map nyxt/keyscheme:emacs *my-insert-keymap*
                                      nyxt/keyscheme:vi-insert *my-insert-keymap*
                                      nyxt/keyscheme:vi-normal *my-normal-keymap*))))

(defvar *my-global-keymap* (make-keymap "*my-global-keymap*"))
(define-key *my-global-keymap*
  "M-x"   'execute-command
  "C-c r" 'bp/reload-config
  "C-d" 'quit)


(define-mode my-global-mode
    nil
  "My neumonic SPC-leader map"
  ((keyscheme-map
    (nkeymaps/core:make-keyscheme-map nyxt/keyscheme:emacs *my-global-keymap*
                                      nyxt/keyscheme:vi-insert *my-global-keymap*
                                      nyxt/keyscheme:vi-normal *my-global-keymap*))))

(define-configuration web-buffer
  "Enable this mode by default. "
  ((default-modes  '(my-global-mode my-states-mode vi-normal-mode))))

(define-configuration buffer
  "Enable this mode by default. "
  ((default-modes  '(my-global-mode my-states-mode vi-normal-mode))))

(define-configuration prompt-buffer
  "Enable this mode by default. "
  ((default-modes (append '(vi-insert-mode) %slot-value%))))
