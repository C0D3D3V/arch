# Smartcards

Um [Smartcards](https://wiki.archlinux.org/index.php/Smartcards) nutzen zu können sind folgende Pakete essentiell:

    + ccid  
    + opensc
    + pcsc-tools

* `ccid` ist ein generischer USB Treiber für Smartcardreader (falls das Gerät nicht erkannt wird muss ein extra Treiber installiert werden )
* `pcsc-tools` zum testen


Wenn kein Tastenfeld am Lesegerät vorhanden ist muss in `/etc/opensc.conf` folgende Zeile hinzugefügt werden:

    enable_pinpad = false


Anschließend kann der Dienst gestartet werden:

    systemctl enable --now pcscd.service


In Firefox muss in den Einstellungen unter "Zertifikate" -> "Kryptographie Module" das Modul `/usr/lib/opensc-pkcs11.so` geladen werden, es kann ein beliebiger Name vergeben werden.

Für Chromium muss mit `modutil -list -dbdir ~/.pki/nssdb/` geprüft werden ob das Modul `CAC Module` geladen ist. Falls nicht kann es mit `modutil -dbdir sql:~/.pki/nssdb/ -add "CAC Module" -libfile /usr/lib/opensc-pkcs11.so` erzeugt werden.
