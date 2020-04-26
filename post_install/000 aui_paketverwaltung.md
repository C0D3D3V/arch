# Paketverwaltung der Community-Pakete

Es gibt viele verschiedene [Hilfsprogramme](https://wiki.archlinux.de/title/AUR_Hilfsprogramme) mit denen AUI-Pakete verwaltet werden können. 

[yay](https://github.com/Jguer/yay) ist eines davon. Zur Installation von `yay` muss folgendes gemacht werden:

    git clone https://aur.archlinux.org/yay.git
    cd yay  
    sudo rm -rf /tmp/makepkg
    makepkg -si
    cd ..
    rm yay -rf

Alle Pakete können ab nun mit `yay -S` installiert werden.

    + yay

# Anschließend können noch einmal die Spiegelserver-Listen aktualisiert werden.

    reflector -c France -c Germany -a 12 --completion-percent 70 -p https --sort rate --verbose --save /etc/pacman.d/mirrorlist
