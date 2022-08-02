(in-package #:nyxt-user)

(ql:quickload :cl-strings)
;;  Sends an elisp expression to the emacs daemon for evaluation
;;  Neat, eh?
(defun eval-in-emacs (&rest s-exps)
  "Evaluation s-expression in Emacs."
  (let ((s-exps-string (cl-strings:replace-all
                        (write-to-string
                         `(progn ,@s-exps) :case :downcase)
                        ;; Discard the package prefix.
                        "nyxt::" "")))
    (format *error-output* "Sending to Emacs:~%~a~%" s-exps-string)
    (uiop:run-program
     (list "emacsclient" "-s" "default" "--eval" s-exps-string))))

;; Keep this around for testing purposes between Nyxt and Emacs.
;; Not bound to a keybinding, but global
(define-command-global bp/test-emacs-integration ()
  "Test emacs integration..."
  (echo "Testing emacs integration...")
  (eval-in-emacs
   `(message "hello from Nyxt!")))


(define-command-global bp/org-capture ()
  "Org-capture current page."
  (eval-in-emacs
   `(org-link-set-parameters
     "nyxt"
     :store (lambda ()
              (org-link-store-props
               :type "nyxt"
               :link ,(quri:render-uri (url (current-buffer)))
               :description ,(title (current-buffer)))))
   `(org-capture nil "wN"))
  (echo "Note stored!"))

(defun emacs-with-nyxt-capture-link ()
      (let ((url (quri:render-uri (url (current-buffer)))))
        (if (str:containsp "youtu" url)
            (str:concat
             url
             "&t="
             (write-to-string
              (floor
               (ffi-buffer-evaluate-javascript (current-buffer)
                                               (ps:ps
                                                (ps:chain document
                                                          (get-element-by-id "movie_player")
                                                          (get-current-time))))))
             "s")
          url)))
(define-command-global bp/org-roam-capture ()
      "Org-capture current page."
      (let ((quote (%copy))
            (link (emacs-with-nyxt-capture-link))
            (title (prompt
                    :input (title (current-buffer))
                    :prompt "Title of note:"
                    :sources (list (make-instance 'prompter:raw-source)))))
        (eval-in-emacs
         `(let ((file (on/make-filepath ,(car title) (current-time))))
            (on/insert-org-roam-file
             file
             ,(car title)
             nil
             (list ,link)
             ,quote)
            (find-file file)
            (org-id-get-create)))
        (echo "Org Roam Note stored!")))
