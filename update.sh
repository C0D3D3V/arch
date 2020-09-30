#!/bin/zsh

# This is a script to force update... Not recommended for usual updates

# update mirrorlist
sudo reflector --country France --country Germany --age 12 --completion-percent 70 --protocol https --sort rate --verbose --save /etc/pacman.d/mirrorlist

# updating pgp keyring
sudo pacman -Sy --noconfirm --needed archlinux-keyring
# sudo pacman-key --populate archlinux

if [ $? -eq 0 ]; then

    # update all packages
    yay -Syu --devel --timeupdate --noconfirm --noremovemake --cleanafter --norebuild --useask --sudoloop

    if [ $? -eq 0 ]; then
        # cleanup
        sudo pacman -Rcns --noconfirm $(pacman -Qtdq)
        # this will delete the complete package cache and is not recommended to do usually
        sudo paccache -r -k 0
        sudo yay -Scc --noconfirm
    else

        echo "Failed to install updates!"
    fi

else

    echo "Failed to install archlinux-keyring!"
fi
