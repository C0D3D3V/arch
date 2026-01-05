# Dateimanager

## Mit GUI

Der Standard-Dateimanager unter Gnome ist `nautilus` jedoch ist der Dateimanager von KDE meiner Ansicht nach besser. [Dolphin](https://wiki.archlinux.org/index.php/Dolphin) ist extrem funktionsreich und dennoch schnell.

    + dolphin
    + kde-cli-tools
    + kdegraphics-thumbnailers: PDF and PS thumbnails
    + kdenetwork-filesharing
    + ffmpegthumbs

* `kde-cli-tools` wird gebraucht um die Dateitypen anzupassen.
* `kdegraphics-thumbnailers` wird verwendet  PDF and PS Thumbnails zu erstellen
* `kdenetwork-filesharing` samba usershare properties menu
* `ffmpegthumbs` wird verwendet um Thumbnails von Videos zu erstellen.



Alternativ Thunar:

    - thunar
    - catfish
    - gvfs
    - tumbler
    - thunar-volman
    - thunar-archive-plugin
    - thunar-media-tags-plugin

* `catfish`: file searching
* `gvfs`: trash support, mounting with udisk and remote filesystems 
* `tumbler`: thumbnail previews
* `thunar-volman`: removable device management
* `thunar-archive-plugin`: archive creation and extraction
* `thunar-media-tags-plugin`: view/edit ID3/OGG tags