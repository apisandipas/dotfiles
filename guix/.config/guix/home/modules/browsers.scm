(define-module (home modules browsers)
  #:use-module (gnu home)
  #:use-module (gnu packages))

(define-public browsers-packages
  (map specifications->manifest
    (list
    ;; TODO: Add qutebrowser config
    "qutebrowser"
    ;; TODO: add Nyxt config
    "nyxt"
    "firefox"
    "ungoogled-chromium"
    )))
