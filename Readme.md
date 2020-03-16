# Arch-Linux

## Installation von pacman Paketen

`cat pkg_list.md | grep "^[ \t]*+" | sed "s/^[ \t]*+[ \t]*//g" | sudo pacman -S --needed -`

