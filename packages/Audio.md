# Audio

## Audio-System

[ALSA](https://wiki.archlinux.de/title/Advanced_Linux_Sound_Architecture) (Advanced Linux Sound Architecture) ist das bereits eingebaute Sound-System von Linux. Es gibt einige [Soundserver](https://wiki.archlinux.org/index.php/Sound_system#Sound_servers) mit denen das ganze Audio Zeug besser verwaltet werden kann.

    + pulseaudio
    + pulseaudio-alsa
    + pulseaudio-equalizer 

Damit die vollen Funktionen von `pulseaudio` eingesetzt werden können muss ein entsprechendes [Front-End](https://wiki.archlinux.org/index.php/PulseAudio#Front-ends) installiert werden:

* `plasma-pa` wurde bereits mit KDE installiert.

PulseAudio Volume Control ist ein gutes allgemeines Tool:

    + pavucontrol

    

## Audioplayer

Beliebte Audioplayer sind `Audacious`, `Exaile`, `Quod Libet`un `Rhythmbox`. Die sind [vergleichbar](https://en.wikipedia.org/wiki/Comparison_of_audio_player_software) aber es gibt noch [viele mehr](https://wiki.archlinux.org/index.php/list_of_applications#Graphical_12). Für mich hat [Rhythmbox](https://wiki.archlinux.org/index.php/Rhythmbox) die meisten Vorteile, diesen kann man auch als Podcast client verwenden.

    + rhythmbox
    + gst-libav
    + gst-plugins-ugly
    + brasero
    + libdmapsharing
    + grilo-plugins
    + dleyna-server

* `gst-libav` und `gst-plugins-ugly` für mehr Codecs
* `brasero` um Audio-CDs aufzunehmen
* `libdmapsharing` DAAP Musik sharing
* `grilo-plugins` Gerilo media brwoser
* `dleyna-server`

Grilo muss unter Plugins erst noch aktiviert werden.