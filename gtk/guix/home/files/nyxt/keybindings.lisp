(in-package :nyxt-user)

(defvar *my-buffer-keymap* (make-keymap "*my-buffer-keymap*"))
(define-key *my-buffer-keymap*
  "k" 'delete-current-buffer
  "p" 'switch-buffer-previous
  "n" 'switch-buffer-next
  "w" 'switch-buffer)

(defvar *my-history-keymap* (make-keymap "*my-history-keymap*"))
(define-key *my-history-keymap*
  "f" 'nyxt/web-mode:history-forwards
  "b" 'nyxt/web-mode:history-backwards
  "F" 'nyxt/web-mode:history-forwards-query
  "B" 'nyxt/web-mode:history-backwards-query)

(defvar *my-help-keymap* (make-keymap "*my-help-keymap*"))
(define-key *my-help-keymap*
  "k" 'describe-key
  "b" 'describe-bindings
  "c" 'describe-command
  "o" 'describe-any
  "f" 'describe-function
  "v" 'describe-variable
  "C" 'describe-class
  "s" 'describe-slot
  )

(defvar *my-open-keymap* (make-keymap "*my-open-keymap*"))
(define-key *my-open-keymap*
  "l" 'set-url
  "L" 'set-url-new-buffer
  "n" 'make-buffer-focus
  )

(defvar *my-follow-keymap* (make-keymap "*my-follow-keymap*"))
(define-key *my-follow-keymap*
  "l" 'nyxt/web-mode:follow-hint
  "L" 'nyxt/web-mode:follow-hint-new-buffer-focus
  "b" 'nyxt/web-mode:follow-hint-new-buffer
  )

(defvar *my-media-keymap* (make-keymap "*my-media-keymap*"))
(define-key *my-media-keymap*
  "p" 'bp/play-video-in-current-page
  "d" 'bp/yt-download-video-in-current-page
  )

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
  "/" 'nyxt/web-mode:search-buffers
  "\\" 'nyxt/web-mode:search-buffer

  "space" *my-leader-keymap*)

(defvar *my-insert-keymap* (make-keymap "*my-insert-keymap*"))
(define-key *my-insert-keymap*
  "C-[" 'nyxt/vi-mode:vi-normal-mode
  "C-w" 'nyxt/input-edit-mode:delete-backwards-word
  "C-f" 'nyxt/input-edit-mode:cursor-forwards
  "C-b" 'nyxt/input-edit-mode:cursor-backwards)

;; (defvar *my-minibuffer-keymap* (make-keymap "*my-minibuffer-keymap*"))
;; (define-key *my-minibuffer-keymap*
;;   "C-w" 'nyxt/minibuffer-mode:delete-backwards-word)

(define-mode my-states-mode ()
  "Mode to add custom keybindings"
  ((keymap-scheme :initform (keymap:make-scheme
                             scheme:vi-normal *my-normal-keymap*
                             scheme:emacs *my-insert-keymap*
                             scheme:vi-insert *my-insert-keymap*))))

(defvar *my-global-keymap* (make-keymap "*my-global-keymap*"))
(define-key *my-global-keymap*

  "M-x"   'execute-command

  "C-c r" 'bp/reload-config
  "C-d" 'quit)

(define-mode my-global-mode ()
  "Mode to add custom keybindings"
  ((keymap-scheme :initform (keymap:make-scheme
                             scheme:emacs *my-global-keymap*
                             scheme:vi-normal *my-global-keymap*
                             scheme:vi-insert *my-global-keymap*))))


(define-configuration (buffer web-buffer)
  ((default-modes (append '(my-global-mode my-states-mode vi-normal-mode) %slot-default%))))

