# Arch-Linux


Hier findest du eine [Anleitung um ein Basissystem mit Arch-Linux zu installieren](install_arch.md).

Nach der Installation ist vor der Installation. Bevor weitere Pakete installiert werden sollten die [Post-Installationsschritte](post_install) durchgeführt werden.

Hier findest du [Beschreibungen zu ausgewählten Paketen](packages). Diese Pakete bilden zusammen ein vollwertiges Desktopsystem.


## Installation von Paketen

`cat packages/* | sed -n -e "s/^[ \t]*+[ \t]*//gp" | yay -S --needed -`

Und anschließend alle Services aktivieren:

`cat packages/* | sed -n -e "s/^[ \t]*systemctl enable --now[ \t]*//gp" | xargs systemctl enable`


 
