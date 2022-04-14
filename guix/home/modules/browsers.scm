(define-module (home modules browsers)
  #:use-module (gnu home)
  #:use-module (gnu home services)
  #:use-module (gnu services)
  #:use-module (gnu packages)
  #:use-module (guix gexp)
  )

(define-public browser-packages
  (map specification->package
    (list
    ;; TODO: Add qutebrowser config
    "qutebrowser"
    ;; TODO: add Nyxt config
    "nyxt"
    "firefox"
    "ungoogled-chromium"
    )))

(define-public browser-services
  (list
     (simple-service 'nyxt-config
                    home-files-service-type
                    (list
                     `("config/nyxt/init.lisp"
                       ,(local-file
                         (string-append (getenv "HOME")
                                        "/dotfiles/guix/home/files/nyxt/init.lisp")))

                     `("config/nyxt/keybinding.lisp"
                       ,(local-file
                         (string-append (getenv "HOME")
                                        "/dotfiles/guix/home/files/nyxt/keybindings.lisp")))

                     `("config/nyxt/minimal-theme.lisp"
                       ,(local-file
                         (string-append (getenv "HOME")
                                        "/dotfiles/guix/home/files/nyxt/minimal-theme.lisp")))

                     `("config/nyxt/slynk.lisp"
                       ,(local-file
                         (string-append (getenv "HOME")
                                        "/dotfiles/guix/home/files/nyxt/slynk.lisp")))

                     `("config/nyxt/search.lisp"
                       ,(local-file
                         (string-append (getenv "HOME")
                                        "/dotfiles/guix/home/files/nyxt/search.lisp")))

                     `("config/nyxt/utils.lisp"
                       ,(local-file
                         (string-append (getenv "HOME")
                                        "/dotfiles/guix/home/files/nyxt/utils.lisp")))

                     `("config/nyxt/video.lisp"
                       ,(local-file
                         (string-append (getenv "HOME")
                                        "/dotfiles/guix/home/files/nyxt/video.lisp")))
                     ))))
