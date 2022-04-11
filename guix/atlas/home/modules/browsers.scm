(define-module (atlas home modules browsers)
  #:use-module (gnu home)
  #:use-module (gnu packages))

(define-public browser-packages
  (map specification->package
    (list
    ;; TODO: Add qutebrowser config
    "qutebrowser"
    ;; TODO: add Nyxt config
    "nyxt"
    "firefox"
    "ungoogled-chromium"
    )))
