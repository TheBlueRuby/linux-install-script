#!/bin/bash

pacman -S --needed git base-devel
git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin
makepkg -si
cd ../
rm -rf ./paru-bin/
