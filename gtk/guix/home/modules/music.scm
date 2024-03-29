(define-module (home modules music)
  #:use-module (gnu packages))

(define-public music-packages
    (map specification->package
        (list
        ;; JACK tools
        "jack"
        "jack2"
        "jack-keyboard"
        "carla"
        "qjackctl"

        ;; DAWs
        "ardour"
        "zrythm"

        ;; Guitar
        "guitarix"
        "guitarix-lv2"

        ;; Effects
        "calf"
        "g2reverb"
        "wolf-shaper"
        "dragonfly-reverb"

        ;; Synths
        "helm"
        "amsynth"
        "geonkick"
        "fluidsynth"
        "surge-synth"
        "zynaddsubfx"
        "avldrums-lv2"

        ;; Mixing Tools
        "wolf-spectrum")))
