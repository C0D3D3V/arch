# Kern-Werkzeuge

Unter [Kern-Werkzeuge](https://wiki.archlinux.org/index.php/Core_utilities) verstehen sich die Werkzeuge die man zum schnellen Arbeiten im Terminal benötigt.

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

## Dateien finden

Als Alternative zu `find` eignet sich `fd`:

    + fd

## Interaktiver Filter

    + fzf

## Ausgabe von Dateien

Als Alternative zu `cat` eignet sich `bat`: 

    + bat

Alias:
    
    alias cat="bat"

## Verbessern von falsch eingegebenen Befehlen

    + thefuck