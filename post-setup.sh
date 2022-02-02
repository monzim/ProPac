#!/usr/bin/env bash

logo(){
echo ""
echo " ██▓███   ██▀███   ▒█████   ██▓███   ▄▄▄       ▄████▄  ";
echo "▓██░  ██▒▓██ ▒ ██▒▒██▒  ██▒▓██░  ██▒▒████▄    ▒██▀ ▀█  ";
echo "▓██░ ██▓▒▓██ ░▄█ ▒▒██░  ██▒▓██░ ██▓▒▒██  ▀█▄  ▒▓█    ▄ ";
echo "▒██▄█▓▒ ▒▒██▀▀█▄  ▒██   ██░▒██▄█▓▒ ▒░██▄▄▄▄██ ▒▓▓▄ ▄██▒";
echo "▒██▒ ░  ░░██▓ ▒██▒░ ████▓▒░▒██▒ ░  ░ ▓█   ▓██▒▒ ▓███▀ ░";
echo "▒▓▒░ ░  ░░ ▒▓ ░▒▓░░ ▒░▒░▒░ ▒▓▒░ ░  ░ ▒▒   ▓▒█░░ ░▒ ▒  ░";
echo "░▒ ░       ░▒ ░ ▒░  ░ ▒ ▒░ ░▒ ░       ▒   ▒▒ ░  ░  ▒   ";
echo "░░         ░░   ░ ░ ░ ░ ▒  ░░         ░   ▒   ░        ";
echo "            ░         ░ ░                 ░  ░░ ░      ";
echo "                                              ░        ";
echo "Script by: @monzim"
}


logo
echo ""
echo "Done!"
echo ">>> All this Packages Installed "
for i in $(cat `pwd`/pkg-files/pacman-pkgs.txt)
do
   echo "     $i"
done

for i in $(cat `pwd`/pkg-files/aur-pkgs.txt)
do
   echo "     $i"
done

for i in $(cat `pwd`/pkg-files/node-pkgs.txt)
do
   echo "     $i"
done
echo "     Flutter"

exit