# Drucker und Scanner

## Cups

[CUPS](https://wiki.archlinux.org/index.php/CUPS) ist das Standard-Drucksystem entwickelt von Apple Inc. Mit CUPS kann sowohl über [AirPrint](https://de.wikipedia.org/wiki/AirPrint) als auch mit [IPP](https://de.wikipedia.org/wiki/Internet_Printing_Protocol) gedruckt werden

    + cups
    + ghostscript

* `ghostscript` wandelt PostScript in Rasterbilder um für Drucker die PostScript nicht beherrschen.


Nach der Installation muss der Dienst gestartet werden:

    systemctl enable --now org.cups.cupsd.service


## Drucker Treiber

Um möglichst vieler Drucker abzudecken an denen man spontan drucken möchte gibt es abgesehen von den Treibern welche man im [AUR](https://aur.archlinux.org/packages/?O=0&SeB=nd&K=canon&outdated=&SB=n&SO=a&PP=50&do_Search=Go) finden kann [Treiberdsammlungen](https://wiki.archlinux.org/index.php/CUPS#OpenPrinting_CUPS_filters) welche nützlich sein können:

    + gsfonts


* `gsfonts` ist bei manchen PostScript Druckern nötig


[foomatic](https://wiki.linuxfoundation.org/openprinting/database/foomatic) ist eine Datenbank mit allen frei verfügbaren Druckertreiber die auch wirklich funktionieren :D 

    + foomatic-db-engine
    + foomatic-db
    + foomatic-db-ppds 
    + foomatic-db-nonfree
    + foomatic-db-nonfree-ppds

* `foomatic-db-engine` ist das Herzstück von `foomatic`
* `foomatic-db` eine Sammlung von XML-Dateien um PPD-Dateien zu erzeugen
* `foomatic-db-ppds` vorgebaute PPD-Dateien
* `foomatic-db-nonfree` eine Sammlung von XML Dateien die verwendet werden zum bauen von nicht freien PPD-Dateien
* `foomatic-db-nonfree-ppds` vorgebaute PPD-Dateien welche nicht unter freier Liezens stehen 


Das [Gutenprint Projekt](http://gimp-print.sourceforge.net/) bietet Treiber für Canon, Epson, Lexmark, Sony, Olympus, und PCL Drucker.

    + gutenprint
    + foomatic-db-gutenprint-ppds

Um in PDF-Dateien drucken zu können lohnt sich `cups-pdf`.

    + cups-pdf


Um mit [Canon MX Druckern](https://wiki.archlinux.de/title/Drucken_mit_Canon_MX_(PIXMA,_850,_etc.)) drucken zu können, wird das proprietäre USB über IP Protokoll gebraucht.

    +  cups-bjnp

Alternative Druckertreiber gibt es auch auf [openprinting.org](http://www.openprinting.org/printers) welche heruntergeladen werden können unter `/usr/share/cups/model/` platziert werden.




## Drucker verwalten

Es gibt verschiedene [Druckerverwaltungsprogramme](https://wiki.archlinux.org/index.php/CUPS#GUI_applications), dazu zählt auch das mit `cups` mitgelieferte [Web-Interface](https://wiki.archlinux.org/index.php/CUPS#Web_interface), welches sich unter [http://localhost:631/](http://localhost:631/) findet. Eine gute GUI ist von Gnome:

    + system-config-printer
    + python-pysmbc

* `python-pysmbc` damit Drucker auch über SMB gefunden werden können.

KDE hat ein extra Modul für die Systemeinstellungen für Drucker. Wirklich sehr schön, nur schade, dass es um kde gebaut wurde:

    + print-manager


## Scannen

Scannen ist unter Linux super einfach mit [SANE](https://wiki.archlinux.org/index.php/SANE).

    + sane

Alle verfügbaren Scanner können mit `scanimage -L` aufgelistet werden.

Wenn der Scanner nicht gefunden wird kann [im Wiki](https://wiki.archlinux.org/index.php/SANE/Scanner-specific_problems) nach einer Lösung gesucht werden.

## Scan-GUI

Es gibt verschiedene [GUIs](https://wiki.archlinux.org/index.php/SANE#Install_a_frontend) für SANE. Welche davon am besten funktioniert hängt vom Anwendungsfall ab. Xsane ist zwar voll mit Funktionen aber so gut wie unbrauchbar, wegen der schlechten Benutzerfreundlichkeit. `simple-scan` ist hingegen viel einfacher zu verwenden.

    + simple-scan

Um Dokumente mit [OCR](https://wiki.archlinux.org/index.php/list_of_applications#OCR_software) zu versehen eignet sich `OCRFeeder` gut auch wenn es nicht immer ganz einfach zu bedienen ist. Zusammen mit `tesseract` erzielt man recht gute Ergebnisse.

    + ocrfeeder
    + tesseract
    + tesseract-data-deu
    + tesseract-data-eng

* `tesseract-data-deu` und `tesseract-data-eng` sind die entsprechenden Wörterbücher für `tesseract`.