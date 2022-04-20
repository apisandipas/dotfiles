;;; init.el --- the entry point
;;; -*- lexical-binding: t; -*-

;;; Commentary:

;; You know the drill by now

(guix-emacs-autoload-packages)

;; (load-file "~/.emacs.d/desktop.el")

;; Profile emacs startup
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs loaded in %s."
                     (emacs-init-time))))

;; Don't pollute working directories
(defvar user-temporary-file-directory
  (concat temporary-file-directory user-login-name "/"))
(make-directory user-temporary-file-directory t)
(setq backup-by-copying t)
(setq backup-directory-alist
      `(("." . ,user-temporary-file-directory)
        (,tramp-file-name-regexp nil)))
(setq auto-save-list-file-prefix
      (concat user-temporary-file-directory ".auto-saves-"))
(setq auto-save-file-name-transforms
      `((".*" ,user-temporary-file-directory t)))

;; Set default coding system
(set-default-coding-systems 'utf-8)

(customize-set-variable 'visible-bell 1)  ; turn off beeps, make them flash!

(customize-set-variable 'large-file-warning-threshold 100000000) ;; change to ~100 MB

;; Add the modules folder to the load path
;; (add-to-list 'load-path (expand-file-name "modules/" user-emacs-directory))

;; Make GC pauses faster by decreasing the threshold.
(setq gc-cons-threshold (* 2 1000 1000))

(customize-set-variable 'custom-file
                        (expand-file-name "custom.el" user-emacs-directory))

;----------------------------
;; Package System Setup
;; (require 'package)

;; (setq package-archives '(("melpa" . "https://melpa.org/packages/")
;;                          ("elpa" . "https://elpa.gnu.org/packages/")))

;; (package-initialize)
;; (unless package-archive-contents
;;   (package-refresh-contents))

;; ;; Initialize use-package on non-Linux platforms
;; (unless (package-installed-p 'use-package)
;;   (package-install 'use-package))

;; (require 'use-package)

;; (if (string= (system-name) "atlas")
;;   ;; We wanna use the Guix-sourced packages on Atlas
;;   (setq use-package-always-ensure nil)
;;   ;; Everywhere else, let the magic happen.
;;   (setq use-package-always-ensure t))

;;----------------------------------


;;---------------------------
;; Emacs Defaults
;; General sane defaults

;;; Code:
(setq user-full-name "Bryan Paronto"
      user-mail-address "bryan@cablcar.digital")

; Revert Dired and other buffers
(customize-set-variable 'global-auto-revert-non-file-buffers t)

;; Revert buffers when the underlying file has changed
(global-auto-revert-mode 1)

;; Use spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; Use "y" and "n" to confirm/negate prompt instead of "yes" and "no"
;; Using `advice' here to make it easy to reverse in custom
;; configurations with `(advice-remove 'yes-or-no-p #'y-or-n-p)'
;;
;; N.B. Emacs 28 has a variable for using short answers, which should
;; be preferred if using that version or higher.
(if (boundp 'use-short-answers)
    (setq use-short-answers t)
  (advice-add 'yes-or-no-p :override #'y-or-n-p))

;; Do not saves duplicates in kill-ring
(customize-set-variable 'kill-do-not-save-duplicates t)

(setq use-dialog-box nil)

;; Make scrolling less stuttered
(setq auto-window-vscroll nil)
(customize-set-variable 'fast-but-imprecise-scrolling t)
(customize-set-variable 'scroll-conservatively 101)
(customize-set-variable 'scroll-margin 0)
(customize-set-variable 'scroll-preserve-screen-position t)

;; Better support for files with long lines
(setq-default bidi-paragraph-direction 'left-to-right)
(setq-default bidi-inhibit-bpa t)
(global-so-long-mode 1)

;; Make shebang (#!) file executable when saved
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

;; Enable savehist-mode for an command history
(savehist-mode 1)

(with-eval-after-load 'no-littering
  ;; no-littering doesn't set this by default so we must place
  ;; auto save files in the same path as it uses for sessions
  (setq auto-save-file-name-transforms
        `((".*" ,(no-littering-expand-var-file-name "auto-save/") t))))

;; Reloate eln-cache folder
(when (boundp 'native-comp-eln-load-path)
  (setcar native-comp-eln-load-path
          (expand-file-name (convert-standard-filename ".local/temp/cache/eln-cache/")
                            user-emacs-directory)))


(with-eval-after-load 'diminish
  (diminish 'evil-collection-unimpaired-mode)
  (diminish 'eldoc-mode))

;;---------------------------
;; UI Customizations


(with-eval-after-load 'treemacs
  (setq treemacs-follow-after-init t
        treemacs-is-never-other-window t
        treemacs-sorting 'alphabetic-case-insensitive-asc)
  ;;treemacs-persist-file (concat doom-cache-dir "treemacs-persist")
  ;; treemacs-last-error-persist-file (concat doom-cache-dir "treemacs-last-error-persist"))
  (setq treemacs-width 25)
  ;; Don't follow the cursor
  (treemacs-follow-mode -1))


;; (eval-after-load 'treemacs-evil
;;   :bind (:map evil-treemacs-state-map
;;               ([return] . treemacs-RET-action)
;;               ([tab] . treemacs-TAB-action)
;;               ("TAB" . treemacs-TAB-action)
;;               ("o v" . treemacs-visit-node-horizontal-split)
;;               ("o s" . treemacs-visit-node-vertical-split)))

(require 'all-the-icons)
(load-theme 'modus-vivendi) t

;;; Fonts
(add-to-list 'default-frame-alist '(font . "Victor Mono" ))
(set-face-attribute 'default nil :font "Victor Mono" :height 130)
(set-face-attribute 'fixed-pitch nil :font "Victor Mono" :height 130)
(set-face-attribute 'variable-pitch nil :font "Cantarell" :height 130 :weight 'regular)

;; Open frame in maximized mode.
(set-frame-parameter (selected-frame) 'fullscreen 'maximized)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(set-frame-parameter (selected-frame)'alpha '(85 . 80))
(set-frame-parameter (selected-frame)'internal-border-width 24)


;;;; Modeline
(with-eval-after-load 'doom-modeline
  ;; Start up the modeline after initialization is finished
  (add-hook 'after-init-hook 'doom-modeline-init)
  (customize-set-variable 'doom-modeline-height 32)
  (customize-set-variable 'doom-modeline-bar-width 6)
  (customize-set-variable 'doom-modeline-minor-modes nil)
  (customize-set-variable 'doom-modeline-buffer-file-name-style 'truncate-except-project)
  ;; (custom-set-faces
  ;;  '(font-lock-comment-face :slant italic)
  ;;  '(font-lock-keyword-face :slant italic))
  (customize-set-variable 'doom-modeline-buffer-file-name-style 'truncate-except-project)
  (doom-modeline-mode 1))

;;;; Help Buffers

;; Make `describe-*' screens more helpful
(with-eval-after-load 'helpful
  (define-key helpful-mode-map [remap revert-buffer] #'helpful-update)
  (global-set-key [remap describe-command] #'helpful-command)
  (global-set-key [remap describe-function] #'helpful-callable)
  (global-set-key [remap describe-key] #'helpful-key)
  (global-set-key [remap describe-symbol] #'helpful-symbol)
  (global-set-key [remap describe-variable] #'helpful-variable)
  (global-set-key (kbd "C-h F") #'helpful-function))


;; Bind extra `describe-*' commands
(global-set-key (kbd "C-h K") #'describe-keymap)

;; also add some examples
(with-eval-after-load 'elisp-demos
  (advice-add 'helpful-update :after #'elisp-demos-advice-helpful-update))

;;;; TODO Line Numbers


(setq fill-column 120)
(column-number-mode)
(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))


;;; Help Me Obi-wan Which-Key. You're my only hope.
(with-eval-after-load 'which-key
  (setq which-key-sort-order #'which-key-key-order-alpha
        which-key-sort-uppercase-first nil
        which-key-add-column-padding 1
        which-key-max-display-columns nil
        which-key-min-display-lines 6
        which-key-side-window-slot -10
        which-key-idle-delay 0.3)
  (put 'which-key-replacement-alist 'initial-value which-key-replacement-alist)
  ;;(add-hook! 'doom-before-reload-hook
  ;;(defun doom-reset-which-key-replacements-h ()
  ;;(setq which-key-replacement-alist (get 'which-key-replacement-alist 'initial-value))))

  ;; general improvements to which-key readability
  (which-key-setup-side-window-bottom)
  ;;(setq-hook! 'which-key-init-buffer-hook line-spacing 3)

  (which-key-add-key-based-replacements (kbd "SPC") "<leader>")
  (which-key-add-key-based-replacements (kbd "SPC-;") "<localleader>")

  (which-key-mode))

;;-----------------------------
;; Evil `vi` emulation

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)


(defun bp/edit-config-file ()
    "Function to open the config file"
    (interactive)
    (message "'Edit Config' not yet implemented"))


(with-eval-after-load 'general
        (general-create-definer bp/leader-keys
        :keymaps '(normal insert visual emacs)
        :prefix "SPC"
        :global-prefix "C-SPC")

        (defun bp/window-maximize-horizontally ()
        "Delete all windows to the left and right of the current window."
        (interactive)
        (require 'windmove)
        (save-excursion
        (while (ignore-errors (windmove-left)) (delete-window))
        (while (ignore-errors (windmove-right)) (delete-window))))

        (defun bp/window-maximize-vertically ()
        "Delete all windows above and below the current window."
        (interactive)
        (require 'windmove)
        (save-excursion
        (while (ignore-errors (windmove-up)) (delete-window))
        (while (ignore-errors (windmove-down)) (delete-window))))

        (bp/leader-keys
                ;; Window Bindings
                "w" '(:ignore t :which-key "windows")
                "wh" '(windmove-left :which-key "evil-move-left")
                "wl" '(windmove-right :which-key "evil-move-right")
                "wj" '(windmove-down :which-key "evil-move-down")
                "wk" '(windmove-left :which-key "evil-move-up")

                "wH" '(evil-window-move-far-left :which-key "move-window-left")
                "wL" '(evil-window-move-far-right :which-key "move-window-right")
                "wJ" '(evil-window-move-very-bottom :which-key "move-window-down")
                "wK" '(evil-window-move-very-top :which-key "move-window-up")

                ;;Window resizing
                "wo" '(evil-window-increase-width :which-key "expand-window")
                "wo" '(evil-window-increase-width :which-key "expand-window")
                "wc" '(evil-window-delete :which-key "close-window")
                "wd" '(evil-window-delete :which-key "delete-window")

                ;; window splitting
                "ws" '(evil-window-split :which-key "split-window-horizonal")
                "wv" '(evil-window-vsplit :which-key "split-window-vertical")

                ;; window change redo/undo
                "wu" '(winner-undo :which-key "undo last window change")
                "wU" '(winner-redo :which-key "redo last window change")

                "w+" '(evil-window-increase-height :which-key "window-increase-height")
                "w-" '(evil-window-decrease-height :which-key "window-decrease-height")
                "w=" '(balance-windows :which-key "balance-windows")
                "w<" '(evil-window-decrease-width :which-key "window-decrease-width")
                "w>" '(evil-window-increase-width :which-key "window-increase-width")

                "wm" '(:ignore t :which-key "maximize")
                "wmm" '(delete-other-windows :which-key "delete-other-windows")
                "wmv" '(bp/window-maximize-vertically :which-key "maximize-window-vertically")
                "wmh" '(bp/window-maximize-horizontally :which-key "maximize-window-horizonatally")

                ;; Buffer Bindings
                "b" '(:ignore t :which-key "buffers")
                "bk" '(kill-this-buffer :which-key "kill-buffer")
                "bd" '(kill-this-buffer :which-key "delete-buffer")
                "bs" '(save-buffer :which-key "save-buffer")
                "be" '(eval-buffer :which-key "eval-buffer")
                "bw" '(ivy-switch-buffer-other-window :which-key "switch-buffer")
                "bc" '(clone-indirect-buffer-other-window :which-key "cloneivy-switch-buffer-other-window-buffer")
                "t"  '(:ignore t :which-key "toggles")
                "te" '(treemacs :which-key "toggle file explorer")
                ;; "tt" '(counsel-load-theme :which-key "choose theme")
                "f"  '(:ignore t :which-key "files")
                "fc" '(bp/edit-config-file :which-key "edit config")))



;;; Code:
(with-eval-after-load 'undo-tree
  (global-undo-tree-mode))

(with-eval-after-load 'evil
  :init
  (customize-set-variable 'evil-want-integration t)
  (customize-set-variable 'evil-want-keybinding nil)
  (customize-set-variable 'evil-want-C-u-scroll t)
  (customize-set-variable 'evil-want-C-i-jump nil)
  (customize-set-variable 'evil-respect-visual-line-mode t)
  (customize-set-variable 'evil-undo-system 'undo-tree)
  :config
  (require 'eval-collection)
  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)
  (evil-collection-init)
  (evil-mode 1)
  ;; Make sure some mode start in Evil state
  (dolist (mode '(custom-mode
                  eshell-mode
                  term-mode))
    (add-to-list 'evil-emacs-state-modes mode))


  (define-key evil-visual-state-map (kbd ">") 'bp/shift-right)
  (define-key evil-visual-state-map (kbd "<") 'bp/shift-left)
  (define-key evil-visual-state-map [tab] 'bp/shift-right)
  (define-key evil-visual-state-map [S-tab] 'bp/shift-left)
  )
;;-----------------------------
;; Completion

(with-eval-after-load 'ivy
  (require 'flx)
  (ivy-mode 1)
  (require 'ivy-posframe)
  (ivy-posframe-mode 1)
  (require 'ivy-rich)
  (ivy-rich-mode 1)
  )


(with-eval-after-load 'counsel
  ;; :diminish
  ;; :after general
  ;; :bind (("C-M-j" . 'counsel-switch-buffer)
  ;;        :map minibuffer-local-map
  ;;        ("C-r" . 'counsel-minibuffer-history))
  ;; :custom
  (counsel-linux-app-format-function #'counsel-linux-app-format-function-name-only)
  (bp/leader-keys
   "tt" '(counsel-load-theme :which-key "choose theme"))
  (counsel-mode 1))
;;-----------------------------
;; Editing
; Standard indentation behaviors
(setq standard-indent 2)

(defun bp/shift-region (distance)
  (let ((mark (mark)))
    (save-excursion
      (indent-rigidly (region-beginning) (region-end) distance)
      (push-mark mark t t)
      ;; Tell the command loop not to deactivate the mark
      ;; for transient mark mode
      (setq deactivate-mark nil))))

(defun bp/shift-right ()
  (interactive)
  (bp/shift-region 1))

(defun bp/shift-left ()
  (interactive)
  (bp/shift-region -1))


;; (use-package format-all
;;   :hook (prog-mode . format-all-mode))

;; (use-package ws-butler
;;   :diminish
;;   :hook ((text-mode . ws-butler-mode)
;;          (prod-mode . ws-butler-mode)))

;; (use-package evil-nerd-commenter
;;   ;; Set a global binding for better line commenting/uncommenting
;;   :config
;;   (bp/leader-keys
;;     "tj" '(evilnc-comment-or-uncomment-lines :which-key "toggle comments")))

;; ;; Set up ws-butler for trimming whitespace and line endings
;; (add-hook 'text-mode-hook 'ws-butler-mode)
;; (add-hook 'prog-mode-hook 'ws-butler-mode)


;; parentheses
(electric-pair-mode 1) ; auto-insert matching bracket
(show-paren-mode 1)    ; turn on paren match highlighting

;;-----------------------------
;; Window / Buffer Settings


;;-----------------------------
;; Org Mode

;;; Customize org-mode font setup
(defun bp/org-font-setup ()
  (setq org-hide-emphasis-markers t)
  (visual-line-mode)
  (org-indent-mode)
  (custom-set-faces
   '(org-level-1 ((t (:inherit outline-1 :height 1.4 ))))
   '(org-level-2 ((t (:inherit outline-2 :height 1.3 ))))
   '(org-level-3 ((t (:inherit outline-3 :height 1.2 ))))
   '(org-level-4 ((t (:inherit outline-4 :height 1.1 ))))
   '(org-level-5 ((t (:inherit outline-5 :height 1.0 ))))
   ))

(add-hook 'org-mode-hook #'bp/org-font-setup)

;;;;; Ligatures & Pretty Symbols
(defun bp/org-prettify-symbols ()
  "Beautify Org Checkbox Symbol."
  (setq prettify-symbols-alist
        (mapcan (lambda (x) (list x (cons (upcase (car x)) (cdr x))))
                '(
                  ("#+begin_src" . ?)
                  ("#+end_src" . ?)
                  ("#+begin_example" . ?)
                  ("#+end_example" . ?)
                  (":END:" . ?)
                  ("#+header:" . ?)
                  ("#+name:" . ?﮸)
                  ("#+results:" . ?)
                  ("#+call:" . ?)
                  (":properties:" . ?)
                  (":logbook:" . ?))))
  (prettify-symbols-mode))

(add-hook 'org-mode-hook #'bp/org-prettify-symbols)

;; (use-package visual-fill-column
;;   :hook ((org-mode text-mode) . visual-fill-column-mode)
;;   :config
;;   (setq-default visual-fill-column-center-text t
;;                 visual-fill-column-width 120))

;; (use-package org-superstar
;;   :after org
;;   :hook (org-mode . org-superstar-mode))



(provide 'init)
;;; init.el ends here
