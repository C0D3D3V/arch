# Dateimanager

## Mit GUI

Der Standard-Dateimanager unter Gnome ist `nautilus` jedoch ist der Dateimanager von KDE meiner Ansicht nach besser. [Dolphin](https://wiki.archlinux.org/index.php/Dolphin) ist extrem funktionsreich und dennoch schnell.

    + dolphin
    + kde-cli-tools
    + kio-fuse
    + ffmpegthumbs

* `kde-cli-tools` wird gebraucht um die Dateitypen anzupassen.
* `kio-fuse` um fuse Systeme einzubinden
* `ffmpegthumbs` wird verwendet um Thumbnails von Videos zu erstellen.

Damit Dolphin in KDE die bessere Fortschrittsanzeige verwendet, müssen in den Einstellung von KDE unter `Benachrichtigungen` die Haken bei `Fortschritt der Anwendungen` entfernt werden.





