# Bluetooth

[Bluetooth](https://wiki.archlinux.org/index.php/Bluetooth) funktioniert mit `bluez` erst richtig gut. 

    + bluez
    + bluez-utils
    + pulseaudio-modules-bt

* pulseaudio-modules-bt fügt aptx hinzu


Der `bluetooth` Dienst muss entsprechend gestartet werden.

    systemctl enable --now bluetooth.service


## Bluetooth-Manager

Als Manager eignet sich `blueman` sehr gut.

    + blueman
