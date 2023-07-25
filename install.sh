#!/bin/bash
yay -Syu
yay -S --needed --noconfirm -- < arch-pkgs.txt

read -p "kde, xfce or hyprland (choose one)" de
yay -S --needed --noconfirm -- < $de.txt

read -p "Install utility software? [y/N] " installUtils
if [[ "$installUtils" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    yay -S --needed --noconfirm -- < utils.txt
fi

read -p "Install zsh? [y/N] " installzsh
if [[ "$installUtils" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    yay -S --needed --noconfirm -- < zsh.txt
    chsh -s /bin/zsh
fi

git clone https://github.com/TheBlueRuby/dotfiles-arch.git

cp ./dotfiles-arch/.config/* ~/.config/
cp ./dotfiles-arch/.wezterm.lua ~/
cp ./dotfiles-arch/aliases.sh ~/
echo "To use aliases, add aliases.sh to your shell rc"
rm -r ./dotfiles-arch

echo "Place desktop-bg.png in ~/Pictures/"
