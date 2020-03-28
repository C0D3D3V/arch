# Alles rund um den Desktop

## Display-Manager

Ein guter [Displaymanger](https://wiki.archlinux.org/index.php/Display_manager) ist [lightdm](https://wiki.archlinux.org/index.php/LightDM#Changing_background_images/colors):

    + xorg
    + lightdm
    + lightdm-webkit2-greeter
    + lightdm-webkit-theme-litarvan

Anschließend muss die Konfiguration von `lightdm` in `/etc/lightdm/lightdm.conf` wie folgt angepasst werden:

    # Im Abschnitt [Seat:*]
    greeter-session=lightdm-webkit2-greeter

Und in `/etc/lightdm/lightdm-webkit2-greeter.conf` muss die Konfiguration vom webkit2-Greeter angepasst werden:

    webkit_theme = litarvan



Weil `plymouth` bereits installiert ist, genügt es den entsprechenden Dienst zu aktivieren:

    systemctl enable --now lightdm-plymouth




## Gnome 

Hier dreht sich alles um die Installation von `gnome`. Folgende Pakete erachte ich als essentiell um Gnome zu verwenden.

    + gnome-backgrounds
    + gnome-control-center
    + gnome-menus
    + gnome-shell
    + mousetweaks
    + mutter
    + 

* `gnome-backgrounds` liefert verschiedene Hintergründe und Dateien für Gnome. 
* Mit `gnome-control-center` lassen sich grundlegende Einstellungen an Gnome vornehmen. 
* `gnome-menus` liefert verschiedene Menüeinträge für die installierten Programme. 
* `gnome-shell` ist der als grafische Shell bezeichnete Desktop.
* `mousetweaks` um Maus Einstellungen vorzunehmen.
* `mutter` ist der Window-Manager von Gnome.








## I3 

Hier dreht sich alles um die Installation von `i3`