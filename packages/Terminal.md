# Terminal

## Shell

Terminals sind unter Linux wichtiger als in anderen Betriebssystemen weil damit effektiv und schnell gearbeitet werden kann. Damit dies auch wirklich möglich ist muss man sich für die Werkzeuge entscheiden die man als gut erachtet.

    + zsh
    + zsh-completions
    + zsh-autosuggestions
    + antigen-git
    + nerd-fonts-meslo

* `zsh-completions` auto-completions
* `zsh-autosuggestions` fish like completions
* `antigen-git` als plugin manager
* `nerd-fonts-meslo` gute Font für PowerLevel10k

Ein Terminal führt in erster Linie eine [Shell](https://wiki.archlinux.org/index.php/Command-line_shell#firstHeading) aus. [zsh](https://wiki.archlinux.de/title/Zsh) ist eine sehr schnelle und hoch konfigurierbare Shell.


Um die [Shell zu wechseln](https://wiki.archlinux.org/index.php/Command-line_shell#Changing_your_default_shell) kann mit `chsh -l` alle vorhandenen Shells aufgelistet werden und mit `chsh -s full-path-to-shell` die Shell festgelegt werden (diese wird aktiv nach erneutem anmelden).


## Terminal Emulator

Es wurde mit verscheiden [Terminal-Emulatoren](https://wiki.archlinux.org/index.php/list_of_applications#Terminal_emulators) verglichen und das schnellste Terminal aktuell scheint `alacritty` zu sein.

    + alacritty


Weil das Konfigurieren von `alacritty` etwas ungewohnt für manche ist. Empfehle ich auch noch `gnome-terminal` welche sich komplett per GUI konfigurieren lässt (Alternative wäre auch `konsole`).

    + gnome-terminal

<!--
Alternativen: 

    - alacritty
    - konsole
    - kitty
    - qterminal
    - rxvt-unicode
    - deepin-terminal
    - gnome-terminal
    - lxterminal
    - mate-terminal
    - pantheon-terminal
    - sakura
    - terminator
    - termite
    - tilix
    - xfce4-terminal

-->


