# Arch-Linux


Hier findest du eine [Anleitung um ein Basissystem mit Arch-Linux zu installieren](install_arch.md).


Hier findest du [Beschreibungen zu ausgewählten Paketen](packages). Diese Pakete bilden zusammen ein vollwertiges Desktopsystem.


## Installation von Paketen

`cat packages/* | grep "^[ \t]*+" | sed "s/^[ \t]*+[ \t]*//g" | yay -S --needed -`

