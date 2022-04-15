(define-module (home modules emacs)
  #:use-module (guix gexp)
  #:use-module (gnu home)
  #:use-module (gnu packages)
  #:use-module (gnu packages emacs)
  #:use-module (gnu services)
  #:use-module (gnu home services)
  ;; from rde
  #:use-module (gnu home-services emacs))

(define emacs-packages
  (map specification->package
       (list
       ;; Emacs: the next batch
       "emacs-exwm"
       "emacs-desktop-environment"

       ;; Keep it tight
       "emacs-no-littering"
       "emacs-ws-butler"
       "emacs-diminish"

       ;; Pkg mgr / configurator
       "emacs-use-package"
       ;; "emacs-straight"

       ;; Completion
       "emacs-vertico"
       "emacs-orderless"
       "emacs-marginalia"
       "emacs-consult"

       "emacs-ivy"
       "emacs-ivy-rich"
       "emacs-ivy-posframe"
       "emacs-counsel"

       ;; Improved Help
       "emacs-elisp-demos"
       "emacs-helpful"

       ;; Be Evil
       "emacs-evil"
       "emacs-evil-collection"
       "emacs-undo-tree"
       "emacs-general"
       "emacs-evil-nerd-commenter"

       ;; File Explorer
       "emacs-treemacs"
       "emacs-which-key"
       "emacs-projectile"
       "emacs-corfu"
       "emacs-helpful"
       "emacs-avy"
       "emacs-embark"
       "emacs-beacon"
       "emacs-unkillable-scratch"
       "emacs-wgrep"

       ;; Tool Modes
       "emacs-magit"
       "emacs-guix"
       "emacs-vterm"
       ;; "emacs-mu4e"
       ;; "emacs-elfeed"
       ;; "emacs-elfeed-goodies"

       ;; Specific Editing Modes
       ;; TODO: all these need configured
       "emacs-markdown-mode"
       "emacs-ledger-mode"
       "emacs-clojure-mode"
       "emacs-cider"
       "emacs-web-mode"
       "emacs-js2-mode"
       "emacs-typescript-mode"
       "emacs-add-node-modules-path"
       "emacs-prettier"

       ;; General Editing Modes
       ;; TODO: all these need configured
       "emacs-sudo-edit"
       "emacs-expand-region"
       "emacs-multiple-cursors"
       "emacs-phi-search"
       "emacs-ws-butler"
       ;; "emacs-yasnippet"
       ;; "emacs-yasnippet-snippets"
       ;; "emacs-ivy-yasnippet"
       "emacs-flyspell-correct"

       ;; Org
       "emacs-org-superstar"
       "emacs-visual-fill-column"
       "emacs-org-roam"
       "emacs-org-download"

       ;; Appearance
       "emacs-all-the-icons"
       "emacs-doom-modeline"
       "emacs-doom-themes"
       "emacs-which-key"

       "emacs-modus-themes"
       "emacs-olivetti")))

(define-public emacs-services
  (list
   (simple-service 'emacs-init
                   home-files-service-type
                   `((".config/emacs/early-init.el"
                      ,(local-file
                        (string-append (getenv "HOME") "/dotfiles/guix/home/files/emacs/early-init.el")))
                     (".config/emacs/init.el"
                      ,(local-file (string-append (getenv "HOME") "/dotfiles/guix/home/files/emacs/init.el")))))
   (service home-emacs-service-type
            (home-emacs-configuration
             (package emacs-next)
             (rebuild-elisp-packages? #t)
             (server-mode? #t)
             (elisp-packages emacs-packages)))))
