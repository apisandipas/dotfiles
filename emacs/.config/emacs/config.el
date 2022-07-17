;; -*- lexical-binding: t; -*-
;; This file has been generated from dotemacs.org file. DO NOT EDIT.
;; Sources are available from https://github.com/rougier/dotemacs

;; Copyright (C) 2022 Bryan Paronto

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; For a full copy of the GNU General Public License
;; see <https://www.gnu.org/licenses/>.

(setq package-list
      '(cape                ; Completion At Point Extensions
	orderless           ; Completion style for matching regexps in any order
	vertico             ; VERTical Interactive COmpletion
	marginalia          ; Enrich existing commands with completion annotations
	consult             ; Consulting completing-read
	corfu               ; Completion Overlay Region FUnction
	deft                ; Quickly browse, filter, and edit plain text notes
	elfeed              ; Emacs Atom/RSS feed reader
	elfeed-org          ; Configure elfeed with one or more org-mode files
	citar               ; Citation-related commands for org, latex, markdown
	citeproc            ; A CSL 1.0.2 Citation Processor
	flyspell-correct-popup ; Correcting words with flyspell via popup interface
	flyspell-popup      ; Correcting words with Flyspell in popup menus
	guess-language      ; Robust automatic language detection
	helpful             ; A better help buffer
	mini-frame          ; Show minibuffer in child frame on read-from-minibuffer
	imenu-list          ; Show imenu entries in a separate buffer
	magit               ; A Git porcelain inside Emacs.
	markdown-mode       ; Major mode for Markdown-formatted text
	multi-term          ; Managing multiple terminal buffers in Emacs.
	pinentry            ; GnuPG Pinentry server implementation
	use-package         ; A configuration macro for simplifying your .emacs
	vc-backup           ; VC backend for versioned backups
	toc-org	      ; Generate org-mode TOCS
	exec-path-from-shell; Get environment variables such as $PATH from the shell 
	which-key))         ; Display available keybindings in popup

;; Install packages that are not yet installed
(dolist (package package-list)
  (straight-use-package package))

;; Special case for pdf-tools that has recently (2022) changed maintainer
(straight-use-package
 '(pdf-tools :type git :host github :repo "vedang/pdf-tools"))

;; Display org properties in the agenda buffer (modified version)
(straight-use-package
 '(org-agenda-property :type git :host github :repo "Malabarba/org-agenda-property"
                       :fork (:host github :repo "rougier/org-agenda-property")))

;; NANO splash
(straight-use-package
 '(nano-splash :type git :host github :repo "rougier/nano-splash"))

;; NANO theme
(straight-use-package
 '(nano-theme :type git :host github :repo "rougier/nano-theme"))

;; NANO modeline
(straight-use-package
 '(nano-modeline :type git :host github :repo "rougier/nano-modeline"))

;; NANO agenda
(straight-use-package
 '(nano-agenda :type git :host github :repo "rougier/nano-agenda"))

;; SVG tags, progress bars & icons
(straight-use-package
 '(svg-lib :type git :host github :repo "rougier/svg-lib"))

;; Replace keywords with SVG tags
(straight-use-package
 '(svg-tag-mode :type git :host github :repo "rougier/svg-tag-mode"))

;; Dashboard for mu4e
(straight-use-package
 '(mu4e-dashboard :type git :host github :repo "rougier/mu4e-dashboard"))

;; Folding mode for mu4e
(straight-use-package
 '(mu4e-folding :type git :host github :repo "rougier/mu4e-folding"))

;; org imenu
(straight-use-package
 '(org-imenu :type git :host github :repo "rougier/org-imenu"))

;; pdf-drop-mode
(straight-use-package
 '(pdf-drop-mode :type git :host github :repo "rougier/pdf-drop-mode"))

(setq user-full-name "Bryan Paronto"
      user-mail-address "bryan@cablcar.digital")

(setq custom-file (concat user-emacs-directory "custom.el"))

(when (file-exists-p custom-file)
  (load custom-file nil t))

(use-package all-the-icons)
(load-theme 'nano-dark t)

(add-to-list 'default-frame-alist '(font . "Iosevka" ))
(set-face-attribute 'default nil :font "Iosevka" :height 130)
(set-face-attribute 'fixed-pitch nil :font "Iosevka" :height 130)
(set-face-attribute 'variable-pitch nil :font "Iosevka" :height 130 :weight 'bold)

(nano-modeline-mode)

(set-frame-parameter (selected-frame) 'fullscreen 'maximized)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(set-frame-parameter (selected-frame) 'alpha '(85 . 80))
(set-frame-parameter (selected-frame) 'internal-border-width 24)
(setq fill-column 120)
(column-number-mode)
(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)

;;; Help Me Obi-wan Which-Key. You're my only hope.
(use-package which-key
  :config
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

(use-package general
:ensure t
  :config
    (general-create-definer bp/leader-keys
	:keymaps '(normal insert visual emacs)
	:prefix "SPC"
	:global-prefix "C-SPC")

    (defun bp/edit-config-file ()
	"Function to open the config file"
	(interactive)
	(find-file "~/.config/emacs/config.org"))

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

(use-package undo-tree
  :config
  (global-undo-tree-mode))

(use-package evil-collection
  :init
  (customize-set-variable 'evil-want-integration t)
  (customize-set-variable 'evil-want-keybinding nil)
  (customize-set-variable 'evil-want-C-u-scroll t)
  (customize-set-variable 'evil-want-C-i-jump nil)
  (customize-set-variable 'evil-respect-visual-line-mode t)
  (customize-set-variable 'evil-undo-system 'undo-tree))

(use-package evil
  ;; :init
  ;; (customize-set-variable 'evil-want-integration t)
  ;; (customize-set-variable 'evil-want-keybinding nil)
  ;; (customize-set-variable 'evil-want-C-u-scroll t)
  ;; (customize-set-variable 'evil-want-C-i-jump nil)  
  ;; (customize-set-variable 'evil-respect-visual-line-mode t)
  ;; (customize-set-variable 'evil-undo-system 'undo-tree)
  :config
  (require 'evil-collection)
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

	(define-key evil-visual-state-map (kbd ">") 'bp/shift-right)
	(define-key evil-visual-state-map (kbd "<") 'bp/shift-left)
	(define-key evil-visual-state-map [tab] 'bp/shift-right)
	(define-key evil-visual-state-map [S-tab] 'bp/shift-left)

  )
