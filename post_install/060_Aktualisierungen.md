# Aktualisierungen

Um regelmäßig zu prüfen ob Aktualisierungen vorhanden sind kann beispielsweise ein Skript erstellt werden, welches den Benutzer nach dem Anmelden über die verfügbaren Aktualisierungen informiert. Dazu wird die Datei `~/.config/check_updates.sh` angelegt.

    #!/bin/bash
    export DISPLAY=":0.0"

    PMUPDATES="$(checkupdates | wc -l)"
    AURUPDATES="$(yay -Pn)"
    notify-send  -h string:bgcolor:#000000 -h string:fgcolor:#d8ff44 "Verfügbare Aktualisierungen:"  "Pacman: $PMUPDATES  AUR: $AURUPDATES" 

    exit

Anschließend kann `~/.config/check_updates.sh` zu dem Autostart hinzugefügt werden.
