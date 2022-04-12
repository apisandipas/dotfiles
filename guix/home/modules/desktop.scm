(define-module (home modules desktop)
  #:use-module (gnu home)
  #:use-module (gnu packages)
  #:use-module (gnu services)
  #:use-module (gnu home services)
  #:use-module (gnu home-services xorg)

  #:use-module (guix gexp)
  #:use-module (tassos-guix packages xorg)
  #:use-module (tassos-guix home-services wm)
  #:use-module (tassos-guix home-services notifications))

(define-public desktop-packages
  (map specification->package
       (list
        ;; Misc
        "setxkbmap"

        ;; Set wallpapeuu
        "feh"

        ;; App launcher
        "rofi"

        ;; Terminal environment
        "kitty"
        "ncurses"
        "ufetch"
        "zoxide"
        "tmux"
        "neovim"
        "bpytop"

        ;; Top Panel
        "polybar"

        ;; Compositor
        ;; TODO: May need to find a fork with blur patch
        "picom"

        ;; Fonts!
        "font-victor-mono"
        "font-microsoft-web-core-fonts"
        "font-iosevka"
        "font-fira-mono"
        "font-fira-code"
        "font-google-noto"
        "font-gnu-freefont"
        "font-awesome"
        "font-google-material-design-icons"
        )))

(define-public desktop-services
  (list
   (service home-xresources-service-type
        (home-xresources-configuration
         (config
          `((include . "\"$HOME/.dotfiles/guix/home/modules/files/xresources\"")))))
   (service home-dunst-service-type
            (home-dunst-configuration
             (dunstrc (list
                       (local-file "./files/dunstrc")))))
   (service home-sxhkd-service-type
            (home-sxhkd-configuration
             (sxhkdrc (list
                       (local-file "./files/sxhkdrc")))))
   (service home-bspwm-service-type
            (home-bspwm-configuration
             (bspwmrc (list
                       (local-file "./files/bspwmrc")))))
   (service home-polybar-service-type
            (home-polybar-configuration
             (config (list
                      (local-file "./files/polybar.ini")))))
   ;; (simple-service 'gtk-config
   ;;                 home-files-service-type
   ;;                 `(("config/gtk-3.0/settings.ini"
   ;;                    ,(local-file "../files/gtk3.ini"))
   ;;                   ("config/gtk-3.0/gtk.css"
   ;;                    ,(local-file "../files/gtk3.css"))))
   ))
