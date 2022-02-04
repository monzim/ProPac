#!/usr/bin/env bash
logo(){
echo "╔═╗┬─┐┌─┐╔═╗┌─┐┌─┐";
echo "╠═╝├┬┘│ │╠═╝├─┤│  ";
echo "╩  ┴└─└─┘╩  ┴ ┴└─┘";

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

addNodePackage () {
  cd ~
  echo " >> Installing $1"
  npm install -g $1
  echo " >> $1 Installed"
  echo ""
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
                    Installing node Packages  
-------------------------------------------------------------------------
"

for i in $(cat `pwd`/pkg-files/node-pkgs.txt)
do
   addNodePackage $i
    echo "F"
done
echo -ne "
-------------------------------------------------------------------------
                    Flutter  
-------------------------------------------------------------------------
"
`pwd`/flutter.sh
