# Boot Splash-Screen

Linux hat ohne [plymouth](https://wiki.archlinux.org/index.php/plymouth) keinen Splash-Screen während dem Bootvorgang. Damit dieser aktiviert wir muss zunächst `plymouth-git` installiert werden.

    + plymouth-git
    + ttf-dejavu

Die Font `ttf-dejavu` wird zum korrekten darstellen gebraucht.

Anschließend muss die `/etc/mkinitcpio.conf` Datei angepasst werden.

* Nach `base udev` muss `plymouth` hinzugefügt werden.
* `encrypt`muss mit `plymouth-encrypt` ersetzt werden.
* Zu den `MODULES` muss der Kernel-Grafiktreiber hinzugefügt werden, für Intel ist das `i915`

Nun kann die Initial Ram Disk neu gebaut werden:
    
    sudo mkinitcpio -P


Dann müssen die Kernel-Parameter angepasst werden. Dazu werden in `/voot/loaer/entries/arch.conf` folgende Optionen hinzugefügt: 

    quiet splash loglevel=3 rd.udev.log_priority=3 vt.global_cursor_default=0

Um das Arch-Logo beim Boot darzustellen muss dieses entsprechend platziert werden:

    cp /usr/share/plymouth/arch-logo.png /usr/share/plymouth/themes/spinner/watermark.png

Abschließend muss `plymouth` konfiguriert werden, dazu wird `/etc/plymouth/plymouthd.conf` bearbeitet:

    [Daemon]
    Theme=spinner
    ShowDelay=0
    DeviceTimeout=8