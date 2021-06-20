# Alles rund um den Desktop


## I3 

Hier dreht sich alles um die Installation von `i3`

    + i3-gaps
    + xautolock
    + betterlockscreen
    + feh
    + xsettingsd
    + gtk-engine-murrine
    + qt5-styleplugins
    + dunst
    + lxpolkit
    + autorandr
    + arandr

* `i3-gaps` I3 aber mit Abständen zwischen den Fenstern
* `feh` um ein Hintergrund zu setzen
* `xsettingsd` um Anpassungen am Aussehen von GTK-Anwendungen direkt durchzuführen
* `xautolock` und `betterlockscreen` automatisches sperren des Bildschirms
* `gtk-engine-murrine` schönere GTK Themes
* `qt5-styleplugins` um GTK2 Themes als QT Theme verrwenden zu können
* `dunst` als Benachrichtigungssystem
* `lxpolkit` Berechtigungsmanagment für Apps
* `autorandr` automatische Bildschirmeinstellungen
* `arandr` manuelle Bildschirmeinstellungen


Extras:

    + rofi
    + rofimoji
    + rofi-surfraw-git
    + networkmanager-dmenu-git
    + flameshot
    + xclip
    + copyq

* `rofi` ersatz für dmenu, um Anwendungen zu starten [Mod+d]
* `rofimoji` ein Tool um Emojies auszuwählen [Mod+p]
* `rofi-surfraw-git` um schnell im Web zu suchen [Mod+q]
* `networkmanager-dmenu-git` um schnell Netzwerkeinstellungen zu ändern [Mod+n]
* `flameshot` um schnell screenshots zu machen [Print]
* `xclip` um Terminalausgaben in den Zwischenspeicher zu kopieren
* `copyq` Zwischenspeicher-Manager, damit der Zwischenspeicher nicht verloren geht, wenn eine App geschlossen wird


Themes:

    + breeze-gtk
    + papirus-icon-theme

* `breeze-gtk` Breeze Theme für GTK-Anwendungen
* `papirus-icon-theme` für schönere Icons


Notwendige Python Pakete:

    pip install -U i3ipc i3-workspace-names-daemon


Um automatisch auch bei Suspend und Hibernate den Bildschirm schnell zu sperren, sollte folgender Service aktiviert werden:

    #systemctl enable betterlockscreen@USER


Infos:

- [Mod+Shift+X] sperrt den Bildschirm
- [Mod+Z] aktiviert die Titelleiste eines Fensters
- [Calculator] Öffnet den Taschenrechner





<!-- 
Der Benachrichtigungsdienst Dunst kann alternativ als Service gestartet werden 
systemctl --user enable --now dunst.service
-->
