# Entwicklungs-Werkzeuge


## Datei-Vergleichswerkzeuge

### Im Terminal

    + colordiff

Mit `colordiff` ist es im Terminal möglich zwei  Dateien zu vergleichen. Dabei werden Unterschiede farblich dargestellt. Änderungen anzuwenden ist nicht möglich, es sind nur verschiedene Ausgaben möglich.

<!--
Alternativen: 

    - ydiff
-->

Natürlich kann auch `vim` oder `emacs` als diff-Werkzeug verwendet werden.

### Desktop-GUI

    + meld

`meld` ist eine gute schnelle und sichere Anwendung um [Dateien zu vergleichen](https://wiki.archlinux.org/index.php/List_of_applications#Comparison,_diff,_merge) und zusammenzuführen. 

<!--
`meld` wurde mit folgenden Alternativen verglichen: 

    - diffuse
    - kdiff3
    - kompare
    - xxdiff
-->

Standardmäßig wird das Programm `$DIFFPROG` zum Vergleichen von Dateien verwendet, dies kann wie folgt festgelegt werden:
`export DIFFPROG=meld`


# Datenbanken

Zum entwerfen von Datenbanken eignet sich `DBeaver`gut. DBeaver kann mit verschiedenen Datenbanken umgehen, darunter MySQL, Oracle, PostgreSQL, ODBS, JDBC, SQLite

    + dbeaver
  
# Nützliche Werkzeuge

    + shellcheck

* `shellcheck` um Skripte zu prüfen


