(in-package #:nyxt-user)

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
