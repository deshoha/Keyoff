#!/bin/bash
echo "[*] Moving FIles TO /opt"
dirr=$(cd .. && pwd)
#echo $dirr
cd $dirr
sudo cp -rf  KeyOff /opt
echo -e "[*] Done Setup .. \n[*] Run '/opt/KeyOff/keyoff.sh' To Turn of your keybord.. \n[*] Run '/opt/KeyOff/keyon.sh' TO Turn on your Keybord"
