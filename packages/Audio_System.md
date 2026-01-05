# Audio-System

[ALSA](https://wiki.archlinux.de/title/Advanced_Linux_Sound_Architecture) (Advanced Linux Sound Architecture) ist das bereits eingebaute Sound-System von Linux. Es gibt einige [Soundserver](https://wiki.archlinux.org/index.php/Sound_system#Sound_servers) mit denen das ganze Audio Zeug besser verwaltet werden kann.

Momentan nutzen alle [PipeWire](https://wiki.archlinux.org/title/PipeWire) und [WirePlumber](https://wiki.archlinux.org/title/WirePlumber) als Session-Manager:

    + pipewire
    + lib32-pipewire
    + wireplumber
    + pipewire-alsa
    + pipewire-pulse
    + pipewire-audio
    + pipewire-audio

Früher wurde PulseAudio verwendet:

    - pulseaudio
    - pulseaudio-alsa
    - pulseaudio-equalizer 

Damit die vollen Funktionen von `pulseaudio` eingesetzt werden können muss ein entsprechendes [Front-End](https://wiki.archlinux.org/index.php/PulseAudio#Front-ends) installiert werden:

* `plasma-pa` wird mit KDE installiert.

PulseAudio Volume Control ist ein gutes allgemeines Tool:

    + pavucontrol

    


