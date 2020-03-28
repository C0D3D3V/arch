#!/bin/zsh

# This is a script to force update... Not recommended for usual updates

# update mirrorlist
sudo reflector --country France --country Germany --age 25 --protocol https --sort rate --verbose --save /etc/pacman.d/mirrorlist

# updating pgp keyring
sudo pacman -Sy --noconfirm archlinux-keyring 
sudo pacman-key --populate archlinux

# update all packages 
yay -Syu --devel --timeupdate --noconfirm --noremovemake --cleanafter --norebuild --useask --sudoloop

# cleanup
sudo pacman -Rcns --noconfirm $(pacman -Qtdq)
# this will delete the complete package cache and is not recommended to do usually
sudo paccache -r -k 0
sudo yay -Scc --noconfirm


