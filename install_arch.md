# Installation von Arch-Linux

## Arch-Image auf USB-Stick schrieben

Um das Arch-Abbild auf ein USB-Stick zu schreiben kann wie folgt vorgegangen werden:

    dd bs=4M if=/path/to/archlinux.iso of=/dev/sdx status=progress && sync

## Nach dem booten in das Live-System

Innerhalb des Terminals kann mit [Shift + Bild-Hoch] und entsprechend [Shift + Bild-Runter] gescrollt werden.

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

Benötigt werden zwei Partitionen eine EFI Partition (`EF00`) mit `500MB` für den Bootvorgang und eine Linux LVM Partition (`8E00`) in der die verschlüsselten Daten liegen werden.

Mit `p` kann die aktuelle Partitionstabelle aufgelistet werden. Mit `d` können bereits vorhandene Partitionen gelöscht werden (jede einzeln). Mit `n` können neue Partitionen angelegt werden. Wobei bei der ersten Partition für den letzten Sektor `500M` gewählt werden soll und für den Typ `EF00`. Bei der zweiten Partition soll für den Typ `8E00` gewählt werden. Bei allen anderen Optionen kann durch Bestätigen der Standardwert übernommen werden. Schließlich kann mit `w` die Partitionstabelle auf die Festplatte geschrieben werden. 


**Verschlüsseln der LVM Partition**

Als erstes muss mit [modprob](https://wiki.archlinux.org/index.php/Kernel_module#Obtaining_information) das `dm-crypt` Modul geladen werden.

    modprobe dm-crypt


Bevor die Partition verschlüsselt wird sollte überprüft werden ob genug [Entropie](https://wiki.archlinux.org/index.php/Random_number_generation#/dev/random) für `/dev/random` vorhanden ist. Wenn weniger als 200 Entropie vorhanden ist, kann durch Tastatur und Mauseingaben sowie beispielsweise durch das öffnen von Dateien und Auflisten von Ordnern Entropie erzeugt werden.

    cat /proc/sys/kernel/random/entropy_avail


Nun kann das anlegen der [Luks-Verschlüsselung](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#LVM_on_LUKS) gestartet werden ([weitere Infos](https://wiki.archlinux.de/title/Systemverschl%C3%BCsselung_mit_dm-crypt#Verschl.C3.BCsseltes_LVM_einrichten)): 

    cryptsetup -c aes-xts-plain64 -y -s 512 --use-random luksFormat /dev/sda2

Am Besten sollte hier ein komplett zufälliges Passwort mit mehr als 20 Stellen gewählt werden. 

Anschließend kann diese Luks-Partition geöffnet werden.


    cryptsetup open --type luks /dev/sda2 cryptlvm


Nun muss auf der geöffneten Luks-Partition ein [Physical Volume](https://wiki.archlinux.de/title/LVM#Physical_Volume) erzeugt werden. 

    pvcreate /dev/mapper/cryptlvm

Dieses Volume wird nun zu einer [Volume Group](https://wiki.archlinux.de/title/LVM#Volume_Group), mit dem Namen "vgMain", zusammengefasst.

    vgcreate vgMain /dev/mapper/cryptlvm

Nun kann die Volume Group in [Logische Volumes](https://wiki.archlinux.de/title/LVM#Logical_Volume) aufgeteilt werden. Erstellt werden soll ein Root-Volume und ein Swap-Volume. Das Swap-Volume sollte mindestens so groß sein wie der Arbeitsspeicher. Wie groß der Arbeitsspeicher ist kann mit `free --giga` ermittelt werden.

    lvcreate -L 20GB -n swap vgMain
    lvcreate -l 100%FREE -n root vgMain



**Formatieren der Partitionen**

Die root-Partition wird mit ext4 Formatiert. Anschließend wird die Swap Partition formatiert. Abschließend wird die ESP (EFI system Partition) mit Fat32 formatiert.

    mkfs.ext4 -L root /dev/mapper/vgMain-root
    mkswap -L swap /dev/mapper/vgMain-swap
    mkfs.fat -F32 -n EFI /dev/sda1


**Einbinden der Datei-Systeme**

Damit nun das Arch-System installiert werden kann, müssen die Partitionen auf denen Arch installiert wird eingebunden werden.

    mount /dev/mapper/vgMain-root /mnt
    mkdir /mnt/boot
    mount /dev/sda1 /mnt/boot
    swapon /dev/mapper/vgMain-swap




## Installation des Basissystems

**Basissystem installieren**

Bevor die Installation gestartet wird sollte die Liste der Spiegelserver angepasst werden um den Download zu beschleunigen. Setze dazu als ersten Spiegelserver einen deutschen Server.

    vim /etc/pacman.d/mirrorlist

Um das [Basissystem](https://wiki.archlinux.org/index.php/Installation_guide#Install_essential_packages) und den Editor vim sowie die zsh zu installieren, muss folgendes ausgeführt werden: 

    pacstrap /mnt base base-devel linux-firmware linux lvm2 vim zsh efibootmgr intel-ucode

`base` stellt die grundlegendste Funktionalität bereit, `base-devel` beinhaltet `pacman` und Werkzeuge um weitere Software zu installieren und zu bauen. `linux-firmware` liefert firmware für übliche Hardware, und `linux` ist der Kernel. `lvm2` wird benötigt weil die root-Partition damit verwaltet wird.

Die `intel-ucode` sollten nur auf einer Intel-CPU installiert werden. Auf einer AMD CPU sollte hingegen die `amd-ucode` installiert werden. 

Auf einem Notebook sollte zusätzlich `dialog wpa_supplicant` installiert werden.


**fstab-Tabelle erzeugen**

Nun kann die `fstab`-[Tabelle](https://wiki.archlinux.org/index.php/Installation_guide#Fstab) angelegt werden:

    genfstab -pU /mnt | tee -a /mnt/etc/fstab

Diese Tabelle beinhaltet alle Partitionen die Beim Systemstart automatisch eingebunden werden sollen.

Um /tmp schneller zu machen kann diese als [Ramdisk](https://wiki.archlinux.de/title/Ramdisk#Ramdisk_erstellen) eingebunden werden. Dazu müssen folgende Zeilen zu `/mnt/etc/fstab` hinzugefügt werden:

    # tmpfs 
    none /tmp tmpfs defaults,noatime,mode=1777 0 0


Nun kann in das neu installierte System [gewechselt](https://wiki.archlinux.org/index.php/Chroot#firstHeading) werden. 

    arch-chroot /mnt

**Basic-Einstellungen**

Zunächst wird die [Systemzeit](https://wiki.archlinux.org/index.php/System_time#Time_zone) eingestellt. Wichtig ist hierbei, dass im UEFI die utc-Zeit eingestellt ist. 

    ln -s /usr/share/zoneinfo/Europe/Berlin /etc/localtime
    hwclock --systohc --utc


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




Ein Hostname kann in der Datei `/etc/hostname` gesetzt werden.

    vim /etc/hostname

Der Hostname besteht aus einem zusammenhängenden Wort und kann wie eine Domain aufgebaut sein, Beispiel: `MyNotebook`


Abschließend muss das root-Passwort gesetzt werden und ein neuer Benutzer "MYUSERNAME" hinzugefügt werden.

    passwd

Wähle ein sehr starkes Passwort, weil dieser User so gut wie nie verwendet wird sollte das Passwort ausreichend stark sein.

    useradd -m -g users -G wheel,storage,power,network,uucp -s /bin/zsh MYUSERNAME

Damit dieser Benutzer [Administratorrechte](https://wiki.archlinux.de/title/Sudo#sudo_f.C3.BCr_Benutzer_einrichten) bekommt muss die `/etc/sudoers` Datei angepasst werden. Entfernen Sie den Kommentar und das Leerzeichen vor:

    %wheel   ALL=(ALL) ALL




Abschließend muss [mkinitcpio](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#Configuring_mkinitcpio_2) konfiguriert werden.

    vim /etc/mkinitcpio.conf


In der Datei muss `MODULES` und `Hooks` wie folgt angepasst werden:

    MODULES=(ext4)
    HOOKS=(base udev keyboard keymap autodetect consolefont modconf block encrypt lvm2 filesystems resume fsck)

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
    options cryptdevice=UUID={UUID}:cryptlvm root=/dev/mapper/vgMain-root resume=/dev/mapper/vgMain-swap quiet rw

Um die Geschwindigkeit weiter zu erhöhen kann zu den Optionen bei einer Intel-CPU die Option `intel_pstate=no_hwp` hinzugefügt werden um C0 States (P-states) zu deaktivieren.

Um die UUID inerhalb von vim zu erhalten, es muss komplett `{UUID}` mit der UUID ersetzt werden.

    :read ! blkid /dev/sda2


Die letzte Datei `/boot/loader/entries/arch.conf` ist sehr wichtig, überprüfe sie lieber doppelt!

## Fertig :)

Abschließend wird folgendes ausgeführt:

    exit
    umount -R /mnt
    swapoff -a
    reboot




