(in-package #:nyxt-user)

;;; Sends Youtube URL to emacs daemon and subsequently youtube-dl
(define-command bp/yt-download-video-in-current-page ()
  "Download a video in the currently open buffer."
  (let ((page-url  (url (current-buffer))))
    (echo "Downloading video from: ~A" page-url)
    (eval-in-emacs
     (if (search "youtu" (format nil "~A" page-url))
         `(progn (youtube-dl , (render-url page-url))
                 (youtube-dl-list))
         `(youtube-dl-url ,(render-url page-url))))))


(define-command bp/play-video-in-current-page (&optional (buffer (current-buffer)))
  "Play video in the currently open buffer in MPV media player"
  (uiop:run-program (list
                     "mpv" (render-url (url buffer)))))
