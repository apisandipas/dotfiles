(in-package :nyxt-user)

(defvar *slynk-started-p*
  (if nyxt::*run-from-repl-p* t nil))

(define-command-global start-slynk (&optional (slynk-port *swank-port*))
  "Start a Slynk server that can be connected to, for instance, in
    Emacs via SLY.

    Warning: This allows Nyxt to be controlled remotely, that is, to execute
    arbitrary code with the privileges of the user running Nyxt.  Make sure
    you understand the security risks associated with this before running
    this command."
  (slynk:create-server :port slynk-port :dont-close t)
  (setf *slynk-started-p* t)
  (echo "Slynk server started on port ~a" slynk-port))

(define-command-global stop-slynk (&optional (slynk-port *swank-port*))
  "Sever the current slynk server connection and disconnect sly on the emacs side, if connected"
  (setf *slynk-started-p* nil)
  (eval-in-emacs
    `(progn
      (sly-disconnect)
      (message "Stopping slynk server connection... ☮")))
  (slynk:stop-server slynk-port)
  (echo "Slynk server stopped on port ~a" slynk-port))


;; Start slynk by default unless one is running already
;; (unless *slynk-started-p* (start-slynk 4006))
