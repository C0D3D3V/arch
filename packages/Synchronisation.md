# Synchronisation


## Dateien P2P austauschen

Um Dateien auszutauschen gibt es [viele Wege](https://wiki.archlinux.org/index.php/list_of_applications#File_synchronization). [Syncthing](https://wiki.archlinux.org/index.php/Syncthing) ist einer.

    + syncthing-gtk

Um `syncthing` als Service laufen zu lassen muss folgender Dienst angeschalten werden:  `syncthing@myusername.service`


Um ein Handy komplett zu synchronisieren eignet sich folgender Filter:

    Android/**
    DCIM/.thumbnails/**
    **thumbnails/**
    **.part
    **.*.swp
    **nosync**
    **/tmp/**
    **/temp/**
    msgstore-????-??-??.*
    Download/Yalp/*
    TWRP/BACKUPS/**
    Aurora/**