# Schriftarten

[Schriftarten](https://wiki.archlinux.de/title/Schriftarten) gibt es wie [Sand am Meer](https://wiki.archlinux.org/index.php/Fonts). Eine kleine Auswahl gibt es hier:

## Bitmap

    bdf-unifont
    psf-envypn
  
## Latin-Families

    + ttf-dejavu
    + noto-fonts
  
## Latin-Monospaces + Sans-serif + Serif

    + gnu-free-fonts
  
## CJK-Fonts

    + noto-fonts-cjk

## Emoji-Fonts

    + noto-fonts-emoji

## Mono-Fonts

    ttf-roboto-mono

## Awesome Fonts

    + otf-font-awesome
    + awesome-terminal-fonts

Damit die [Schriftarten korrekt verwendet werden](https://dev.to/darksmile92/get-emojis-working-on-arch-linux-with-noto-fonts-emoji-2a9), erstelle die Datei `/etc/fonts/local.conf` mit folgendem Inhalt:

    <?xml version="1.0"?>
    <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
    <fontconfig>
    <alias>
    <family>sans-serif</family>
    <prefer>
        <family>Noto Sans</family>
        <family>Noto Color Emoji</family>
        <family>Noto Emoji</family>
        <family>DejaVu Sans</family>
    </prefer> 
    </alias>

    <alias>
    <family>serif</family>
    <prefer>
        <family>Noto Serif</family>
        <family>Noto Color Emoji</family>
        <family>Noto Emoji</family>
        <family>DejaVu Serif</family>
    </prefer>
    </alias>

    <alias>
    <family>monospace</family>
    <prefer>
        <family>Noto Mono</family>
        <family>Noto Color Emoji</family>
        <family>Noto Emoji</family>
        <family>DejaVu Sans Mono</family>
    </prefer>
    </alias>
    </fontconfig>

Anschließend muss der Cache aktualisiert werden:

    sudo fc-cache
