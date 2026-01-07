# Alles rund um den Desktop


## I3 

Hier dreht sich alles um die Installation von `i3`

    + i3-wm
    + picom
    + i3status-rust-git
    + wpgtk
    + feh
    + lxsession
    + xsettingsd
    + xautolock
    + betterlockscreen
    + dunst
    + autorandr
    + arandr
    + xorg-xbacklight

* `i3-wm` i3 - Desktop
* `picom` Compositor für X11
* `i3status-rust-git` als Status Bar
* `wpgtk` Theme manager
* `feh` um ein Hintergrund zu setzen
* `lxsession` X11 Session manager / Berechtigungsmanagment für Apps
* `xsettingsd` um Anpassungen am Aussehen von GTK-Anwendungen direkt durchzuführen
* `xautolock` und `betterlockscreen` automatisches sperren des Bildschirms
* `dunst` als Benachrichtigungssystem ([Mod+Minus] entfernt eine Benachrichtigung, [Mod+Punkt] holt sie wieder her)
* `autorandr` automatische Bildschirmeinstellungen
* `arandr` manuelle Bildschirmeinstellungen
* `xorg-xbacklight` Bildschirmhellichkeit anpassen


Verwende ich nicht mehr:

    - gtk-engine-murrine
    - qt5-styleplugins

* `gtk-engine-murrine` schönere GTK Themes
* `qt5-styleplugins` um GTK2 Themes als QT Theme verrwenden zu können


Extras:

    + rofi
    + splatmoji-git
    + networkmanager-dmenu-git
    + pamixer
    + playerctl
    + normcap

* `rofi` Ersatz für dmenu, um Anwendungen zu starten (+ verschiedene Menüs siehe unten) [Mod+d]
* `splatmoji` ein Tool um Emojies auszuwählen [Mod+p]
* `networkmanager-dmenu-git` um schnell Netzwerkeinstellungen zu ändern [Mod+n]
* `pamixer` um Lautstärke per Terminal und Hotkeys anzupassen 
* `playerctl` um Player per Terminal und Hotkeys zu bedienen
* `normcap` um Screenshots in Text umzuwandeln [Mod+Shift+b] für Deutsch [Mod+Shift+h] für Englisch

Rofi Menüs:

* Zwischen Fenstern wechseln [Alt+Tab]
* Menüübersicht [Mod+m]
* Theme ändern [Mod+t]
* Herunterfahren Menü [Mod+Shift+e]

Veraltet:
    - rofimoji
    - rofi-surfraw-git

* `rofimoji` ein Tool um Emojies auszuwählen [Mod+p]
* `rofi-surfraw-git` um schnell im Web zu suchen [Mod+q]

Optional:

    - copyq

* `copyq` Zwischenspeicher-Manager, damit der Zwischenspeicher nicht verloren geht, wenn eine App geschlossen wird

Themes:

    + breeze-gtk
    + papirus-icon-theme

* `breeze-gtk` Breeze Theme für GTK-Anwendungen
* `papirus-icon-theme` für schönere Icons


Notwendige Python Pakete für die i3 Skripte:

    + python-i3ipc
    + python-notify2
    + python-dbus
    + python-gobject
    + python-pillow
    + python-mss
    + python-psutil
    + python-playsound
    + python-pywal

* `python-i3ipc` um mit i3 zu kommunizieren
* `python-notify2` um Benachrichtigungen zu senden
* `python-dbus` und `python-gobject` um mit dem dbus zu kommunizieren
* `python-pillow` um Bilder (Screenshots zu bearbeiten)
* `python-mss` um Screenshots zu erstellen
* `python-psutil` um Prozesse zu überwachen
* `python-playsound` um Sounds abzuspielen
* `python-pywal` um Color Schemas zu erzeugen





Infos:

- [Mod+Shift+X] sperrt den Bildschirm
- [Mod+Z] aktiviert die Titelleiste eines Fensters
- [Calculator] Öffnet den Taschenrechner



