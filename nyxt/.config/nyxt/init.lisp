(in-package #:nyxt-user)

;; Load Common Lisp package manager
(load (merge-pathnames #p"quicklisp/setup.lisp" (user-homedir-pathname)))

;;;; Consider using this safer approac to file loading
;;; Load quicklisp. Not sure it works.
;; #-quicklisp
;; (let ((quicklisp-init
;;        (merge-pathnames "quicklisp/setup.lisp" (user-homedir-pathname))))
;;   (when (probe-file quicklisp-init)
;;     (load quicklisp-init)))

;;; Pull in 3rd party dependencies
(ql:quickload :cl-strings)
(ql:quickload :slynk)

(load-after-system :slynk (nyxt-init-file "slynk.lisp"))


(define-command-global bp/reload-config ()
  "Reload the Nyxt configuration file."
  (load-init-file)
  (echo "Configuration reloaded!"))

;;; Loading files from the same directory.
;;; Can be done individually per file, dolist is there to simplify it.
(dolist (file (list
               (nyxt-init-file "utils.lisp")
               (nyxt-init-file "video.lisp")
               (nyxt-init-file "search.lisp")
               (nyxt-init-file "keybindings.lisp")
               (nyxt-init-file "minimal-theme.lisp")
               ;; (nyxt-init-file "emacs-theme.lisp")
               ;; #+nyxt-3
               ;; My styling depends on `theme' introduced in Nyxt 3.
               ;; (nyxt-init-file "style.lisp")
               ))
  (load file))


;; TODO: Consider moving these elsewhere. Like a submodule.
(define-configuration browser
    ;; This is for Nyxt to never prompt me about restoring the previous session.
    ((session-restore-prompt :never-restore)
     (external-editor-program
      (list "emacsclient" "-cn" "-a" "" "-F"
            "((font . \"Iosevka\") (vertical-scroll-bars)(tool-bar-lines) (menu-bar-lines))"))))

;; Define a custom key map for our own function bindings.
;; (defvar *bp-keymap* (make-keymap "bp-map"))

;
;; (define-key *bp-keymap*
;;   "M-x"   'execute-command
;;   "C-c r" 'bp/reload-config
;;   "C-c p" 'bp/play-video-in-current-page
;;   "C-c d" 'bp/youtube-dl-current-page)

;; (define-mode bp-mode ()
;;   "Dummy mode for the custom key bindings in `*bp-keymap*'."
;;   ((keymap-scheme (keymap:make-scheme
;;                    scheme:cua *bp-keymap*
;;                    scheme:emacs *bp-keymap*
;;                    scheme:vi-normal *bp-keymap*))))

;; (define-configuration (buffer web-buffer)
;;   ((default-modes (append '(bp-mode) %slot-default%))))
