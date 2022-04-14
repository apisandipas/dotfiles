(define-module (home atlas-home)
  #:use-module (gnu home)
  #:use-module (gnu home services)
  #:use-module (gnu packages)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  ;; personal modules
  #:use-module (home modules xdg)
  #:use-module (home modules browsers)
  #:use-module (home modules code)
  #:use-module (home modules video)
  #:use-module (home modules music)
  #:use-module (home modules emacs)
  #:use-module (home modules desktop)
  #:use-module (home modules shell))

(home-environment
 (packages
  `(,@browser-packages
    ,@music-packages
    ,@video-packages
    ,@code-packages
    ,@zsh-packages
    ,@desktop-packages))
 (services
  `(,@xdg-services
    ,@zsh-services
    ,@emacs-services
    ,@desktop-services)))
