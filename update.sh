#!/bin/zsh

# updating pgp keyring
sudo pacman -Sy --noconfirm archlinux-keyring 
sudo pacman-key --populate archlinux

# update all packages 
yay -Syu --devel --timeupdate --noconfirm --noremovemake --cleanafter --norebuild --useask --sudoloop

# cleanup
sudo pacman -Rcns --noconfirm $(pacman -Qtdq)
# this will delete the comple package cache and is not recomanded to do usaly
sudo paccache -r -k 0
sudo pacman -Scc --noconfirm