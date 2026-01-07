# [Wartung](https://wiki.archlinux.org/index.php/System_maintenance)

## Update

Damit man vor dem System-Update die neusten Arch News lesen muss, gibt es ein pacman Hook `informant`:

    - informant


Der Benutzer muss in der Gruppe `informant` sein.

    #gpasswd -a USERNAME informant

Wenn der Kernel aktualisiert werden werden die Kernelmodule nicht mehr korrekt geladen, weil diese im neuen Ordner liegen. Damit diese weiterhin geladen werden können hilft `kernel-modules-hook`:

    + kernel-modules-hook
  
    systemctl enable --now linux-modules-cleanup

Das verzögert das neustarten des Computers etwas heraus, man sollte jedoch dennoch sobald wie möglich neustarten.

Manche Services stürzen nach einer Aktualisierung einfach ab, damit diese neu gestartet werden kann `needrestart` installiert werden:

    + needrestart
