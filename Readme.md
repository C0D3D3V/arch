# Arch-Linux


Hier findest du eine [Anleitung um ein Basissystem mit Arch-Linux zu installieren](install_arch.md).

Nach der Installation ist vor der Installation. Bevor weitere Pakete installiert werden sollten die [Post-Installationsschritte](post_install) durchgeführt werden.

Hier findest du [Beschreibungen zu ausgewählten Paketen](packages). Diese Pakete bilden zusammen ein vollwertiges Desktopsystem, welches für die meisten geeignet ist.

Des weiteren finden sich hier auch [Beschreibungen zu extra Paketen](extra_packages). Diese Pakete sollen das System ergänzen für Power-User wie Entwickler, Designer usw.


## Installation von Paketen

    comm -13 <(pacman -Qq | sort) <(awk 1 packages/* | sed -n -e "s/^[ \t]*+[ \t]*\([^ \t]*\)[ \t]*$/\1/gp" | sort) | yay -Sy --needed --noconfirm -
    sudo systemctl daemon-reload

Und anschließend alle Services aktivieren:

    awk 1 packages/* | sed -n -e "s/^[ \t]*systemctl enable --now[ \t]*\([^ \t]*\)[ \t]*$/\1/gp" | xargs sudo systemctl enable


## Extras

Um zu erfahren welche Pakete auf dem System ausdrücklich zusätzlich, zu den Paketen aus der Dokumentation, installiert sind:

    comm -23 <(pacman -Qetq | sort) <(awk 1 */*.md | sed -n -e "s/^[ \t]*+[ \t]*\([^ \t]*\)[ \t]*$/\1/gp" | sort)

 
