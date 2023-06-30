(in-package #:nyxt-user)

;;; Reset ASDF registries to allow loading Lisp systems from
;;; everywhere.
(reset-asdf-registries)

;;; Load quicklisp. Not sure it works.
#-quicklisp
(let ((quicklisp-init
       (merge-pathnames "quicklisp/setup.lisp" (user-homedir-pathname))))
  (when (probe-file quicklisp-init)
    (load quicklisp-init)))

(define-nyxt-user-system-and-load nyxt-user/basic-config
  :components (
               "keybindings"
               ;; "passwd"
               ;; "status"
               ;; "commands"
               ;; "hsplit"
               ;; "style"
               ;; "unpdf"
               ;; "objdump"
               ;; "github"
               ))

;; (defvar *my-keymap* (make-keymap "my-map"))

;; (define-key *my-keymap*
;;   "C-f" 'nyxt/mode/history:history-forwards
;;   "C-b" 'nyxt/mode/history:history-backwards)

;; (define-mode my-mode
;;     nil
;;   "Dummy mode for the custom key bindings in *my-keymap*."
;;   ((keyscheme-map
;;     (nkeymaps/core:make-keyscheme-map nyxt/keyscheme:cua *my-keymap*
;;                                       nyxt/keyscheme:emacs *my-keymap*
;;                                       nyxt/keyscheme:vi-normal
;;                                       *my-keymap*))))

;; (define-configuration web-buffer
;;   "Enable this mode by default. "
;;   ((default-modes (pushnew 'my-mode %slot-value%))))
