# Grafiktreiber

Als erstes muss herausgefunden werden, was für eine Grafikkarte verbaut ist:

    lspci -k | grep -A 2 -E "(VGA|3D)"

Je nach Hersteller muss unterschiedlich vorgegangen werden:

## NVIDIA

Eine [NVIDIA](https://wiki.archlinux.org/index.php/NVIDIA) Grafikkarte besitzt einen Codename, als erstes sollte dieser auf dieser [Webseite](https://nouveau.freedesktop.org/wiki/CodeNames/) nachgeschlagen werden.

Für GeForce GTX 660 ist er CodeName: `NVE6 (GK106)`

Speziell sollte geprüft werden ob die Grafikkarte als [bei NVIDIA](https://www.nvidia.com/en-us/drivers/unix/legacy-gpu/) als veraltet aufgelistet ist, ist dies nicht der Fall kann der neuste Treiber verwendet werden.

Für GeForce GTX 660 ist es also ausreichen `nvidia` zu installieren.

    + nvidia
    + lib32-nvidia-utils

`lib32-nvidia-utils` wird benötigt um auch 32 Bit Anwendungen zu unterstützen.

Zunächst sollte eine einfache Konfiguration für xorg erstellt werden

    sudo nvidia-xconfig


Anschließend muss die `/etc/mkinitcpio.conf` Datei angepasst werden. Zu den `MODULES` muss der Kernel-Grafiktreiber `nvidia` hinzugefügt werden. 

    MODULES=(nvidia ...)

Danach kann das `initramfs` Abbild neu gebaut werden:

    sudo mkinitcpio -P


Weil nun `nvidia` als Kernel-Module geladen wird sollte entsprechend das `initramfs` Abbild nach jedem Update neu gebaut werden, dazu wird ein Pacman-Hook unter `/etc/pacman.d/hooks/nvidia.hook` angelegt: 

    [Trigger]
    Operation=Install
    Operation=Upgrade
    Operation=Remove
    Type=Package
    Target=nvidia
    Target=linux
    # Change the linux part above and in the Exec line if a different kernel is used
    
    [Action]
    Description=Update Nvidia module in initcpio
    Depends=mkinitcpio
    When=PostTransaction
    NeedsTargets
    Exec=/bin/sh -c 'while read -r trg; do case $trg in linux) exit 0; esac; done; /usr/bin/mkinitcpio -P'

Um die Einstellungen des Treibers zu verwalten kann `nividia-settings` installiert werden.

    + nvidia-settings


## Intel

[Intel Grafiktreiber](https://wiki.archlinux.org/index.php/intel_graphics#Installation) sind im Paket `mesa` enthalten. Dies wird normalerweise mit xorg mit installiert.

    + mesa
    + lib32-mesa


Anschließend muss die `/etc/mkinitcpio.conf` Datei angepasst werden. Zu den `MODULES` muss der Kernel-Grafiktreiber `i915` hinzugefügt werden. 

    MODULES=(i915 ...)

Danach kann das `initramfs` Abbild neu gebaut werden:

    sudo mkinitcpio -P
