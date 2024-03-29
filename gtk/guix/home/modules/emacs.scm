(define-module (home modules emacs)
  #:use-module (guix gexp)
  #:use-module (gnu home)
  #:use-module (gnu packages)
  #:use-module (flat packages emacs)
  #:use-module (gnu services)
  #:use-module (gnu home services)
  ;; from rde
  #:use-module (gnu home-services emacs))

(define-public emacs-packages
  (map specification->package
       (list
       ;; ;; Emacs: the next batch
       "emacs-exwm"
       "emacs-desktop-environment"

       ;; ;; Keep it tight
       ;; "emacs-no-littering"
       ;; "emacs-ws-butler"
       ;; "emacs-diminish"

       ;; ;; ;; Pkg mgr / configurator
      ;; "emacs-use-package"
       ;; ;; "emacs-straight"

       ;; ;; ;; Completion
        "emacs-vertico"
        "emacs-orderless"
        "emacs-marginalia"
        "emacs-consult"

       ;; "emacs-ivy"
       ;; "emacs-ivy-rich"
       ;; "emacs-ivy-posframe"
       ;; "emacs-counsel"

       ;; ;; ;; Improved Help
       ;; "emacs-elisp-demos"
       ;; "emacs-helpful"

       ;; ;; ;; Be Evil
        "emacs-evil"
        "emacs-evil-collection"
       ;; "emacs-undo-tree"
       ;; "emacs-general"
       ;; "emacs-evil-nerd-commenter"

       ;; ;; ;; File Explorer
       "emacs-treemacs"
       "emacs-which-key"
       ;;"emacs-projectile"
       ;; "emacs-corfu"
       ;; "emacs-avy"
       ;; "emacs-embark"
       ;; "emacs-beacon"
       ;; "emacs-unkillable-scratch"
       ;; "emacs-wgrep"

       ;; ;; Tool Modes
       ;; "emacs-magit"
       ;; "emacs-guix"
       ;; "emacs-vterm"
       ;; "emacs-elfeed"

       ;; ;; Specific Editing Modes
       ;; ;; TODO: all these need configured
       ;; "emacs-markdown-mode"
       ;; "emacs-ledger-mode"
       ;; "emacs-clojure-mode"
       ;; "emacs-cider"
       ;; "emacs-web-mode"
       ;; "emacs-js2-mode"
       ;; "emacs-typescript-mode"
       ;; "emacs-add-node-modules-path"
       ;; "emacs-prettier"

       ;; ;; General Editing Modes
       ;; ;; TODO: all these need configured
       ;; "emacs-sudo-edit"
       ;; "emacs-expand-region"
       ;; "emacs-yasnippet"
       ;; "emacs-yasnippet-snippets"
       ;; "emacs-ivy-yasnippet"
       ;; "emacs-flyspell-correct"

       ;; ;; Org
       ;; "emacs-org-superstar"
       ;; "emacs-org-roam"
       ;; "emacs-org-download"

       ;; ;; Appearance
       ;; "emacs-all-the-icons"
       ;; "emacs-doom-modeline"
       ;; "emacs-doom-themes"

       "emacs-modus-themes"
       "emacs-olivetti")))

(define-public emacs-services
  (list
   (simple-service 'emacs-init
                   home-files-service-type
                   `((".exwm"
                      ,(local-file
                        (string-append (getenv "HOME") "/dotfiles/guix/home/files/emacs/desktop.el")))))
   (service home-emacs-service-type
            (home-emacs-configuration
             (package emacs-native-comp)
             (rebuild-elisp-packages? #t)
             (server-mode? #t)
             (xdg-flavor? #t)
             (elisp-packages emacs-packages)
             (early-init-el
              `((load-file ,(local-file "/home/bryan/dotfiles/guix/home/files/emacs/early-init.el"))))
             (init-el
              `((load-file ,(local-file "/home/bryan/dotfiles/guix/home/files/emacs/init.el"))))))))
