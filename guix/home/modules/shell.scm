(define-module (home modules shell)
  #:use-module (guix gexp)
  #:use-module (gnu home)
  #:use-module (gnu packages)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages terminals)
  #:use-module (gnu packages tmux)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages shellutils)
  #:use-module (gnu packages rust-apps)
  #:use-module (gnu packages vim)
  #:use-module (gnu packages xorg)
  #:use-module (gnu services)
  #:use-module (gnu home services)
  #:use-module (gnu home services shells)
  #:use-module (gnu home-services xorg)
  #:use-module (gnu home-services shellutils))

(define-public zsh-packages
  (list kitty
        ufetch
        exa
        bat
        zoxide
        ncurses
        bpytop
        setxkbmap
        neovim
        zsh-syntax-highlighting
        zsh-autosuggestions))

(define-public zsh-services
  (list
   ;; Shell
   (service home-zsh-service-type
            (home-zsh-configuration
             (xdg-flavor? #t)
             (zshenv
              (list
               `(local-file
                 (string-append (genenv "HOME")
                                "/dotfiles/guix/home/files/zsh/zshenv"))))
             (zprofile
              (list
               `(local-file
                 (string-append (genenv "HOME")
                                "/dotfiles/guix/home/files/zsh/zprofile"))))
             (zshrc
              (list
               `(local-file
                 (string-append (genenv "HOME")
                                "/dotfiles/guix/home/files/zsh/zshrc"))))))
   ;; Files
   (simple-service 'zsh-aliases
                   home-files-service-type
                   (list
                    `("config/zsh/zsh_aliases"
                      ,(local-file
                        (string-append (getenv "HOME")
                                       "/dotfiles/guix/home/files/zsh/zsh_aliases")))))
   (simple-service 'zsh-functions
                   home-files-service-type
                   (list
                    `("config/zsh/zsh_functions"
                      ,(local-file
                        (string-append (getenv "HOME")
                                       "/dotfiles/guix/home/files/zsh/zsh_functions")))))
   ))
