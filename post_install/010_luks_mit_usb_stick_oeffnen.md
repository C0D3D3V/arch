# Installation des automatischen Öffnens der root-Partition 

Weil die Eingabe einer ewig langen Passphrase zu lange dauert ist es möglich auf einem USB-Stick eine Passphrase zu speichern und diese als [Schlüsseldatei](https://wiki.archlinux.org/index.php/Dm-crypt/Device_encryption#Keyfiles) zu verwenden um das System automatisch zu entschlüsseln.


Dazu muss ein USB-Stick vorbereitet werden. In diesem Beispiel sollte dieser FAT-formatiert werden. Anschließend kann darauf eine Datei platziert werden welche als [Schlüsseldatei](https://wiki.archlinux.org/index.php/Dm-crypt/Device_encryption#Keyfiles) dient. Solche eine Datei kann entweder generiert werden oder eine beliebige vorhandene Datei sein.

Als Beispiel kann eine Datei wie folgt erzeugt werden.

    dd bs=512 count=4 if=/dev/urandom of=/media/usbstick/mykeyfile iflag=fullblock
    chmod 600 /media/usbstick/mykeyfile

Nun kann die Schlüsseldatei als Schlüssel hinzugefügt werden:

    cryptsetup luksAddKey /dev/sda2 /media/usbstick/mykeyfile

Damit der USB-Stick während dem Boot erkannt wird, muss das entsprechende Dateisystem während dem Boot geladen werden. Dazu wird die `/etc/mkinitcpio.conf` Datei angepasst, zu den `MODULES` wird `vfat` hinzugefügt. Anschließend kann das initramfs Abbild neu gebaut werden. 

    MODULES=(vfat ...)

    sudo mkinitcpio -P

Damit während dem Boot bekannt wird welche Datei als Schlüsseldatei verwendet werden soll, müssen den Kernel-Parameter in `/boot/loader/entries/arch.conf` angepasst werden. Zusätzlich muss folgende Option angefügt werden:

    cryptkey=UUID={USB-Stick-UUID}:vfat:/path/to/secretkey

Wie bereits bei der Installation kann die UUID wie folgt in `vim` kopiert werden:
    
    :read ! blkid -s UUID  -o value /dev/sdc1 