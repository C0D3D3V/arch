# Kern-Werkzeuge

Unter [Kern-Werkzeuge](https://wiki.archlinux.org/index.php/Core_utilities) verstehen sich die Werkzeuge die man zum schnellen Arbeiten im Terminal benötigt.

## Bedienungsanleitungen

    + man-db

## Kopieren

Als Alternative zu `cp` eignet sich `rsync`:

    + rsync

[Alias](https://wiki.archlinux.org/index.php/Rsync#As_cp/mv_alternative):
    
    alias cp="rsync -P"

## Verzeichnis auflisten

Als Alternative zu `ls` eignet sich `lsd`:

    + lsd

Alias:

    alias ls="lsd"
    alias l="lsd -la"

## Dateien lesen / blättern

    + less

## Dateien finden

Als Alternative zu `find` eignet sich `fd`:

    + fd

## Interaktiver Filter

    + fzf

## Code Searcher

Du wirst `ag` [lieben](https://github.com/ggreer/the_silver_searcher), damit durchsuchst du dein Source-Code extrem schnell.

    + the_silver_searcher

## Ausgabe von Dateien

Als Alternative zu `cat` eignet sich `bat`: 

    + bat

Alias:
    
    alias cat="bat"

## Verbessern von falsch eingegebenen Befehlen

    + thefuck

## Terminal Taskmanager

 Als alternative zu `top` eignet sich `htop`

    + htop
  
Alias:

    alias top="htop"

## Terminal Multiplexer

[Screen](https://wiki.archlinux.org/title/GNU_Screen) ist alt aber gut

    + screen


## Zwischenablage

Terminalausgaben in den Zwischenspeicher zu kopieren:

    + xclip
