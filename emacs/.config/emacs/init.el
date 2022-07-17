;;; init.el --- the entry point
;;; -*- lexical-binding: t; -*-

;;; Commentary:
;;; 

(let ((gc-cons-percentage .6)
      (gc-cons-threshold most-positive-fixnum)
      (read-process-output-max (* 1024 1024)))

  ;; Disable that pesky echo message
  (setq-default inhibit-startup-echo-area-message (user-login-name))

  ;; Profile emacs startup
  ;; (add-hook 'emacs-startup-hook
  ;;           (lambda ()
  ;;             (message "Emacs loaded in %s."
  ;;                      (emacs-init-time))))
  
;; Disable package.el in favor of straight.el
(setq package-enable-at-startup nil)
  
  ;; Install straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Install use-package
(straight-use-package 'use-package)

;; Configure use-package to use straight.el by default
(use-package straight
  :custom (straight-use-package-by-default t))

;;; This is the actual config file. It is omitted if it doesn't exist so emacs won't refuse to launch.q
(when (file-readable-p "~/.config/emacs/config.org")
  (org-babel-load-file (expand-file-name "~/.config/emacs/config.org"))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("db5b906ccc66db25ccd23fc531a213a1afb500d717125d526d8ff67df768f2fc" default))
 '(package-selected-packages
   '(evil undo-tree general which-key all-the-icons treemacs use-package exwm)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
