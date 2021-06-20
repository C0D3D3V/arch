# Geheimnisse

## Passwortmanager

Es gibt verschiedenste [Passwortmanager](https://wiki.archlinux.org/index.php/List_of_applications/Security#Password_managers). Da Passwörter sicher sein sollten und man dieser keinen dritten Person anvertrauen möchte muss man bei der Wahl des Passwort-Managers sehr bedacht agieren. Ich habe mich für den Passwortmanager [keepassxc](https://wiki.archlinux.org/index.php/KeePass) entschieden.


    + keepassxc

**KeepassXC automatisch öffnen**

Als erstes muss eine Passwort-Datenbank erstellt werden welche sich mit em selben Passwort öffnen lässt das als Login-Passwort verwendet wird.

Dann muss KeepassXC automatisch gestartet werden, bei KDE geht das indem es in den Systemeinstellungen zum Autostart hinzugefügt wird. 

Anschließend muss im Homeverzeichnis unter `.config/keepassxc/w8unlock` die [diese Dateien angelegt werden](https://github.com/marzzzello/dotfiles/tree/master/.config/keepassxc/w8unlock). 

Entsprechend der Kommentare in den Dateien muss ein Eintrag in `/etc/pam.d/system-login ` hinzugefügt werden:

    auth       optional   pam_exec.so expose_authtok /home/YOUR_USERNAME/.config/keepassxc/w8unlock/pam.zsh

Des weiteren muss in der `w8unlock.zsh` Datei der `KEEPASSXC_USER` zum eingenen Benutzername angepasst werden und der `DB_PATH` Pfad angepasst werden zur zuvor erstellten Datenbank.

**KeepassXC als Secret-Service**

Der Secret-Service speichert unter Linux Geheimnisse sicher ab und lässt Programme nach wunsch darauf zugreifen. 


Zuerst müssen alle anderen Secret services deaktiviert werden:

In `~/.config/kwalletrc` folgendes eintragen:

    [Wallet]
    Enabled=false


Dann muss am besten `gnome-keyring` deinstalliert werden. Alternativ kann folgendes probiert werden, kann sein dass der Keyring jedoch von irgend einem Programm weiterhin gestartet wird.

Alternative: `/etc/xdg/autostart/gnome-keyring-ssh.desktop` nach `~/.config/autostart/` kopieren und folgendes hinzufügen:

    Hidden=true

Falls lightdm verwendet wird sollte auch dort der `gnome-keyring-daemon` aus der Konfiguration entfernt werden. Dazu wird in `/etc/pam.d/lightdm` und `/etc/pam.d/lightdm-autologin` alle Zeilen **entfernet** welche `pam_gnome_keyring.so` enthalten alse:

    -auth       optional    pam_gnome_keyring.so
    -session    optional    pam_gnome_keyring.so auto_start


Damit KeepassXC als Secret-Service verwendet wird muss unter den Einstellungen `Secret-Service-Integration` aktiviert werden.  Anschließend muss bei `Offengelegte Datenbankgruppen` die entsprechende Datenbank mit dem Stift bearbeitet werden.  In diesem Fenster muss unter  `Secret-Service-Integration`  eine Gruppe festgelegt werden, in der allte Passwörter des Secret-Services abgespeichert werden. Anschließend ist alles bereit zur Nutzung. 


