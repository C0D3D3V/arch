# Wörterbuch

Es gibt ein paar [Wörterbuch Anwendungen](https://wiki.archlinux.org/index.php/list_of_applications#Dictionary_and_thesaurus) die alle ein wenig seltsam sind. `goldendict` funktioniert meiner Meinung nach am Besten.

    + goldendict
    + dictd
    + dict-freedict-eng-deu-bin
    + dict-freedict-deu-eng-bin
    
* `dictd` zum [Übersetzen von Wörtern](https://wiki.archlinux.org/index.php/Dictd)
* `dict-freedict-eng-deu-bin` und `dict-freedict-deu-eng-bin` sind entsprechende Wörterbücher.
  
    systemctl enable --now dictd.service