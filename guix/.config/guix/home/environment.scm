(define-module (environment)
  #:use-module (gnu home)
  #:use-module (gnu home services)
  #:use-module (gnu packages)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  ;; personal modules
  #:use-module (apisandipas modules xdg)
  #:use-module (apisandipas modules browsers)
  #:use-module (apisandipas modules video)
  #:use-module (apisandipas modules music)
  #:use-module (apisandipas modules emacs)
  #:use-module (apisandipas modules shell)
  #:use-module (apisandipas modules desktop))

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
