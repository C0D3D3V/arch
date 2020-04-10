# Paketverwaltung der Community-Pakete

Es gibt viele verschiedene [Hilfsprogramme](https://wiki.archlinux.de/title/AUR_Hilfsprogramme) mit denen AUI-Pakete verwaltet werden können. 

[yay](https://github.com/Jguer/yay) ist eines davon. Zur Installation von `yay` muss folgendes gemacht werden:

    pacman -Sy git
    git clone https://aur.archlinux.org/yay.git
    cd yay  
    sudo rm -rf /tmp/makepkg
    makepkg -si
    cd ..
    rm yay -rf

Alle Pakete können ab nun mit `yay -S` installiert werden.