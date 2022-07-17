;; ;;; -*-  mode: lisp; -*-
(in-package :stumpwm)
(load "~/quicklisp/setup.lisp")
;; ;;  Set contrib module directory
(set-module-dir "~/.stumpwm.d/modules/")
(ql:quickload :slynk)
(ql:quickload :clx-truetype)
;; ;; (load "~/.stumpwm.d/utilities.lisp")

;; ;; Set up Fonts
;; ;;
;; load Stump contrib modules
(mapc #'load-module
      '(
        "ttf-fonts"
        "swm-gaps"
        ))


;; ;;; Fix the ugly default cursor.
(run-shell-command "xsetroot -cursor_name left_ptr")

;; ;;;; Start Emacs daemon
(run-shell-command "emacs --with-profile default --daemon")

;; ;;;;  Set Wallpaper & fallback color
;; (setf (xlib:window-background (screen-root (current-screen))) #x272A39)
(run-shell-command "feh --no-fehbg --bg-fill ~/.dotfiles/etc/wallpaper/topomap.jpg")

;; ;; Set fonts
(xft:cache-fonts)
(set-font (make-instance 'xft:font :family "Iosevka Nerd Font" :subfamily "Bold" :size 18))

;; ;; Change the prefix key to Super-d
(set-prefix-key (kbd "C-z"))

;; ;; Setup workspaces / Groups
(setf *default-group-name* "dev")

;;; Setup Workspaces
(run-commands
 "grename dev"
 "gnewbg term"
 "gnewbg chat"
 "gnewbg mail"
 "gnewbg data"
 "gnewbg web"
 "gnewbg vcs"
 "gnewbg music"
 "gnewbg files"
 "gnewbg video"
 )

;;; Theme
(setf *colors*
      '("#272A39"   ;black
        "#F7768E"   ;red
        "#9ece6a"   ;green
        "#e0af68"   ;yellow
        "#7aa2f7"   ;blue
        "#9a7ecc"   ;magenta
        "#4abaaf"   ;cyan
        "#FFFFFF")) ;white

(defparameter *default-bg-color* (nth 0 *colors*))
(defparameter *mode-line-bg-color* (nth 0 *colors*))
(defparameter *mode-line-fg-color* (nth 7 *colors*))
(defparameter *msg-bg-color* (nth 0 *colors*))
(defparameter *msg-fg-color* (nth 3 *colors*))
(defparameter *msg-border-color* (nth 7 *colors*))

;; overrides StumpWM default behavior of dimming normal colors
(defun update-color-map (screen)
  "Read *colors* and cache their pixel colors for use when rendering colored text."
  (labels ((map-colors (amt)
       (loop for c in *colors*
       as color = (lookup-color screen c)
       do (adjust-color color amt)
       collect (alloc-color screen color))))
    (setf (screen-color-map-normal screen) (apply #'vector (map-colors 0.00)))))

(update-color-map (current-screen))

;; ;;; General Settings
(setf *window-format* "[%m] %n %s%35t"
      *mode-line-timeout* 4
      *mode-line-pad-y* 8
      *message-window-gravity* :center
      *input-window-gravity* :center
      *window-border-style* :thin
      *mouse-focus-policy* :click
      *message-window-padding* 8
      *maxsize-border-width* 2
      *normal-border-width* 2
      *transient-border-width* 2
      stumpwm::*float-window-border* 2
      stumpwm::*float-window-title-height* 2)

(setf *resize-increment* 25)

;; ;; message/input bar colors
(set-bg-color *msg-bg-color*)
(set-fg-color *msg-fg-color*)
(set-border-color *msg-border-color*)

;; ;; message/input bar settings
(set-msg-border-width 3)
(setf *message-window-padding* 6)
;;; Gaps
;; ;;; This Tends to crash everything. Lets learn to live without it.
(setf swm-gaps:*outer-gaps-size* 32
      swm-gaps:*inner-gaps-size* 32
      swm-gaps:*head-gaps-size* 0)

(when *initializing*
  (swm-gaps:toggle-gaps))

;; ;; startup message
(setf *startup-message* "^4    Stump Window Manager ^7has initialized!
Press ^2Ctrl+z ? ^7for Help. ^4 Happy Hacking!^n
          Powered with ^02 Common Lisp ")

;; ;; Turn on compositor for funsies,
;; ;; TODO: consider removing this for better performance overall.
(run-shell-command "picom -b --config ~/.stumpwm.d/misc/picom.conf")
;; ;; (run-shell-command "polybar -c ~/.stumpwm.d/misc/polybar.ini main")


(run-shell-command "xrandr --output DP-2 --mode 1920x1080  --auto\
        --output DP-1 --rotate right --left-of DP-2 --mode 1920x1080 --auto\
        --output HDMI-1 --rotate left --right-of DP-2 --mode 1920x1080 --auto")
(refresh-heads)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;; Desktop Integration                                                         ;;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Brightness
(when *initializing*
  (defconstant backlightfile "/sys/class/backlight/intel_backlight/brightness"))

;; Xbacklight broak so I made this
(defcommand brighten (val) ((:number "Change brightness by: "))
  (with-open-file (fp backlightfile
                      :if-exists :overwrite
                      :direction :io)
                      (write-sequence (write-to-string (+ (parse-integer (read-line fp nil)) val))
                                      fp)))

(let ((bdown "brighten -1000")
      (bup   "brighten  1000")
      (m *top-map*))
  (define-key m (kbd "s-C-s")                 bdown)
  (define-key m (kbd "XF86MonBrightnessDown") bdown)
  (define-key m (kbd "s-C-d")                 bup)
  (define-key m (kbd "XF86MonBrightnessUp")   bup))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;; Slynk settings                                                          ;;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


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
      (message "Slynk server is already active on Port^5 ~a^n" *server-port*)
      (progn
        (slynk:create-server :port *server-port*
                             :style slynk:*communication-style*
                             :dont-close t)
        (setf *server-running-p* t)

        (message "Slynk server is now active on Port^5 ~a^n.
  Use^4 M-x slime-connect^n in Emacs.
  Type^2 (in-package :stumpwm)^n in Slime REPL." *server-port*))))

(defcommand toggle-slynk-server () ()
  (if *server-running-p*
      (run-commands "stop-slynk")
      (run-commands "start-slynk")))

(toggle-slynk-server)

(define-key *top-map* (kbd "s-s") "toggle-slynk")

;; modeline status
(defun get-slynk-status ()
  (if *server-running-p*
      (setf *slynk-ml-status* (format nil "Slynk Port:^5 ~a" *server-port*))
      (setf *slynk-ml-status* "^1 Slynk is inactive")))

(defun ml-fmt-slynk-status (ml)
  (declare (ignore ml))
  (get-slynk-status))

(add-screen-mode-line-formatter #\S #'ml-fmt-slynk-status)


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;; Modeline settings                                                    ;;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setf *mode-line-timeout* 1)
(setf *mode-line-border-width* 0)

(setf *mode-line-background-color* *mode-line-bg-color*)
(setf *mode-line-border-color* *mode-line-bg-color*)
(setf *mode-line-foreground-color* *mode-line-fg-color*)

;; (defun bp-memory-check (ml)
;;   (declare (ignore ml))
;;   (let ((p (get-memory-usage-percent)))
;;     (format nil "^[~a~a^]"
;;       (cond ((> 25 p) "^(:fg \"green\")")
;;       ((> 50 p) "^(:fg \"yellow\")")
;;       ((> 70 p) "^(:fg \"orange\")")
;;       (t "^(:fg \"red\")"))
;;       (ceiling p))))

;; (add-screen-mode-line-formatter #\M #'bp-memory-check)

;; (defparameter *battery-percent* "")

;; (defun get-battery-status ()
;;   (let* ((batgetcap (run-shell-command "cat /sys/class/power_supply/BAT0/capacity | tr -d '\\r\\n'" t)))
;;     (setf *battery-percent* (format nil "^4^f1^f0^n ~a% " batgetcap))))

;; (defun battery-percentage (ml)
;;   (declare (ignore ml))
;;   *battery-percent*)

;; (run-with-timer 0 10 #'get-battery-status)

;; (add-screen-mode-line-formatter #\B #'battery-percentage)

(setf *time-modeline-string* "^2 %Y-%m-%d %H:%M")

(setf *screen-mode-line-format*
      (list
       "%n"                           ; groups
       " %W "                             ; windows
       "^>"                             ; align right
       " %S "                             ; slynk status
       ;; " [MEM: %M%] "                   ; Memory
       ;; "%d"
       ))                           ; Date / Time

(defun enable-mode-line-everywhere ()
  (loop for screen in *screen-list* do
    (loop for head in (screen-heads screen) do
      (enable-mode-line screen head t))))
(enable-mode-line-everywhere)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;; Keybindings settings                                                    ;;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; display the key sequence in progress
(defun key-press-hook (key key-seq cmd)
  (declare (ignore key))
  (unless (eq *top-map* *resize-map*)
    (let ((*message-window-gravity* :bottom-right))
      (message "Key sequence: ~a" (print-key-seq (reverse key-seq))))
    (when (stringp cmd)
      ;; give 'em time to read it
      (sleep 0.5))))
(add-hook *key-press-hook* 'key-press-hook)

;; ;; navigation
;; ;; cycle forward and back through groups
(define-key *root-map* (kbd ".") "gnext")
(define-key *root-map* (kbd ",") "gprev")
(define-key *top-map* (kbd "s-Up") "gnext")
(define-key *top-map* (kbd "s-Down") "gprev")

;; cycle through windows using Super key + arrows
(define-key *top-map* (kbd "s-Right") "pull-hidden-next")
(define-key *top-map* (kbd "s-Left") "pull-hidden-previous")

;; send window to next/previous groups
(define-key *root-map* (kbd "s-Right") "gnext-with-window")
(define-key *root-map* (kbd "s-Left") "gprev-with-window")

(define-key *top-map* (kbd "s-SPC") "fnext")

;; ;;others
;; ;; run or raise firefox
(defcommand firefox () ()
  "Start Forefox or switch to it, if it is already running"
  (run-or-raise "firefox" '(:class "firefox")))

(define-key *root-map* (kbd "b") "firefox")

;; open terminal
(define-key *root-map* (kbd "Return") "exec kitty")
(define-key *root-map* (kbd "c") "exec kitty")
(define-key *root-map* (kbd "C-c") "exec kitty")

;; toggle useless gaps keybinding (Super + u)
(define-key *top-map* (kbd "s-u") "toggle-gaps")

;; hard restart keybinding (Super + r)
(define-key *top-map* (kbd "s-r") "restart-hard")

;; allows me to continously have control of Prefix key
;; by unmapping it from 'pull-hidden-other
(undefine-key *tile-group-root-map* (kbd "C-z"))
(define-key *root-map* (kbd "C-z") "abort")

;; take screenshot
(defcommand stump-screenshot () ()
  (run-shell-command "exec scrot")
  (sleep 0.5)
  (message "Screenshot taken!"))

(define-key *top-map* (kbd "Print") "stump-screenshot")

;; ;;; Splits
(defcommand hsplit-and-focus () ()
  "create a new frame on the right and focus it."
  (hsplit)
  (move-focus :right))

(defcommand vsplit-and-focus () ()
  "create a new frame below and focus it."
  (vsplit)
  (move-focus :down))

(define-key *root-map* (kbd "\\") "hsplit-and-focus")
(define-key *root-map* (kbd "-") "vsplit-and-focus")


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;; Emacs Integration                                                         ;;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defcommand emacs () () ; override default emacs command
  "Start emacs if emacsclient is not running and focus emacs if it is
running in the current group"
  (run-or-raise "emacsclient -s default -c -a 'emacs'" '(:class "Emacs")))

;; Treat emacs splits like Xorg windows
(defun is-emacs-p (win)
  "nil if the WIN"
  (when win
    (string-equal (window-class win) "Emacs")))

(defun exec-el (expression)
  "execute emacs lisp do not collect it's output"
  (run-shell-command (concat "emacsclient -s default -e '" (write-to-string
                                                 expression) "'") nil))

(defun eval-string-as-el (expression)
  "evaluate a string as emacs lisp"
  (run-shell-command (concat "emacsclient -s default -e '" expression "'") t))

;;  Not currently used. potentially move to utilities.lisp
(defun eval-el (expression)
  "evaluate emacs lisp and collect it's output"
  (eval-string-as-el (write-to-string expression)))

(defun emacs-winmove (direction)
  "executes the emacs function winmove-DIRECTION where DIRECTION is a string"
  (eval-string-as-el (concat "(windmove-" direction ")")))

(defun better-move-focus (ogdir)
  "Similar to move-focus but also treats emacs windows as Xorg windows"
  (let ((mv `(move-focus ,(intern (string ogdir) "KEYWORD"))))
    (if (is-emacs-p (current-window))
        (when
            ;; There is not emacs window in that direction
            (= (length (emacs-winmove
                        (string-downcase (string ogdir))))
               1)
          (eval mv))
        (eval mv))))

(defcommand bp/move (dir) ((:direction "Enter direction: "))
  (when dir
    (better-move-focus (string-upcase dir))))

(define-key *top-map* (kbd "s-h") "bp/move left")
(define-key *top-map* (kbd "s-j") "bp/move down")
(define-key *top-map* (kbd "s-k") "bp/move up")
(define-key *top-map* (kbd "s-l") "bp/move right")

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;; Debugging                                                               ;;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (redirect-all-output (data-dir-file "debug-output" "txt"))
;; (setf stumpwm:*debug-level* 10)
;;
;;
