# Netzwerk

In den meisten LAN-Netzwerk wird ein [DHCP](https://wiki.archlinux.org/index.php/dhcpcd)-Server verwendet um IP-Adressen zuzuteilen. Damit einem Computer eine IP-Adresse zugeteilt werden kann muss dieser einen entsprechenden Client starten der die IP-Adresse registriert. `dhcpcd` ist ein solche Client. 

    + dhcpcd

Um den Client manuell zu starten muss folgendes gemacht werden:

    dhcpcd interface

Wobei `interface` eines der installierten Interfaces ist welche durch `ip link` aufgelistet werden.


Um Netzwerke generell zu verwalten ist [NetworkManager](https://wiki.archlinux.org/index.php/NetworkManager) besonders gut geeignet.

    + networkmanager

Anschließend muss noch der entsprechende Service aktiviert werden:

    systemctl enable --now NetworkManager