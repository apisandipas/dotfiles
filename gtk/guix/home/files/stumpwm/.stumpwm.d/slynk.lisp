(in-package :stumpwm)
(ql:quickload :slynk)

(defparameter *server-running-p* nil
  "Keep track of the state of the Slynk server")

(defparameter *server-port* 4007)

(defcommand stop-slynk ()
  "Stops the slynk server instance"
  (slynk:stop-server *server-port*)
  (setf *server-running-p* nil)
  (message "Slynk server stopped on port ~a" *server-port*))

(defcommand start-slynk () ()
  "Start Slynk if it is not already running"
  (if *server-running-p*
      (message "Slynk server is already active on Port^5 ~a^n" *port-number*)
      (progn
        (slynk:create-server :port *server-port*
                             :style slynk:*communication-style*
                             :dont-close t)
        (setf *server-running-p* t)

        (message "Slynk server is now active on Port^5 ~a^n.
  Use^4 M-x slime-connect^n in Emacs.
  Type^2 (in-package :stumpwm)^n in Slime REPL." *port-number*))))

(defcommand toggle-slynk-server () ()
  (if *server-running-p*
      (run-commands "stop-slynk")
      (run-commands "start-slynk")))

(toggle-slynk-server)

;; modeline status
(defun get-slynk-status ()
  (if *server-running-p*
      (setf *slynk-ml-status* (format nil "Slynk ^3^f1^f0^n Port:^5 ~a^n " *port-number*))
      (setf *slynk-ml-status* "")))

(defun ml-fmt-slynk-status (ml)
  (declare (ignore ml))
  (get-slynk-status))

(add-screen-mode-line-formatter #\S #'ml-fmt-slynk-status)
