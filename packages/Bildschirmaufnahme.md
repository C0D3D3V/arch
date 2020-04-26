# Bildschirmaufnahme


## Screenshots

[Screenshots](https://wiki.archlinux.org/index.php/Screen_capture) müssen früher oder später gemacht werden, standardmäßig werden diese von Linux nicht in die Zwischenablage wie bei Windows kopiert. Stattdessen ist jeder Desktop/Windowmanger selbst verantwortlich was beim drücken der "Drucken" Taste passiert. Ein gutes Screenshot-Programm ist `gnome-screenshot`, besser ist jedoch wegen den etwas größeren Funktionsumfang `spectacle`:

    + spectacle

## Screen-recording

    + obs-studio
    + libva-intel-driver
    + libva-mesa-driver
    + obs-xdg-portal-git

* `libva-mesa-driver` und `libva-intel-driver` für Hardware Encoding
* `obs-xdg-portal-git` um auch in wayland aufzunehmen