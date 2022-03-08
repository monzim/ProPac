#!/usr/bin/env bash
logo(){
echo "╔╗ ╔═╗╔═╗╦ ╦╔╦╗";
echo "╠╩╗╚═╗╠═╝║║║║║║";
echo "╚═╝╚═╝╩  ╚╩╝╩ ╩";
echo "    ProPac     ";
echo "Script by: @monzim"
}

addAUR () {
    echo " >> Installing $1"
    cd ~
    cd Downloads/
    mkdir AurPackage
    cd AurPackage/
    git clone "https://aur.archlinux.org/$1.git"
    cd `pwd`/$1
    makepkg -si --noconfirm
    echo " >> $1 Installed"
    echo ""
    cd ..
}

bspwmConfig(){
    cd ~
    mkdir .config
    git clone -b test https://github.com/Monzim/dotfiles
    cd dotfiles
    stow bspwm
    stow sxhkd
    stow zsh
    stow kitty
    stow polybar
    stow zsh
    cd ~
}


echo -ne "
-------------------------------------------------------------------------
                    Installing pacman Packages  
-------------------------------------------------------------------------
"
cat `pwd`/pkg-files/pacman-pkgs.txt | while read line 
do
    echo " >> INSTALLING: ${line}"
    sudo pacman -S --noconfirm --needed ${line}
    echo " >> ${line} installed"
    echo ""
done

echo -ne "
-------------------------------------------------------------------------
                    Installing AUR Packages  
-------------------------------------------------------------------------
"

for i in $(cat `pwd`/pkg-files/aur-pkgs.txt)
do
   addAUR $i
done

echo -ne "
-------------------------------------------------------------------------
Configuring BSPWM
-------------------------------------------------------------------------
"
bspwmConfig
sudo systemctl enable lightdm.service