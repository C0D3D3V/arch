# Virtualisierung

Virtualisierung mit [Virtualbox](https://wiki.archlinux.org/index.php/VirtualBox) ist einfach.

    + virtualbox
    + virtualbox-host-dkms
    + virtualbox-guest-iso
    + virtualbox-ext-vnc 
    + linux-headers

* `virtualbox-ext-vnc` für [Erweiterungen](https://wiki.archlinux.org/index.php/VirtualBox#Extension_pack)
* `linux-headers` damit das DKMS Modul kompiliert werden kann

Der Benutzer muss in der Gruppe `vboxusers` sein.

    gpasswd -a USERNAME vboxusers