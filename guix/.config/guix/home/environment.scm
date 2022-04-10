(define-module (home environment)
  #:use-module (gnu home)
  #:use-module (gnu home services)
  #:use-module (gnu packages)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  ;; personal modules
  #:use-module (modules xdg)
  #:use-module (modules browsers)
  #:use-module (modules video)
  #:use-module (modules music)
  #:use-module (modules emacs)
  #:use-module (modules shell)
  #:use-module (modules desktop))

(home-environment
 (packages
  `(,@browser-packages
    ,@music-packages
    ,@video-packages
    ,@zsh-packages
    ,@desktop-packages))
 (services
  `(,@xdg-services
    ,@zsh-services
    ,@emacs-services
    ,@desktop-services)))
