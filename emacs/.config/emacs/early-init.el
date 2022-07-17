;;; early-init.el --- the earliest of init files  -*- lexical-binding: t; -*-

;;; Commentary:

;; This file runs early on in the initalization process.

;;; Code:

;; Increase the GC threshold for faster startup
;; The default is 800 kilobytes.  Measured in bytes.
(setq gc-cons-threshold (* 50 1000 1000))

;; Prefer loading newest compiled .el file
(setq load-prefer-newer noninteractive)

;; Native compilation settings
(when (featurep 'native-compile)
  ;; Silence compiler warnings as they can be pretty disruptive
  (setq native-comp-async-report-warnings-errors nil)

  ;; Make native compilation happens asynchronously
  (setq native-comp-deferred-compilation t)

  ;; Set the right directory to store the native compilation cache
  (setcar native-comp-eln-load-path
          (expand-file-name (convert-standard-filename ".local/temp/cache/eln-cache/")
                            user-emacs-directory)))


;; Remove some unneeded UI elements (the user can turn back on anything they wish)
(setq inhibit-startup-message t)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)
(push '(mouse-color . "white") default-frame-alist)

(provide 'early-init)
;;; early-init.el ends here
