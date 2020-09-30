# Alles rund um den Desktop




## KDE

Als weit verbreitete Alternative zu Gnome bietet sich auch KDE an, ist zwar nicht so leichtgewichtig. Dafür bietet es ein ganz anderes look and feel.

    + plasma-wayland-session
    + plasma-desktop
    + plasma-workspace-wallpapers
    + kscreen
    + powerdevil
    + bluedevil
    + user-manager

* `plasma-wayland-session` um KDE von lightdm zu starten
* `plasma-desktop` der Desktop von KDE
* `plasma-workspace-wallpapers` extra Hintergründe
* `kscreen` um die Bildschirmeinstellungen anzupassen.
* `powerdevil` für die Energieeinstellungen
* `bluedevil` für Bluetooth-Einstellungen
* `user-manager` um Benutzer zu verwalten

Um das Aussehen weiter zu optimieren:

    + kde-gtk-config
    + xsettingsd
    + breeze-gtk
    + papirus-icon-theme

* `kde-gtk-config` um das Aussehen von GTK Anwendungen einzustellen
* `xsettingsd` um Anpassungen am Aussehen von GTK-Anwendungen direkt durchzuführen
* `breeze-gtk` Breeze Theme für GTK-Anwendungen
* `papirus-icon-theme` für schönere Icons

Erweiterungen die hilfreich sind:

    + plasma-pa

* `plasma-pa` Audiomanager Applet für KDE

<!--
    plasma-nm ist nervig, der ist nicht kompatibel mit keepassxc, stattdessen einfach nm-applet zum Autostart hinzufügen
    
-->

KDEWallet ist nervig! Stattdessen keepassxc verwenden und in `~/.config/kwalletrc` folgendes eintragen:

    [Wallet]
    Enabled=false



## I3 

Hier dreht sich alles um die Installation von `i3`