#!/bin/bash
read "What AUR helper would you like to use? (install first!)" AUR_HELPER

$AUR_HELPER -Syu

cat arch-pkgs.txt | while read pkg
do
	$AUR_HELPER -S --needed --noconfirm -- $pkg
done

read "kde, xfce or hyprland (choose one) " de
cat $de.txt | while read pkg
do
	$AUR_HELPER -S --needed --noconfirm -- $pkg
done

read -p "Install utility software? [y/N] " installUtils
if [[ "$installUtils" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    cat utils.txt | while read pkg
    do
    	$AUR_HELPER -S --needed --noconfirm -- $pkg
    done
fi

read -p "Install zsh? [y/N] " installzsh
if [[ "$installUtils" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    cat zsh.txt | while read pkg
    do
    	$AUR_HELPER -S --needed --noconfirm -- $pkg
    done
    chsh -s /bin/zsh
fi

git clone https://github.com/TheBlueRuby/dotfiles-arch.git

cp -r ./dotfiles-arch/.config/* ~/.config/
cp ./dotfiles-arch/.wezterm.lua ~/
rm -rf ./dotfiles-arch

echo "Place desktop-bg.png in ~/Pictures/"
