(define-module (atlas home modules video)
  #:use-module (guix gexp)
  #:use-module (gnu home)
  #:use-module (gnu packages)
  #:use-module (gnu packages video)
  #:use-module (gnu packages kde)
  #:use-module (gnu packages graphics))

(define-public video-packages
  (list obs
        obs-websocket
        ffmpeg
        kdenlive
        blender))

;; (define-public video-services
;;   '())
