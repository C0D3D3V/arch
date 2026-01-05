# Virtualisierung

Virtualisierung mit [Virtualbox](https://wiki.archlinux.org/index.php/VirtualBox) ist einfach.

    + virtualbox
    + virtualbox-host-dkms
    + virtualbox-guest-iso
    + virtualbox-ext-vnc 

* `virtualbox-ext-vnc` für [Erweiterungen](https://wiki.archlinux.org/index.php/VirtualBox#Extension_pack)

Der Benutzer muss in der Gruppe `vboxusers` sein.

    gpasswd -a USERNAME vboxusers