;;; init.el --- the entry point
;;; -*- lexical-binding: t; -*-

;;; Commentary:

;; You know the drill by now


;; I'm not positive we need to call this manually
;; (guix-emacs-autoload-packages)

;; Ideally we'd load this conditionally, but IDK it will hur tto call it in all cases.
;; (load-file "~/.config/emacs/desktop.el")

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
  ;; Set repositories
  (require 'package)
  (setq-default
   load-prefer-newer t
   package-enable-at-startup nil)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
  (package-initialize)

  ;; Install use-package if for some reason it isnt found on start up,
  ;; this will prevent emacs from buggin out if for some reason guix is buggin out
  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package t))
  (setq-default
   use-package-always-ensure nil)

;;; This is the actual config file. It is omitted if it doesn't exist so emacs won't refuse to launch.
  (when (file-readable-p "~/.config/emacs/config.org")
    (org-babel-load-file (expand-file-name "~/.config/emacs/config.org"))))

