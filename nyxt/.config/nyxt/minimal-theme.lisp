(in-package :nyxt-user)
(use-package :spinneret)

(let ((bg "#21242B")
      (fg "#FFFFFF")
      (mlbg "#272A33")                  ; modeline bg
      (mlfg "#5F656B")
      (ml-highlight-bg "#3F4350")
      (ml-highlight-fg "#749362")
      (h1 "#619ECA")
      (a "#749362")
      (cursor "#eeeee8")
      (mb-prompt "#619ECA")             ; minibuffer prompt
      (mb-separator "#AE7BBF")
      (mono-font "VictorMono Nerd Font")
      )

  ;; minibuffer (bg and fg colors)
  (define-configuration prompt-buffer
      ((style
        (str:concat
         %slot-default%
         (cl-css:css
          `((body
             :border-top ,(str:concat "1px solid" mb-separator)
             :background-color ,bg
             :font-family ,mono-font
             :color ,fg)
            ("#input"
             :background-color ,bg
             :color ,fg
             :border-bottom ,(str:concat "solid 1px " mb-separator))
            ("#cursor"
             :background-color ,cursor
             :color ,fg)
            ("#prompt"
             :color ,mb-prompt)
            (".source-content"
             :background-color ,bg)
            (".source-content th"
             :background-color ,bg)
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
          `((body
             :background-color ,(override bg)
             :color ,(override fg))
            (hr
             :background-color ,(override bg)
             :color ,(override cursor))
            (.button
             :background-color ,(override mlbg)
             :color ,(override mlfg))
            (".button:hover"
             :color ,(override ml-highlight-fg)
             :background-color ,(override ml-highlight-bg))
            (".button:active"
             :color ,(override ml-highlight-fg)
             :background-color ,(override ml-highlight-bg))
            (".button:visited"
             :color ,(override ml-highlight-fg)
             :background-color ,(override ml-highlight-bg))
            (a
             :color ,(override a))
            (h1
             :color ,(override h1))
            (h2
             :color ,(override h1))
            (h3
             :color ,(override h1))
            (h4
             :color ,(override h1))
            (h5
             :color ,(override h1))
            (h6
             :color ,(override h1))))))))

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
             :background-color ,(override bg)
             :color ,(override fg)
             )
            (a :color , (override "blue"))
            ))))
       ))

(defun format-status-vi-mode (&optional (buffer (current-buffer)))
  (spinneret:with-html-string
    (cond ((find-submode buffer 'vi-normal-mode)
           (:div
            (:a :class "button" :title "vi-normal-mode" :href (lisp-url '(nyxt/vi-mode:vi-insert-mode)) " --NORMAL")))
          ((find-submode buffer 'vi-insert-mode)
           (:div
            (:a :class "button" :title "vi-insert-mode" :href (lisp-url '(nyxt/vi-mode:vi-normal-mode)) " INSERT")))
          (t (:span "")))))

  ;; ;Styling status buffer
  (define-configuration status-buffer
      ((height 36)
       (style (str:concat
               %slot-default%
               (cl-css:css
                `(("@font-face"
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
                   :color ,(override bg))
                  (".vi-normal-mode"
                   :background-color ,(override h1))
                  (".vi-insert-mode"
                   :background-color ,(override mb-separator))
                  ("#url"
                   :background-color ,(override mlbg))
                  ("#tabs"
                   :background-color ,(override mlbg)
                   :color ,(override h1))
                  ("a"
                   :color ,(override h1))
                  (".tab:hover"
                   :color "white"
                   :background-color ,(override bg)))))))))

(defun laconic-format-status-modes (buffer window)
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


(defun laconic-format-status-load-status (buffer)
  (spinneret:with-html-string
    (:div :class (if (web-buffer-p buffer)
                     (case (slot-value buffer 'nyxt::load-status)
                       (:unloaded "∅")
                       (:loading "∞")
                       (:finished ""))
                     ""))))

(defun laconic-format-status-url (buffer)
  (spinneret:with-html-string
    (:a :class "button"
        :href (lisp-url '(nyxt:set-url))
        (format nil " ~a — ~a"
                (ppcre:regex-replace-all
                 "(https://|www\\.|/$)"
                 (render-url (url buffer))
                 "")
                (title buffer)))))

(defun laconic-format-status (window)
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
                   (laconic-format-status-load-status buffer)
                   (laconic-format-status-url buffer)))
            (:div :id "tabs"
                  (:raw
                   (nyxt::format-status-tabs)))
            ))))

(define-configuration window
  ((status-formatter #'laconic-format-status)))
