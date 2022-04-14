(in-package :nyxt-user)
(use-package :spinneret)

(let (
      (white "#FFFFFF")
      (dark-gray "#21242B")
      (mlbg "#272A33")
      (ml-highlight-bg "#3F4350")
      (mlfg "#5F656B")
      (green "#749362")
      (cursor "#eeeee8")
      (blue "#619ECA")
      (mb-separator "#AE7BBF")
      (btn-hover "#AE7BBF")
      (mono-font "VictorMono Nerd Font")
      )

  ;; minibuffer (bg and fg colors)
  (define-configuration prompt-buffer
      ((style
        (str:concat
         %slot-default%
         (cl-css:css
          `(
            ("@font-face"
            :font-family "VictoMono Nerd Font"
            :src "local('VictorMono Nerd Font')")
            (body
             :border-top ,(str:concat "1px solid" mb-separator)
             :background-color ,dark-gray
             :font-family ,mono-font
             :color white)
            ("#input"
             :background-color ,dark-gray
             :color white
             :border-bottom ,(str:concat "solid 1px " mb-separator))
            ("#cursor"
             :background-color ,cursor
             :color white)
            ("#prompt"
             :color ,blue)
            (".source-content"
             :background-color ,dark-gray)
            (".source-content th"
             :background-color ,dark-gray)
            ("#selection"
             :background-color ,mlbg
             :color ,mlfg)
            (.marked
             :background-color "grey40"
             :color "black")
            (.selected
             :background-color "white"
             :color "black")))))))

  (defun override (color)
    (concatenate 'string color " !important"))

  ;; internal buffers (help, list, etc)
  (define-configuration internal-buffer
      ((style
        (str:concat
         %slot-default%
         (cl-css:css
          `(("@font-face"
            :font-family "VictoMono Nerd Font"
            :src "local('VictorMono Nerd Font')")
            (body
             :font-family ,(override mono-font)
             :background-color ,(override white)
             :color ,(override fg))
            (hr
             :background-color ,(override white)
             :color ,(override cursor))
            (.button
             :cursor ,(override "pointer")
             :min-width ,(override "120px")
             :text-align ,(override "center")
             :background-color ,(override green)
             :padding ,(override "1.25rem")
             :margin-bottom ,(override "1rem")
             :color ,(override white))
            (".button:hover"
             :color ,(override ml-highlight-bg)
             :background-color ,(override btn-hover))
            (".button:active"
             :color ,(override ml-highlight-bg)
             :background-color ,(override blue))
            (".button:visited"
             :color ,(override ml-highlight-bg)
             :background-color ,(override blue))
            (a
             :color ,(override green))
            (blue
             :font-family ,(override mono-font)
             :color ,(override blue))
            (h2
             :font-family ,(override mono-font)
             :color ,(override blue))
            (h3
             :font-family ,(override mono-font)
             :color ,(override blue))
            (h4
             :font-family ,(override mono-font)
             :color ,(override blue))
            (h5
             :font-family ,(override mono-font)
             :color ,(override blue))
            (h6
             :font-family ,(override mono-font)
             :color ,(override blue))))))))

  ;; status bar

  (defun loadingp (&optional (buffer (current-buffer)))
    (and (web-buffer-p buffer)
         (eq (slot-value buffer 'nyxt::load-status) :loading)))

  (hooks:add-hook nyxt/web-mode:scroll-to-top-after-hook
                  (hooks:make-handler-void #'nyxt::print-status))
  (hooks:add-hook nyxt/web-mode:scroll-to-bottom-after-hook
                  (hooks:make-handler-void #'nyxt::print-status))
  (hooks:add-hook nyxt/web-mode:scroll-page-up-after-hook
                  (hooks:make-handler-void #'nyxt::print-status))
  (hooks:add-hook nyxt/web-mode:scroll-page-down-after-hook
                  (hooks:make-handler-void #'nyxt::print-status))
  (hooks:add-hook nyxt/web-mode:scroll-down-after-hook
                  (hooks:make-handler-void #'nyxt::print-status))
  (hooks:add-hook nyxt/web-mode:scroll-up-after-hook
                  (hooks:make-handler-void #'nyxt::print-status))
  (hooks:add-hook nyxt/web-mode:scroll-to-top-after-hook
                  (hooks:make-handler-void #'nyxt::print-status))
  (hooks:add-hook nyxt/web-mode:scroll-to-bottom-after-hook
                  (hooks:make-handler-void #'nyxt::print-status))


  (define-configuration window
      ((message-buffer-style
        (str:concat
         %slot-default%
         (cl-css:css
          `((body
             :background-color ,(override white)
             :color ,(override fg)
             )
            (a :color , (override "blue"))
            ))))
       ))

(defun format-status-vi-mode (&optional (buffer (current-buffer)))
  (spinneret:with-html-string
    (cond ((find-submode buffer 'vi-normal-mode)
           (:div
            (:a :class "button" :title "vi-normal-mode" :href (lisp-url '(nyxt/vi-mode:vi-insert-mode)) "NORMAL")))
          ((find-submode buffer 'vi-insert-mode)
           (:div
            (:a :class "button" :title "vi-insert-mode" :href (lisp-url '(nyxt/vi-mode:vi-normal-mode)) "INSERT")))
          (t (:span "")))))

  ;; ;Styling status buffer
  (define-configuration status-buffer
      ((height 36)
       (style (str:concat
               %slot-default%
               (cl-css:css
                `(
                  ("@font-face"
                   :font-family "VictoMono Nerd Font"
                   :src "local('VictorMono Nerd Font')")
                  ("*"
                   :font-family "VictorMono Nerd Font")
                  ("body"
                   :font-size ,(override "18px")
                   :font-weight ,(override "bold")
                   :line-height ,(override "36px"))
                  ("#container"
                   :height ,(override "36px")
                   :grid-template-columns ,(override "2fr 3fr")
                   :background-color ,(override mlbg))
                  ("#container-vi"
                   :grid-template-columns ,(override "100px 2fr 3fr")
                   :background-color ,(override mlbg))
                  ("#vi-mode"
                   :padding-right ,(override "1rem"))
                  ("#vi-mode a"
                   :color ,(override white))
                  (".vi-normal-mode"
                   :background-color ,(override blue))
                  (".vi-insert-mode"
                   :background-color ,(override mb-separator))
                  ("#url"
                   :background-color ,(override mlbg))
                  ("#tabs"
                   :background-color ,(override mlbg)
                   :color ,(override blue))
                  ("a"
                   :color ,(override blue))
                  (".tab:hover"
                   :color "white"
                   :background-color ,(override white)))))))))

(defun bp-format-status-modes (buffer window)
  (spinneret:with-html-string
    (when (nosave-buffer-p buffer) (:span "⚠ nosave"))
    (:span (format nil "~2d:~2d |"
                   (mod (+ 5 (local-time:timestamp-hour (local-time:now))) 24)
                   (local-time:timestamp-minute (local-time:now))))
    (:a :class "button"
        :href (lisp-url '(nyxt:toggle-modes))
        :title (str:concat "Enabled modes: " (nyxt::list-modes buffer)) "⊕")
    (loop for mode in (serapeum:filter #'visible-in-status-p (modes buffer))
          collect (:a :class "button" :href (lisp-url `(describe-class ',(mode-name mode)))
                      :title (format nil "Describe ~a" (mode-name mode))
                      (if (glyph-mode-presentation-p (status-buffer window))
                          (glyph mode)
                          (nyxt::format-mode mode))))))

(defun format-status-vi-mode (&optional (buffer (current-buffer)))
  (spinneret:with-html-string
    (cond ((find-submode buffer 'vi-normal-mode)
           (:div
            (:a :class "button" :title "vi-normal-mode" :href (lisp-url '(nyxt/vi-mode:vi-insert-mode)) "NORMAL")))
          ((find-submode buffer 'vi-insert-mode)
           (:div
            (:a :class "button" :title "vi-insert-mode" :href (lisp-url '(nyxt/vi-mode:vi-normal-mode)) "INSERT")))
          (t (:span "")))))


(defun bp-format-status-load-status (buffer)
  (spinneret:with-html-string
    (:div :class (if (web-buffer-p buffer)
                     (case (slot-value buffer 'nyxt::load-status)
                       (:unloaded "∅")
                       (:loading "∞")
                       (:finished ""))
                     ""))))

(defun bp-format-status-url (buffer)
  (spinneret:with-html-string
    (:a :class "button"
        :href (lisp-url '(nyxt:set-url))
        (format nil " ~a — ~a"
                (ppcre:regex-replace-all
                 "(https://|www\\.|/$)"
                 (render-url (url buffer))
                 "")
                (title buffer)))))

(defun bp-format-status (window)
  (let* ((buffer (current-buffer window))
         (vi-class (cond ((find-submode buffer 'vi-normal-mode)
                          "vi-normal-mode")
                         ((or (find-submode buffer 'vi-insert-mode)
                              (find-submode buffer 'input-edit-mode))
                          "vi-insert-mode"))))
    (spinneret:with-html-string
      (:div :id (if vi-class "container-vi" "container")
            (when vi-class
              (:div :id "vi-mode" :class (str:concat vi-class " arrow-right")
                    (:raw (format-status-vi-mode buffer))))
            (:div :id "url" :class "arrow-right"
                  (:raw
                   (bp-format-status-load-status buffer)
                   (bp-format-status-url buffer)))
            (:div :id "tabs"
                  (:raw
                   (nyxt::format-status-tabs)))
            ))))

(define-configuration window
  ((status-formatter #'bp-format-status)))
