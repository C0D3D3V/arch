# PDF


## PDF-Editor

Um PDFs tatsächlich zu bearbeiten eignet sich `LibreOffice Draw` sehr gut. [Andere Editors](https://wiki.archlinux.org/index.php/PDF,_PS_and_DjVu#Advanced_editors) sind proprietär und umständlich. 

Es gibt jedoch [PDF-Bearbeiter](https://wiki.archlinux.org/index.php/PDF,_PS_and_DjVu#Basic_editors) mit dem PDFs umsortiert, zusammengefügt und ähnliche einfache Änderungen vorgenommen werden können. Am besten eignet sich dafür `pdfarranger`.

    - pdfarranger 


## PDF-Betrachter

Beliebte Programme um PDF-Dateien zu betrachten sind `Okular`, `Atril`, `Evince` und `Xreader`. Ich bevorzugte `Okular` weil man damit auch schön präsentieren kann. `Okular` eignet sich auch gut um Comics oder Markdown-Dateien zu betrachten. Jedoch ist der Druck-Dialog sher schlecht, deshalb empfehle ich jetzt `evince`.

    + atril

Damit die Druckvorschau funktioniert muss in `~/.config/gtk-3.0/settings.ini` folgendes hinzugefügt werden:

    gtk-print-preview-command = atril --unlink-tempfile --preview --print-settings %s %f


<!-- 
Optional für okular, falls okular installiert wird:

    - kdegraphics-mobipocket
    - calligra

* `kdegraphics-mobipocket` mobi support
* `calligra` ODT und ODP support, calligra ist eine Alternative für LibreOffice
-->
