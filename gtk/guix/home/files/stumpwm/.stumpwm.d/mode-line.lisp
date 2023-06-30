(in-package :stumpwm)

(defun enable-mode-line-everywhere ()
  (loop for screen in *screen-list* do
    (loop for head in (screen-heads screen) do
      (enable-mode-line screen head t))))
(enable-mode-line-everywhere)

;; (enable-mode-line (current-screen) (current-head) t)

;; turn on/off the mode line for the current head only.
(define-key *root-map* (kbd "B") "mode-line")

(ql:quickload "xembed")
(load-module "cpu")

(load-module "stumptray")
(stumptray:stumptray)
;; (setf stumptray:*tray-placeholder-pixels-per-space* 16)

(defun bp-memory-check (ml)
  (declare (ignore ml))
  (let ((p (get-memory-usage-percent)))
    (format nil "^[~a~a^]"
      (cond ((> 25 p) "^(:fg \"green\")")
      ((> 50 p) "^(:fg \"yellow\")")
      ((> 70 p) "^(:fg \"orange\")")
      (t "^(:fg \"red\")"))
      (ceiling p))))

(add-screen-mode-line-formatter #\M 'bp-memory-check)

(defun bp-battery-check (ml)
  (declare (ignore ml))
  (let ((percentage
   (parse-integer (unix-cat "/sys/class/power_supply/BAT0/capacity")))
  (status (unix-cat "/sys/class/power_supply/BAT0/status")))
    (format nil "^[~a~a^]%^[~a^]"
      (cond ((> 15 percentage) "^(:fg \"red\")")
      ((> 40 percentage) "^(:fg \"orange\")")
      ((> 70 percentage) "^(:fg \"yellow\")")
      (t "^(:fg \"green\")"))
      percentage
      (cond ((string= status "Charging")
       "^(:fg \"green\")+")
      ((string= status "Discharging")
       "^(:fg \"red\")-")
      (t "")))))

(add-screen-mode-line-formatter #\B 'bp-battery-check)

(setf *screen-mode-line-format*
      (list
      "[%n] %w ^>"
     " [MEM: %M%] "
     " [BAT: %B] "
      '(:eval (run-shell-command "date +\"%Y-%m-%d %H:%M\" | tr '\\n' ' '" t))
      "%T"))

