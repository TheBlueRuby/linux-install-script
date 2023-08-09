#!/bin/bash
read "What AUR helper would you like to use? (install first!)" AUR_HELPER

$AUR_HELPER -Syu

$AUR_HELPER -S --needed --noconfirm -- "$(cat arch-pkgs)"

read "kde, xfce or hyprland (choose one) " de
$AUR_HELPER -S --needed --noconfirm -- "$(cat $de.txt)"

read -p "Install utility software? [y/N] " installUtils
if [[ "$installUtils" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    $AUR_HELPER -S --needed --noconfirm -- "$(cat utils.txt)"
fi

read -p "Install zsh? [y/N] " installzsh
if [[ "$installUtils" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    $AUR_HELPER -S --needed --noconfirm -- "$(cat zsh.txt)"
    chsh -s /bin/zsh
fi

git clone https://github.com/TheBlueRuby/dotfiles-arch.git

cp -r ./dotfiles-arch/.config/* ~/.config/
cp ./dotfiles-arch/.wezterm.lua ~/
rm -rf ./dotfiles-arch

echo "Place desktop-bg.png in ~/Pictures/"
