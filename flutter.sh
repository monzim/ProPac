#!/usr/bin/env bash

echo -ne "
Installing Flutter from official repository...
"
echo ""
sudo chown -R $USER /var/lib
cd /var/lib
echo " > Cloning Flutter SDK"
echo ""
git clone https://github.com/flutter/flutter.git -b stable
echo ""
echo " > Adding Flutter PATH:`pwd`/flutter/bin"
export PATH="$PATH:`pwd`/flutter/bin"
cd
echo " > Post install FLutter"
echo ""
flutter doctor
echo ""
echo " > Flutter Install Complete"
echo ""

