# Alles rund um den Desktop


<!--
## GNOME - Wurde entfernt, weil ich es nicht geschafft habe dass der Display ordentlich gesperrt wird

Folgende Pakete erachte ich als essentiell um [Gnome](https://wiki.archlinux.de/title/GNOME) zu verwenden.

    - gnome-backgrounds
    - gnome-control-center
    - gnome-menus
    - gnome-shell
    - mutter
    - gnome-tweaks
    - gnome-shell-extensions
    - gdm

* `gnome-backgrounds` liefert verschiedene Hintergründe und Dateien für Gnome. 
* Mit `gnome-control-center` lassen sich grundlegende Einstellungen an Gnome vornehmen. 
* `gnome-menus` liefert verschiedene Menüeinträge für die installierten Programme. 
* `gnome-shell` ist der als grafische Shell bezeichnete Desktop.
* `mutter` ist der Window-Manager von Gnome.
* `gnome-tweaks` bietet [weitere Gnome Einstellungen](https://wiki.archlinux.de/title/GNOME#Tipps_und_Tricks)
* `gnome-shell-extensions` erlaubt das ändern des Themes der Gnome-Shell und fügt paar einfache Erweiterungen hinzu.
* `gdm` ermöglicht das sperren des Displays



Sinnvolle Erweiterungen:

    - gnome-shell-extension-dash-to-panel

* `dash-to-panel` fügt eine nette Taskleiste hinzu

Des Weiteren können folgende Erweiterungen aktiviert werden:

* `Applications Menu` fügt ein einfach zu bedienendes Anwendungsmenü hinzu
* `Horizontal workspaces` ändert das Workspace-Layout auf horizontal
* `User Themes` damit das Theme geändert werden kann.
* `widowNavigator` fügt Shortcuts für die Fenster und Wokspaces im **Overlay-Modus** hinzu
* `Workspace Indicator` zeigt an in welchem Workspace man sich befindet.


GOME legt zwei Sessions für Xorg an eine davon kann entfernt werden:

    sudo rm /usr/share/xsessions/gnome.desktop

-->


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

* `kde-gtk-config` um das Aussehen von GTK Anwendungen einzustellen
+ `xsettingsd` um Anpassungen am Aussehen von GTK-Anwendungen direkt durchzuführen
* `breeze-gtk` Breeze Theme für GTK-Anwendungen

Erweiterungen die hilfreich sind:

    + plasma-nm
    + plasma-pa

* `plasma-nm` Netzwerkmanager Applet für KDE
* `plasma-pa` Audiomanager Applet für KDE


## I3 

Hier dreht sich alles um die Installation von `i3`