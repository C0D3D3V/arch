
# System Anwendungen

## Paketverwaltung `pacman`

Die Paketverwaltung verwaltet die installierten Anwendungen. Mit Hilfe der Paketverwaltung kann neue Software installiert, deinstalliert und aktualisiert (geupdatet) werden. Software wird daher auch als Pakete bezeichnet.


### Mitgelieferte Skripte und Werkzeuge für das Pacman-Systeme

    + pacman-contrib  

Pacman speichert seine heruntergeladenen Pakete in `/var/cache/pacman/pkg/` und entfernt die alten oder deinstallierten Versionen nicht automatisch. Dies hat ein paar Vorteile:

* Es ermöglicht das Downgrade eines Pakets, ohne dass die vorherige Version auf anderen Wegen, wie z.B. über das Arch-Linux-Archiv, abgerufen werden muss.

* Ein Paket, das deinstalliert wurde, kann einfach direkt aus dem Cache-Ordner neu installiert werden, ohne dass ein neuer Download aus dem Repository erforderlich ist.

Es ist jedoch notwendig, den Cache in regelmäßigen Abständen bewusst zu bereinigen, um zu verhindern, dass der Ordner unendlich groß wird. 

Das `paccache`-Skript, das im `pacman-contrib`-Paket enthalten ist, löscht standardmäßig alle zwischengespeicherten Versionen von installierten und deinstallierten Paketen, mit Ausnahme der letzten 3. 

 Um nur **eine** frühere Version zu behalten, verwende: 

    paccache -rk1


Durch die Aktivierung des Services `paccache.timer`, werden unbenutzte Pakete wöchentlich verworfen.



