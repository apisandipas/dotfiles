;; -*- lexical-binding: t; -*-
;; Configuration for EXWM and Desktop Environment

(guix-emacs-autoload-packages)
(require 'use-package)


(defun bp/run-in-background (command)
  (let ((command-parts (split-string command "[ ]+")))
    (apply #'call-process `(,(car command-parts) nil 0 nil ,@(cdr command-parts)))))

(defun bp/set-wallpaper ()
  (interactive)
  (start-process-shell-command
   "feh" nil  "~/.fehbg"))

(defvar bp/polybar-process nil
  "Holds the process of the running Polybar instance, if any")

(defun bp/kill-panel ()
  (interactive)
  (when bp/polybar-process
    (ignore-errors
      (kill-process bp/polybar-process)))
  (setq bp/polybar-process nil))

(defun bp/start-panel ()
  (interactive)
  (bp/kill-panel)
  (setq bp/polybar-process (start-process-shell-command "polybar" nil "polybar -c ~/.doom.d/exwm/polybar.config.ini --reload main"))
  )

(defun bp/send-polybar-hook (module-name hook-index)
  (start-process-shell-command "polybar-msg" nil (format "polybar-msg hook %s %s" module-name hook-index)))

(defun bp/send-polybar-exwm-workspace ()
  (bp/send-polybar-hook "exwm-workspace" 1))

(defun bp/polybar-exwm-workspace ()
  (interactive)
  (pcase exwm-workspace-current-index
    (0 "  Dev")
    (1 "  Term")
    (2 "  Chat")
    (3 "  Mail")
    (4 "  Data")
    (5 "爵  Web")
    (6 "  VCS")
    (7 "  Music")
    (8 "  Files")
    (9 "  Video")))

;; Update panel indicator when workspace changes
(add-hook 'exwm-workspace-switch-hook #'bp/send-polybar-exwm-workspace)

(defun bp/exwm-init-hook ()

    (modify-all-frames-parameters
     '((right-divider-width . 0)
       (alpha . (75 . 80))
       (mouse-color . "white")
       (internal-border-width . 24)))

  (doom-mark-buffer-as-real-h)

  ;; Make workspace 1 be the one where we land at startup
  (exwm-workspace-switch-create 0)

  ;; Useless gaps
  (exwm-outer-gaps-mode -1)

  ;; Show the time and date in modeline
  (setq display-time-day-and-date nil)
  (display-time-mode -1)

  ;; Start the Polybar panel
  (bp/start-panel)

  ;; Launch apps that will run in the background
  (bp/run-in-background "dropbox")
  (bp/run-in-background "nm-applet")
  (bp/run-in-background "pasystray")
  (bp/run-in-background "blueman-applet")
  (bp/run-in-background "blueman-tray")
  (bp/run-in-background "dunst"))

;; (bp/run-in-background "serve ~/org/brain/bins/agenda -p 8989")

(defun bp/exwm-update-class ()
  (exwm-workspace-rename-buffer exwm-class-name))

(defun bp/exwm-update-title ()
  (pcase exwm-class-name
    ("firefox" (exwm-workspace-rename-buffer (format "Firefox: %s" exwm-title)))))

;; (defun bp/configure-window-by-class ()
;;   (interactive)
;;   (pcase exwm-class-name
;;     ("firefox" (exwm-workspace-move-window 6))))

;; This function should be used only after configuring autorandr!
(defun bp/update-displays ()
  (bp/run-in-background "autorandr --change --force")
  (bp/set-wallpaper)
  (message "Display config: %s"
           (string-trim (shell-command-to-string "autorandr --current"))))

;; (unless (server-running-p "default")
;;   (server-start t t))

(use-package exwm
  :config
  ;; Set the default number of workspaces
  (setq exwm-workspace-number 10)
  ;; When window "class" updates, use it to set the buffer name
  (add-hook 'exwm-update-class-hook #'bp/exwm-update-class)

  ;; When window title updates, use it to set the buffer name
  (add-hook 'exwm-update-title-hook #'bp/exwm-update-title)

  ;; Configure windows as they're created
  ;; (add-hook 'exwm-manage-finish-hook #'bp/configure-window-by-class)

  ;; When EXWM starts up, do some extra confifuration
  (add-hook 'exwm-init-hook #'bp/exwm-init-hook)

  ;; Set the screen resolution (update this to be the correct resolution for your screen!)
  (require 'exwm-randr)
  (exwm-randr-enable)
  (start-process-shell-command "xrandr" nil "xrandr --output eDP-1 --mode 1920x1080  --auto\
        --output HDMI-1 --left-of eDP-1 --mode 1920x1080 --auto")

  ;; This will need to be updated to the name of a display!  You can find
  ;; the names of your displays by looking at arandr or the output of xrandr
  (setq exwm-randr-workspace-monitor-plist '(
                                             0 "DVI-I-2-2"
                                             1 "DVI-I-2-2"
                                             2 "DVI-I-2-2"
                                             3 "DVI-I-2-2"
                                             4 "DVI-I-1-1"
                                             5 "DVI-I-1-1"
                                             6 "DVI-I-1-1"
                                             7 "eDP-1"
                                             8 "eDP-1"
                                             9 "eDP-1"
                                             ))

  ;; NOTE: Uncomment these lines after setting up autorandr!
  ;; React to display connectivity changes, do initial display update
  (add-hook 'exwm-randr-screen-change-hook #'bp/update-displays)
  (bp/update-displays)

  ;; Set the wallpaper after changing the resolution
  (bp/set-wallpaper)

  ;; Automatically send the mouse cursor to the selected workspace's display
  (setq exwm-workspace-warp-cursor t)

  ;; Window focus should follow the mouse pointer
  (setq mouse-autoselect-window nil
        focus-follows-mouse nil)

;;;  Play nice with firefox, enables modal interactions
  (require 'exwm-firefox-evil)
  (add-hook 'exwm-manage-finish-hook 'exwm-firefox-evil-activate-if-firefox)

;;; Start these app in char mode so as to avoid.
  (setq exwm-manage-configurations
        '(((member exwm-class-name '("firefox" "Emacs" "kitty" "Nyxt"))
	   char-mode t)))

  ;; these keys should always pass through to Emacs
  (setq exwm-input-prefix-keys
        '(?\C-x
          ?\C-u
          ?\C-h
          ?\M-x
          escape
          ?\M-`
          ?\M-&
          ?\M-:
          ?\s-o    ;;Allow org-capture to passthru in Xwindows
          ?\s-i    ;; Toggles char-mode/line-mode
          ?\C-\M-j ;; Buffer list
          ?\C-\ )) ;; Ctrl+Space

  ;; Ctrl+Q will enable the next key to be sent directly
  (define-key exwm-mode-map [?\C-q] 'exwm-input-send-next-key)

;;;  TODO: This is may have larger implications
;;;  TODO: Look into methods to move cursor to other frames, like i have set up in Stumpwm
  (general-def :keymaps 'override
    "s-h" 'windmove-left
    "s-l" 'windmove-right
    "s-j" 'windmove-down
    "s-k" 'windmove-up
    )

  ;; Set up global key bindings.  These always work, no matter the input state!
  ;; Keep in mind that changing this list after EXWM initializes has no effect.
  (setq exwm-input-global-keys
        `(
          ;; Move between windows
          ([s-left] . windmove-left)
          ([s-right] . windmove-right)
          ([s-up] . windmove-up)
          ([s-down] . windmove-down)

          ;; ;; Launch applications via shell command
          ([?\s-\\] . (lambda (command)
                       (interactive (list (read-shell-command " ")))
                       (start-process-shell-command command nil command)))

          ;; Switch workspace
          ;; ([?\s-w] . exwm-workspace-switch)
          ([?\s-w] . switch-to-buffer-other-window)
          ;;
          ;; move window workspace with SUPER+SHIFT+{0-9}
          ,@(cl-mapcar (lambda (c n)
                         `(,(kbd (format "s-%c" c)) .
                           (lambda ()
                             (interactive)
                             (exwm-workspace-move-window ,n)
                             ;; (exwm-workspace-switch ,n)
                             )))
                       '(?! ?@ ?# ?$ ?% ?^ ?& ?* ?\( ?\))
                       ;; '(?\) ?! ?@ ?# ?$ ?% ?^ ?& ?* ?\()
                       (number-sequence 0 9))

          ;; Switch to window workspace with SUPER+{0-9}
          ([?\s-1] . (lambda () (interactive) (exwm-workspace-switch-create 0)))
          ([?\s-2] . (lambda () (interactive) (exwm-workspace-switch-create 1)))
          ([?\s-3] . (lambda () (interactive) (exwm-workspace-switch-create 2)))
          ([?\s-4] . (lambda () (interactive) (exwm-workspace-switch-create 3)))
          ([?\s-5] . (lambda () (interactive) (exwm-workspace-switch-create 4)))
          ([?\s-6] . (lambda () (interactive) (exwm-workspace-switch-create 5)))
          ([?\s-7] . (lambda () (interactive) (exwm-workspace-switch-create 6)))
          ([?\s-8] . (lambda () (interactive) (exwm-workspace-switch-create 7)))
          ([?\s-9] . (lambda () (interactive) (exwm-workspace-switch-create 8)))
          ([?\s-0] . (lambda () (interactive) (exwm-workspace-switch-create 9)))))

  (setq window-divider-default-bottom-width 2
        window-divider-default-right-width 2)
  (window-divider-mode)

  (exwm-input-set-key (kbd "s-SPC") 'counsel-linux-app)
  ;; (perspective-exwm-mode)
  (exwm-enable))

(use-package desktop-environment
  :after exwm
  :config
  (desktop-environment-mode)
  :custom
  (desktop-environment-brightness-small-increment "2%+")
  (desktop-environment-brightness-small-decrement "2%-")
  (desktop-environment-brightness-normal-increment "5%+")
  (desktop-environment-brightness-normal-decrement "5%-"))


(require 'cl-lib)
(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
  "Prevent annoying \"Active processes exist\" query when you quit Emacs."
  (cl-letf (((symbol-function #'process-list) (lambda ())))
    ad-do-it))


(defun exwm-input-line-mode ()
  "Set exwm window to line-mode and show mode line"
  (call-interactively #'exwm-input-grab-keyboard))

(defun exwm-input-char-mode ()
  "Set Exwm window to char-mode and hide mode line"
  (call-interactively #'exwm-input-release-keyboard))

(defun exwm-input-toggle-mode ()
  "Toggle between line- and char-mode"
  (with-current-buffer (window-buffer)
    (when (eq major-mode 'exwm-mode)
      (if (equal (nth 1 (nth 1 mode-line-process)) "line")
          (exwm-input-char-mode)
        (exwm-input-line-mode)))))

(exwm-input-set-key (kbd "s-i")
                    (lambda () (interactive)
                      (exwm-input-toggle-mode)))

(exwm-input-set-key (kbd "s-o")
                    (lambda ()
                      (interactive)
                      (exwm-input-toggle-mode)
                      (org-capture)))
