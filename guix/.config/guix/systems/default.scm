;; This is an operating system configuration generated
;; by the graphical installer.

(use-modules (gnu))
(use-service-modules
  cups
  desktop
  networking
  ssh
  xorg)

(operating-system
 (locale "en_US.utf8")
 (timezone "America/Chicago")
 (keyboard-layout (keyboard-layout "us"))
 (host-name "atlas")
 (users (cons* (user-account
                (name "bryan")
                (comment "Bryan")
                (group "users")
                (home-directory "/home/bryan")
                (supplementary-groups
                 '("wheel" "netdev" "audio" "video")))
               %base-user-accounts))
 (packages
  (append
   (list (specification->package "nss-certs"))
   %base-packages))
 (services
  (append
   (list (service mate-desktop-service-type)
         (service openssh-service-type)
         (set-xorg-configuration
          (xorg-configuration
           (keyboard-layout keyboard-layout))))
   %desktop-services))
 (bootloader
  (bootloader-configuration
   (bootloader grub-efi-bootloader)
   (targets (list "/boot/efi"))
   (keyboard-layout keyboard-layout)))
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
         %base-file-systems))
 )
