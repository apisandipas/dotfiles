(define-module (atlas)
  #:use-module (base-system)
  #:use-module (gnu))

(operating-system
 (inherit base-operating-system)
 (host-name "atlas")

 (swap-devices
  (list (swap-space
         (target
          (uuid "ea40b994-e20f-421c-be3b-c34053a32fb1")))))
 (file-systems
  (cons* (file-system
          (mount-point "/boot/efi")
          (device (uuid "9DEA-F42D" 'fat32))
          (type "vfat"))
         (file-system
          (mount-point "/")
          (device
           (uuid "8833dc17-20b4-4c2c-a5af-ad5747b0fab1"
                 'ext4))
          (type "ext4"))
         %base-file-systems)))
