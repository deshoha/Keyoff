#!/bin/bash
                                      
echo -e "\e[38;05;196m                              ##   ## "
echo "###  #                ###    # #  # # "
echo " #  #                #   #   #    #   "
echo " # #     ##  ## ##  #     # ###  ###  "
echo " ##     #  #  # #   #     #  #    #   "
echo " # #    ####  # #   #     #  #    #   "
echo " #  #   #      #     #   #   #    #   "
echo "###  ##  ###   #      ###   ###  ###  "
echo "             # #                      "
echo "             ##                       "
echo -e "\n[-_-] Created By De-Shoha.."
echo -e "[-_-] E-mail: deshoha@gmail.com \n\n\e[0m"

two=$(which notify-send)
installed=$(which xinput)
if [[ $installed == "/usr/bin/xinput" ]] && [[ $two == "/usr/bin/notify-send" ]]
then
cd
xinput > .xinpu_list.txt
cd 
echo "[*] Turning On your builtin keybord"
key_txt=$(cat .xinpu_list.txt| grep "AT Translated Set 2 keyboard")
echo $key_txt
sleep 1


cd
key_id_space=$(cat .xinpu_list.txt| grep "AT Translated Set 2 keyboard" | rev |cut -d "=" -f 1 | rev | cut -d "[" -f 1 | sed 's/ *$//g')
cd
master_no_not_tested=$(cat .xinpu_list.txt| grep "AT Translated Set 2 keyboard"  | rev | cut -d "[" -f 1 | rev | rev | cut -d "(" -f1 | rev | tr -d ")" | tr -d "]")

key_id=`echo $key_id_space | sed 's/ *$//g'`

cd
master_no=$(cat .master_no.txt)


re='^[0-9]+$'
if  [[ $master_no_not_tested =~ $re ]] ; then
   cd
   echo "[*] Your Key Bord Is Onn..\n[*] It was never turned off.."
   notify-send KeyOff  "Laptop's KeyBord Is On..It was never turned off.."
else
#Info	
	xinput reattach $key_id $master_no
	echo "[*] Done Turning On your KeyBord..."
	echo "[*] You can turn it off by typing 'keyoff or /opt/KeyOff/keyoff.sh'"
	notify-send KeyOff  "Laptop's KeyBord Has Been Turned On"
fi

else
echo "[*] Xinput Is not installed.."
echo "[*] Installing Xinput..."
sleep 1

sudo apt install xinput -y
sudo apt install libnotify-bin -y
echo -e "\n\n\n\n\n[*] Re run this  "
fi




