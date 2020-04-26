# Systemrelevante Einstellungen

Damit die Systemzeit von einem ntp Server geladen wird muss der Service `systemd-timesyncd`aktiviert werden. 

    systemctl enable --now systemd-timesyncd
