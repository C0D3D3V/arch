
# System Anwendungen

## Paketverwaltung `pacman`

`pacman` verwaltet die installierten Anwendungen. Mit Hilfe der Paketverwaltung kann neue Software installiert, deinstalliert und aktualisiert (geupdatet) werden.


### [Mitgelieferte Skripte und Werkzeuge](https://wiki.archlinux.de/title/Pacman#Paccache) für das Pacman-Systeme

    + pacman-contrib  

Pacman speichert seine heruntergeladenen Pakete in `/var/cache/pacman/pkg/` und entfernt die alten oder deinstallierten Versionen nicht automatisch. Dies hat die Vorteile, sodass Downgraden und erneutes Installieren möglich ist ohne ein wiederholtes Herunterladen aus dem Arch-Linux-Archiv oder Repository.

Es ist jedoch notwendig, den Cache in regelmäßigen Abständen bewusst zu bereinigen, um zu verhindern, dass der Ordner unendlich groß wird. 

Das `paccache`-Skript, das im `pacman-contrib`-Paket enthalten ist, löscht standardmäßig alle zwischengespeicherten Versionen von installierten und deinstallierten Paketen, mit Ausnahme der letzten 3. 

 Um nur **eine** frühere Version zu behalten, verwende: 

    paccache -rk1

Um die aktuelle Größe des Paket-Caches zu erhalten, verwende:

    du -sh /var/cache/pacman/pkg 

Durch die Aktivierung des Services `paccache.timer`, werden unbenutzte Pakete wöchentlich verworfen.

[Desweiteren](https://wiki.archlinux.org/index.php/Pacman/Pacnew_and_Pacsave#pacdiff) ist es mit `pacdiff` nach einem Update möglich die neuen Konfigurationsdateien der Pakete mit dein eigenen zusammenzuführen. 





