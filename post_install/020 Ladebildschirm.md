# Splash-Screen und Displaymanager


## Boot Splash-Screen

Linux hat ohne [plymouth](https://wiki.archlinux.org/index.php/plymouth) keinen Splash-Screen während dem Bootvorgang, stattdessen wird beim Booten die Terminaltausgabe präsentiert. Damit ein schöner Ladebildschirm dargestellt wird, muss zunächst `plymouth` installiert werden.

    + plymouth
    + ttf-dejavu

Die Font `ttf-dejavu` wird zum korrekten darstellen gebraucht.

Es gibt eine riesige [Auswahl an Ladebildschirmen](https://github.com/adi1090x/plymouth-themes) eines dieser Themes kann aus dem [AUR](https://aur.archlinux.org/packages/?O=0&SeB=nd&K=plymouth-theme-&outdated=&SB=n&SO=a&PP=50&do_Search=Go) heruntergeladen werden. `plymouth-theme-abstract-ring-git` ist ganz ansprechend, `plymouth-theme-angular-git` auch.

    + plymouth-theme-abstract-ring-git
    + plymouth-theme-angular-git

Anschließend muss die `/etc/mkinitcpio.conf` Datei angepasst werden.

* Nach `base udev` muss `plymouth` hinzugefügt werden.
* `encrypt`muss mit `plymouth-encrypt` ersetzt werden.

Dies könnte wie folgt aussehen:

    HOOKS=(base udev plymouth keyboard keymap autodetect consolefont modconf block plymouth-encrypt filesystems resume fsck)


Dann müssen die Kernel-Parameter angepasst werden. Dazu werden in `/boot/loader/entries/arch.conf` folgende Optionen hinzugefügt: 

    quiet splash loglevel=3 rd.udev.log_priority=3

<!--
Um das Arch-Logo beim Boot darzustellen muss dieses entsprechend platziert werden:

    cp /usr/share/plymouth/arch-logo.png /usr/share/plymouth/themes/spinner/watermark.png
 -->
 
Abschließend muss `plymouth` konfiguriert werden, dazu wird `/etc/plymouth/plymouthd.conf` bearbeitet:

    [Daemon]
    Theme=abstract-ring
    ShowDelay=0
    DeviceTimeout=8

Alternativ kann `angular` statt `abstract-ring` verwendet werden.

Anschließend muss das Initrmfs Abbild neu gebaut werden:

    sudo mkinitcpio -P

## Display-Manager

Ein guter [Displaymanger](https://wiki.archlinux.org/index.php/Display_manager) ist [lightdm](https://wiki.archlinux.org/index.php/LightDM#Changing_background_images/colors):

    + xorg
    + lightdm
    + lightdm-webkit2-greeter
    + lightdm-webkit-theme-litarvan

Alternativ zum `litarvan` Theme kann auch eins der [vielen anderen genutzt werden](https://aur.archlinux.org/packages/?O=0&SeB=nd&K=lightdm-webkit&outdated=&SB=n&SO=a&PP=50&do_Search=Go), beispielsweise ist `aether` auch schön anzusehen.

Anschließend muss die Konfiguration von `lightdm` in `/etc/lightdm/lightdm.conf` wie folgt angepasst werden:

    # Im Abschnitt [Seat:*]
    greeter-session=lightdm-webkit2-greeter

Und in `/etc/lightdm/lightdm-webkit2-greeter.conf` muss die Konfiguration vom webkit2-Greeter angepasst werden:

    webkit_theme = litarvan



Weil `plymouth` bereits installiert ist, genügt es den entsprechenden Dienst zu aktivieren:

    systemctl enable lightdm-plymouth

