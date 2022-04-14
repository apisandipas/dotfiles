(define-module (home modules desktop)
  #:use-module (gnu home)
  #:use-module (gnu packages)
  #:use-module (gnu services)
  #:use-module (gnu home services)
  #:use-module (gnu home-services xorg)

  #:use-module (guix gexp))

(define-public desktop-packages
  (map specification->package
       (list
        "feh"
        "rofi"
        "polybar"
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
          `((include . "/dotfiles/guix/home/files/xresources")))))
    (simple-service 'picom-config
                        home-files-service-type
                        (list
                        `(".config/picom/picom.conf"
                        ,(local-file
                            (string-append (getenv "HOME")
                                            "/dotfiles/guix/home/files/picom/picom.conf")))))
     (simple-service 'dunst-config
                        home-files-service-type
                        (list
                        `(".config/dunst/dunstrc"
                        ,(local-file
                            (string-append (getenv "HOME")
                                            "/dotfiles/guix/home/files/dunst/dunstrc")))))
     ;; (simple-service 'rofi-config
     ;;                    home-files-service-type
     ;;                    (list
     ;;                    `("config/rofi/config.rasi"
     ;;                    ,(local-file
     ;;                        (string-append (getenv "HOME")
     ;;                                        "/dotfiles/guix/home/files/rofi/config.rasi"))))) V
    (simple-service 'mbsync-config
                    home-files-service-type
                    (list
                     `(".config/mbsync/mbsyncrc"
                       ,(local-file
                         (string-append (getenv "HOME")
                                        "/dotfiles/guix/home/files/mbsync/mbsyncrc")))))

    (simple-service 'kitty-config
			              home-files-service-type
			              (list
			               `(".config/kitty/kitty.conf"
			                 ,(local-file
			                   (string-append (getenv "HOME")
					                              "/dotfiles/guix/home/files/kitty/kitty.conf")))))
   ))
