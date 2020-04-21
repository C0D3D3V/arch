# Virtualisierung

Virtualisierung mit [Virtualbox](https://wiki.archlinux.org/index.php/VirtualBox) ist einfach.

    + virtualbox-host-modules-arch
    + virtualbox
    + virtualbox-guest-iso
    + virtualbox-ext-oracle

* `virtualbox-ext-oracle` für [Erweiterungen](https://wiki.archlinux.org/index.php/VirtualBox#Extension_pack)

Der Benutzer muss in der Gruppe `vboxusers` sein.

    gpasswd -a USERNAME vboxusers