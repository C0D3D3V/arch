# Alles rund um den Desktop


## I3 

Hier dreht sich alles um die Installation von `i3`

    + i3-wm
    + picom
    + i3status-rust-git
    + wpgtk
    + lxappearance
    + qt5ct
    + qt6ct
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
* `lxappearance` um das GTK-Theme anzupassen
* `qt5ct` um das QT5-Theme anzupassen
* `qt6ct` um das QT6-Theme anzupassen
* `feh` um ein Hintergrund zu setzen
* `lxsession` X11 Session manager / Berechtigungsmanagment für Apps
* `xsettingsd` um Anpassungen am Aussehen von GTK-Anwendungen direkt durchzuführen
* `xautolock` und `betterlockscreen` automatisches sperren des Bildschirms
* `dunst` als Benachrichtigungssystem ([Mod+Minus] entfernt eine Benachrichtigung, [Mod+Punkt] holt sie wieder her)
* `autorandr` automatische Bildschirmeinstellungen
* `arandr` manuelle Bildschirmeinstellungen
* `xorg-xbacklight` Bildschirmhellichkeit anpassen


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

Optional:

    - copyq

* `copyq` Zwischenspeicher-Manager, damit der Zwischenspeicher nicht verloren geht, wenn eine App geschlossen wird

Themes:

    + arc-gtk-theme
    + kvantum
    + kvantum-qt5
    + papirus-icon-theme

* `arc-gtk-theme`Theme für GTK-Anwendungen
* `kvantum`Theme für QT-Anwendungen
* `kvantum-qt5`Theme für QT5-Anwendungen
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



