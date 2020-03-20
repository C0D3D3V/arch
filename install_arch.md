# Installation von Arch-Linux

## Arch-Image auf USB-Stick schrieben

Um das Arch-Abbild auf ein USB-Stick zu schreiben kann wie folgt vorgegangen werden:

    dd bs=4M if=/path/to/archlinux.iso of=/dev/sdx status=progress && sync




## Nach dem booten in das Live-System

Dieses Repository kann mit `git` heruntergeladen werden:

    loadkeys de-latin1
    dhcpcd
    pacman -Sy git
    git clone https://github.com/C0D3D3V/arch.git

Alternativ zu dieser Anleitung kann auch das identische automatische Skript von [hier](https://github.com/C0D3D3V/simpleAui/blob/master/liveinstall) verwendet werden.




Innerhalb des Terminals kann mit [Shift + Bild-Hoch] und entsprechend [Shift + Bild-Runter] gescrollt werden.

Es wird stark empfohlen vor der Installation [online](https://www.openvim.com/) oder im Livesystem (durch eingabe von `vimtutor`) ein `vim`-Tutorial zu machen, damit die Basics von `vim` klar sind.

Du kannst eine Zeile unter dem Cursor in `vim` mit `:.w !bash` ausführen.

Du kannst diese Datei mit `vim` öffnen und sobald du wieder ins Terminal zurück möchtest [Strg + z] drücken um den Prozess zu pausieren. Mit `jobs` bekommst du eine Liste alle pausierten Prozesse. Mit `fg %job_id` bringst du den Prozess `job_id` wieder in den Fordergrund wobei `job_id` eine id aus der Tabelle von `jobs` ist. 

In `vim` kann mit `:e filename` eine andere Datei geöffnet werden mit `:bn` und `:bp` bzw. `:buffers` kann zwischen geöffneten Dateien gewechselt werden.


**Schrift temporär vergrößern**

Um in einem tty die [Schriftgröße](https://wiki.archlinux.org/index.php/Linux_console#Preview_and_temporary_changes) temporär zu ändern kann wie folgt vorgegangen werden:

Die komplette Font kann mit `showconsolefont` ausgegeben werden.

Eine Liste aller verfügbaren Fonts erhällt man durch `ls /usr/share/kbd/consolefonts/`

Durch folgenden Befehl wird die Font auf eine sehr große Font geändert.

    setfont sun12x22




**Temporäres ändern des Tastaturlayouts**

Um zu dem deutschen [Tastaturlayout](https://wiki.archlinux.org/index.php/installation_guide#Set_the_keyboard_layout) zu wechseln verwende

    loadkeys de-latin1





**Auf UEFI prüfen**

Als nächstes soll sicher gestellt werden, dass das Live-System im [UEFI-Modus](https://wiki.archlinux.org/index.php/installation_guide#Verify_the_boot_mode) gestartet wurde. Dazu wird das efivars Verzeichnis aufgelistet (`ls /sys/firmware/efi/efivars`), wenn das Verzeichnis nicht existiert, wurde das System nicht im UEFI-Modus gebootet.

    efivar --list




**Netzwerkverbindung herstellen**

Um eine [Netzwerkverbindung](https://wiki.archlinux.org/index.php/Network_configuration#Network_management) einzurichten, wird meist bei einer Ethernet-Verbindung eine IP-Adresse über einen im Netz befindenden DHCP-Server zugewiesen. Damit eine Zuweisung erfolgen kann muss der entsprechende Client wie folgt gestartet werden:

    dhcpcd

Dann kann mit `ip addr` überprüft werden, ob eine IP-Adresse zugewiesen wurde und mit `ping archlinux.org` getestet werden ob eine Internetverbindung vorhanden ist.




**System-Zeit aktualisieren**

Um die [System-Zeit](https://wiki.archlinux.org/index.php/Systemd-timesyncd#Usage) mit der Netzwerkzeit zu synchronisieren, muss der `timesyncd`-Service gestartet werden:

    timedatectl set-ntp true

Geprüft werden kann die Zeit mit `timedatectl status`





## Partitionen anlegen und formatieren

**Anlegen der Partitionen**

Mit [gdisk](https://wiki.archlinux.de/title/GPT#Partitionieren_mit_gdisk) kann eine Festplatte mit Hilfe einer Gpt Partitionstabelle in Partitionen unterteilt werden. 

Zuerst muss festgestellt werden welche Festplatte partitioniert werden soll, folgender Befehl listet alle vorhanden Festplatten auf:

    lsblk

Alternativ geht auch `fdisk -l`, der Festplattenpfad sollte ähnlich zu dem sein: `/dev/sda`

Um die Partitionierung zu starten muss `gdisk` mit dem Festplattenpfad ausgeführt werden.

    gdisk /dev/sda

Benötigt werden zwei Partitionen eine EFI Partition (`EF00`) mit `500MB` für den Bootvorgang und eine Linux Filesystem Partition (`8300`) in der die verschlüsselten Daten liegen werden.

Mit `p` kann die aktuelle Partitionstabelle aufgelistet werden. Mit `d` können bereits vorhandene Partitionen gelöscht werden (jede einzeln). Mit `n` können neue Partitionen angelegt werden. Wobei bei der ersten Partition für den letzten Sektor `500M` gewählt werden soll und für den Typ `EF00`. Bei der zweiten Partition soll für den Typ `8300` gewählt werden. Bei allen anderen Optionen kann durch Bestätigen der Standardwert übernommen werden. Schließlich kann mit `w` die Partitionstabelle auf die Festplatte geschrieben werden. 






**Verschlüsseln der Root-Partition**

Als erstes muss mit [modprob](https://wiki.archlinux.org/index.php/Kernel_module#Obtaining_information) das `dm-crypt` Modul geladen werden.

    modprobe dm-crypt


Bevor die Partition verschlüsselt wird sollte überprüft werden ob genug [Entropie](https://wiki.archlinux.org/index.php/Random_number_generation#/dev/random) für `/dev/random` vorhanden ist. Wenn weniger als 200 Entropie vorhanden ist, kann durch Tastatur und Mauseingaben sowie beispielsweise durch das öffnen von Dateien und Auflisten von Ordnern Entropie erzeugt werden.

    cat /proc/sys/kernel/random/entropy_avail


Nun kann das anlegen der [Luks-Verschlüsselung](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#LVM_on_LUKS) gestartet werden ([weitere Infos](https://wiki.archlinux.de/title/Systemverschl%C3%BCsselung_mit_dm-crypt#Verschl.C3.BCsseltes_LVM_einrichten)): 

    cryptsetup -c aes-xts-plain64 -y -s 512 --use-random luksFormat /dev/sda2

Am Besten sollte hier ein komplett zufälliges Passwort mit mehr als 20 Stellen gewählt werden. 

Anschließend kann diese Luks-Partition geöffnet werden.


    cryptsetup open --type luks /dev/sda2 cryptroot







**Formatieren der Partitionen**

Die root-Partition wird mit ext4 Formatiert. Anschließend wird die ESP (EFI system Partition) mit Fat32 formatiert.

    mkfs.ext4 -L root /dev/mapper/cryptroot
    mkfs.fat -F32 -n EFI /dev/sda1





**Einbinden der Datei-Systeme**

Damit nun das Arch-System installiert werden kann, müssen die Partitionen auf denen Arch installiert wird eingebunden werden.

    mount /dev/mapper/cryptroot /mnt
    mkdir /mnt/boot
    mount /dev/sda1 /mnt/boot






## Installation des Basissystems

**Basissystem installieren**

Bevor die Installation gestartet wird sollte die Liste der Spiegelserver angepasst werden um den Download zu beschleunigen. Setze dazu als ersten Spiegelserver einen deutschen Server.

    vim /etc/pacman.d/mirrorlist

Alternativ kann dies auch automatisch erledigt werden:

    pacman -Sy reflector
    reflector -c France -c Germany -a 25 -p https --sort rate --verbose --save /etc/pacman.d/mirrorlist

Um das [Basissystem](https://wiki.archlinux.org/index.php/Installation_guide#Install_essential_packages) und den Editor vim sowie die zsh zu installieren, muss folgendes ausgeführt werden: 

    pacstrap /mnt base base-devel linux-firmware linux vim zsh efibootmgr intel-ucode zstd

- `base` stellt die grundlegendste Funktionalität bereit
- `base-devel` beinhaltet `pacman` und Werkzeuge um weitere Software zu installieren und zu bauen
- `linux-firmware` liefert firmware für übliche Hardware
- `linux` ist der Kernel
- `vim zsh` sind großartige Werkzeuge
- `efibootmgr` um die efi-boot Einstellungen gegebenenfalls zu ändern
- `intel-ucode` sollte nur auf einer Intel-CPU installiert werden. Auf einer AMD CPU sollte hingegen die `amd-ucode` installiert werden. Dies sind die Microcode-Patches.
- `zstd` ist ein schnelles Werkzeug im Dateien zu komprimieren 

Auf einem Notebook sollte zusätzlich `netctl dialog wpa_supplicant` installiert werden, damit sich mit einem W-Lan verbunden werden kann.






## Basic-Einstellungen

**chrooten**

Nun kann in das neu installierte [System](https://wiki.archlinux.org/index.php/Chroot#firstHeading) gewechselt werden. 

    arch-chroot /mnt





**Swap-File aktivieren**


Die Swap-Datei sollte mindestens so groß sein wie der Arbeitsspeicher. Wie groß der Arbeitsspeicher ist kann mit `free --giga` ermittelt werden. Um eine Swap-Datei zu aktivieren muss folgendes erledigt werden:


    fallocate -l 20GiB /mnt/swapfile
    chmod 600 /mnt/swapfile
    mkswap -L swap /mnt/swapfile
    swapon /mnt/swapfile



Um die Performance weiter zu steigern kann die [Swappiness](https://wiki.archlinux.org/index.php/Swap#Swappiness) und die *VFS cache pressure* angepasst werden.

    echo vm.swappiness=5 | tee -a /etc/sysctl.d/99-sysctl.conf
    echo vm.vfs_cache_pressure=50 | tee -a /etc/sysctl.d/99-sysctl.conf





**fstab-Tabelle erzeugen**

Nun kann die `fstab`-[Tabelle](https://wiki.archlinux.org/index.php/Installation_guide#Fstab) angelegt werden:

    genfstab -pU /mnt | tee -a /mnt/etc/fstab

Diese Tabelle beinhaltet alle Partitionen die Beim Systemstart automatisch eingebunden werden sollen.

Um /tmp schneller zu machen kann diese als [Ramdisk](https://wiki.archlinux.de/title/Ramdisk#Ramdisk_erstellen) eingebunden werden. Dazu müssen folgende Zeilen zu `/mnt/etc/fstab` hinzugefügt werden:

    # tmpfs 
    none /tmp tmpfs defaults,noatime,mode=1777 0 0





**Zeit-Einstellungen**

Zunächst wird die [Systemzeit](https://wiki.archlinux.org/index.php/System_time#Time_zone) eingestellt. Wichtig ist hierbei, dass im UEFI die utc-Zeit eingestellt ist. 

    ln -s /usr/share/zoneinfo/Europe/Berlin /etc/localtime
    hwclock --systohc --utc





**Locales-Einstellungen**

Nun müssen die [locales](https://wiki.archlinux.de/title/Locale#Aktivierung_und_Verwendung) angepasst werden, damit die Texte in der richtigen Sprache angezeigt werden:

    vim /etc/locale.gen

Um die deutsche Sprache zu aktivieren muss das Kommentarzeichen vor de_DE.UTF-8 UTF-8 entfernt werden.

Anschließend können die locales wie folgt generiert werden:
    
    locale-gen
    localectl set-locale LANG=de_DE.UTF-8

    echo LANG=de_DE.UTF-8 >> /etc/locale.conf
    echo LC_ALL= >> /etc/locale.conf

    echo KEYMAP=de-latin1 >> /etc/vconsole.conf
    echo FONT=sun12x22 >> /etc/vconsole.conf




**Host-Einstellungen**

Ein Hostname kann in der Datei `/etc/hostname` gesetzt werden.

    vim /etc/hostname

Der Hostname besteht aus einem zusammenhängenden Wort und kann wie eine Domain aufgebaut sein, Beispiel: `MyNotebook`





**User-Einstellungen**

Abschließend muss das root-Passwort gesetzt werden und ein neuer Benutzer "MYUSERNAME" hinzugefügt werden.

    passwd

Wähle ein sehr starkes Passwort, weil dieser User so gut wie nie verwendet wird sollte das Passwort ausreichend stark sein.

    useradd -m -g users -G wheel,storage,power,network,uucp -s /bin/zsh MYUSERNAME

Damit dieser Benutzer [Administratorrechte](https://wiki.archlinux.de/title/Sudo#sudo_f.C3.BCr_Benutzer_einrichten) bekommt muss die `/etc/sudoers` Datei angepasst werden. Entfernen Sie den Kommentar und das Leerzeichen vor:

    %wheel   ALL=(ALL) ALL





**Paketverwaltung-Einstellungen**

Um auch [32bit Anwendung](https://wiki.archlinux.org/index.php/multilib) installieren zu können muss in der `/etc/pacman.conf` Datei die `multilib` Sektion wieder einkommentiert werden.

    [multilib]
    Include = /etc/pacman.d/mirrorlist



Um das Bauen von Paketen mit [makepkg](https://wiki.archlinux.org/index.php/makepkg#tmpfs) etwas zu beschleunigen, muss die `/etc/makepkg.conf` Datei angepasst werden:

    BUILDDIR=/tmp/makepkg
    PKGEXT='.pkg.tar.zst
    COMPRESSZST=(zstd -c -q -T0 -18 -)
    MAKEFLAGS='-j$(nproc)





**Journal-Einstellungen**

Damit das [Journal](https://wiki.archlinux.org/index.php/Systemd/Journal#Journal_size_limit) nicht 4GB groß wird muss dies weiter beschränkt werden. Dazu muss die Datei `/etc/systemd/journald.conf` angepasst werden.


    Storage=persistent
    SystemMaxUse=1G
    




**Init-RAM-Disk (initrd)**

Abschließend muss [mkinitcpio](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#Configuring_mkinitcpio_2) konfiguriert werden.

    vim /etc/mkinitcpio.conf


In der Datei muss `MODULES` und `Hooks` wie folgt angepasst werden:

    MODULES=(ext4)
    HOOKS=(base udev keyboard keymap autodetect consolefont modconf block encrypt filesystems resume fsck)

Nun muss nur noch das initramfs Abbild neu erstellt werden, wie folgt:

    mkinitcpio -P

Wenn dabei Warnungen beim bauen des Fallback-Abbilds auftreten wie beispielsweise diese Warnung: `==> WARNING: Possibly missing firmware for module: wd719x` oder `==> WARNING: Possibly missing firmware for module: aic94xx` ist das nicht weiter schlimm und kann später durch das installieren der entsprechenden Firmware aus dem AUR behoben werden, falls gewünscht.






## Bootloader installieren

Im folgenden wird ein [EFI Boot-Manager](https://wiki.archlinux.org/index.php/Systemd-boot#Installing_the_EFI_boot_manager) installiert.

    bootctl --path=/boot install


Die [Konfiguration](https://wiki.archlinux.de/title/Systemd-boot#Konfiguration) des Bootloaders ist einfach gehalten: 

    echo default arch > /boot/loader/loader.conf

Weil nun konfiguriert wurde, dass 'arch' standardmäßig gestartet werden soll muss dieser Eintrag auch erstellt werden. Dazu wird die Datei `/boot/loader/entries/arch.conf` angelegt, mit folgendem Inhalt, hier wird auch das [microcode-Abbild](https://wiki.archlinux.org/index.php/Microcode#systemd-boot) zum Ladevorgang hinzugefügt:

    title Arch Linux
    linux /vmlinuz-linux
    initrd /intel-ucode.img
    initrd /initramfs-linux.img
    options cryptdevice=UUID={UUID}:cryptroot root=/dev/mapper/cryptroot resume=/dev/mapper/cryptroot resume_offset={swap_file_offset} quiet rw

Um die Geschwindigkeit weiter zu erhöhen kann zu den Optionen bei einer Intel-CPU die Option `intel_pstate=no_hwp` hinzugefügt werden um C0 States (P-states) zu deaktivieren.

Es muss komplett `{UUID}` mit der UUID ersetzt werden, das selbe gilt für {swap_file_offset}. Folgendes fügt in `vim` eine Zeile unter dem Cursor die Ausgabe von dem Befehl, um die UUID zu erhalten, ein.

    :read ! blkid -s UUID /dev/sda2 -o value

Um swap_file_offset zu erhalten genügt folgender Befehl:

    :read ! filefrag -v /swapfile | awk '{ if($1=="0:"){print $4} }'


Die letzte Datei `/boot/loader/entries/arch.conf` ist sehr wichtig, überprüfe sie lieber doppelt!






## Fertig :)

Abschließend wird folgendes ausgeführt:

    exit
    umount -R /mnt
    swapoff -a
    reboot




