(define-module (atlas home modules shell)
  #:use-module (guix gexp)
  #:use-module (gnu home)
  #:use-module (gnu packages)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages terminals)
  #:use-module (gnu packages shellutils)
  #:use-module (gnu packages rust-apps)
  #:use-module (gnu services)
  #:use-module (gnu home services)
  #:use-module (gnu home services shells)
  #:use-module (gnu home-services shellutils))

(define-public zsh-packages
  (list kitty
        ufetch
        exa
        bat
        zsh-syntax-highlighting
        zsh-autosuggestions))

(define-public zsh-services
  (list
   (service home-zsh-service-type
            (home-zsh-configuration
             (xdg-flavor? #t)
             (environment-variables
              '(("EDITOR" . "\"emacsclient -a ''\"")
                ("GUIX_LOCPATH" . "$HOME/.guix-profile/lib/locale")
                ("GUIX_EXTRA_PROFILES" . "$HOME/.guix-extra-profiles")
                ("_JAVA_AWT_WM_NONREPARENTING" . "1"))))
             (zshrc
              (list
               (local-file "../files/zshrc")))))
   (simple-service 'login-variables
                   home-environment-variables-service-type
                   `(;; ("XDG_DATA_DIRS" . "$XDG_DATA_DIRS:/usr/local/share/:/usr/share/")
                     ;; ("XDG_CONFIG_DIRS" . "$XDG_CONFIG_DIRS:/etc/xdg/")
                     ;; ("XDG_CONFIG_DIRS" . "$HOME/.guix-home/profile/etc/xdg:$XDG_CONFIG_DIRS")
                     ;; ("GUILE_LOAD_PATH" . "$XDG_CONFIG_HOME/guix/current/share/guile/site/3.0:$GUILE_LOAD_PATH")
                     ;; ("GUILE_LOAD_COMPILED_PATH" . "$XDG_CONFIG_HOME/guix/current/lib/guile/3.0/site-ccache:$GUILE_LOAD_COMPILED_PATH")
                     ("PATH" . "$HOME/.local/bin/:$PATH"))))
