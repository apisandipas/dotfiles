(define-module (atlas users atlas)
  #:use-module (gnu home)
  #:use-module (gnu home services)
  #:use-module (gnu packages)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  ;; personal modules
  #:use-module (atlas home modules xdg)
  #:use-module (atlas home modules browsers)
  #:use-module (atlas home modules video)
  #:use-module (atlas home modules music)
  #:use-module (atlas home modules emacs)
  ;; #:use-module (atlas home modules shell)
  #:use-module (atlas home modules desktop))

(home-environment
 (packages
  `(,@browser-packages
    ,@music-packages
    ,@video-packages
    ;; ,@zsh-packages
    ,@desktop-packages))
 (services
  `(,@xdg-services
    ;; ,@zsh-services
    ,@emacs-services
    ,@desktop-services)))
