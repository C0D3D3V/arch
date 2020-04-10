# Andere Festplatten

Oft hat man mehr als eine Festplatte verbaut. Damit diese Festplatten auch verschlüsselt sind und automatische gemountet werden muss man [speziell vorgehen](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_a_non-root_file_system):

Zunächst muss festgestellt werden welchen Pfad die Festplatte hat: 

    lsblk

Alternativ geht auch `fdisk -l`, der Festplattenpfad sollte ähnlich zu dem sein: `/dev/sdb`

Nun muss die Festplatte mit `gdisk` partitioniert werden.

    + gdisk

    gdisk /dev/sdb

Benötigt wird eine große Linux Filesystem Partition (`8300`) in der die verschlüsselten Daten liegen werden.

Mit `p` kann die aktuelle Partitionstabelle aufgelistet werden. Mit `d` können bereits vorhandene Partitionen gelöscht werden (jede einzeln). Mit `n` können neue Partitionen angelegt werden. Wobei eine Partition angelegt wird mit dem Typ `8300`. Bei allen anderen Optionen kann durch Bestätigen der Standardwert übernommen werden. Schließlich kann mit `w` die Partitionstabelle auf die Festplatte geschrieben werden. 


Anschließend kann die Partition verschlüsselt werden: 

    cryptsetup -c aes-xts-plain64 -y -s 512 --use-random luksFormat /dev/sdb1

Am Besten sollte hier ein komplett zufälliges Passwort mit mehr als 20 Stellen gewählt werden, eingegeben werden muss dies sowieso nicht weil eine Schlüsseldatei angelegt wird. Dennoch muss von dem Passwort ein Backup erstellt werden.

Als Beispiel kann eine [Schlüsseldatei](https://wiki.archlinux.org/index.php/Dm-crypt/Device_encryption#Encryption_options_for_LUKS_mode) wie folgt erzeugt werden.

    dd bs=512 count=4 if=/dev/urandom of=/etc/data_key iflag=fullblock
    chown root:root /etc/data_key
    chmod 400 /etc/data_key

Nun kann die erstellte Schlüsseldatei als Schlüssel hinzugefügt werden:

    cryptsetup luksAddKey /dev/sdb1 /etc/data_key


Nun muss die erstellte [Partition](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_a_non-root_file_system) geöffnet werden und entsprechend formatiert werden, wichtig `data_luks` ist der Name mit dem die Partition eingebunden wird, bei mehreren Festplatten muss dieser geändert werden:

    cryptsetup open /dev/sdb1 data_luks --key-file /etc/data_key
    mkfs.ext4 /dev/mapper/data_luks


Nun muss eine [crypttab](https://wiki.archlinux.org/index.php/Dm-crypt/System_configuration#crypttab) Datei angelegt werden unter `/etc/crypttab`:

    data_luks         UUID={UUID}    /etc/data_key

Wie bereits bei der Installation kann die UUID wie folgt in `vim` kopiert werden:
    
    :read ! blkid -s UUID  -o value /dev/sdb1 

Nun kann entschieden werden wohin die Festplatte eingebunden werden soll. Beispeiseweise nach `/data`:

    mkdir /data
    chown root:users /data
    chmod 775 /data

Anschließend muss die `/etc/fstab` Datei angepasst werden:

    /dev/mapper/data_luks /data ext4 defaults 0 2




 
