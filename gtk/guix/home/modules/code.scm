(define-module (home modules code)
  #:use-module (gnu packages))

(define-public code-packages
    (map specification->package
        (list
            "docker-cli"
            "node"
            "gcc-toolchain"
            "make"
            "pkg-config"
            "texinfo"
            "sbcl"
            "curl"
            "clojure"
            "clojure-tools"
            "virt-manager")))
