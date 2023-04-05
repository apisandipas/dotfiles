(define-module (systems atlas)
  #:use-module (systems base-system)
  #:use-module (gnu))


(operating-system
 (inherit base-operating-system)
 (host-name "atlas")

 (swap-devices
  (list (swap-space
         (target
          (file-system-label "swap-partition")))))
 (file-systems
  (cons* (file-system
          (mount-point "/boot/efi")
          (device (file-system-label "EFI_PART"))
          (type "vfat"))
         (file-system
          (mount-point "/")
          (device
           (file-system-label "system-root"))
          (type "ext4"))
         (file-system
          (mount-point "/home")
          (device
           (file-system-label "system-home"))
          (type "ext4"))
         %base-file-systems)))
