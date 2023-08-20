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

installed=$(which xinput)
two=$(which notify-send)


if [[ $installed == "/usr/bin/xinput" ]] && [[ $two == "/usr/bin/notify-send" ]]
then
cd 
xinput > .xinpu_list.txt
echo "[*] Turning Off your builtin keybord"
key_txt=$(cat .xinpu_list.txt| grep "AT Translated Set 2 keyboard")
echo $key_txt
sleep 1
#echo "Enter Your Key Bord id Number"

#read keyid;
cd
key_id_space=$(cat .xinpu_list.txt| grep "AT Translated Set 2 keyboard" | rev |cut -d "=" -f 1 | rev | cut -d "[" -f 1 | sed 's/ *$//g')
cd
master_no_not_tested=$(cat .xinpu_list.txt| grep "AT Translated Set 2 keyboard"  | rev | cut -d "[" -f 1 | rev | rev | cut -d "(" -f1 | rev | tr -d ")" | tr -d "]")

re='^[0-9]+$'
if  [[ $master_no_not_tested =~ $re ]] ; then
   cd
   echo "$master_no_not_tested" > .master_no.txt
fi




key_id=`echo $key_id_space | sed 's/ *$//g'`




xinput -float $key_id ;


if [[ $master_no_not_tested == "floating slave" ]] ; then
	echo "[*] Keybord Is Already Turned Off"
	notify-send KeyOff  "Laptop's Keybord is already turned off.. try: 'keyon or /opt/KeyOff/keyon.sh'"
else
	echo "[*] Done Turning Off"
	notify-send KeyOff  "Laptop's Keybord is off.. try: 'keyon or /opt/KeyOff/keyon.sh'"
	

fi

echo "[*] To Turn it on use :"
cd
master_no=$(cat .master_no.txt)
echo "[*] 'keyon Or /opt/KeyOff/keyon.sh'"
echo "[*] xinput reattach $key_id $master_no"




else
echo "[*] Xinput Is not installed.."
echo "[*] Installing Xinput..."
sleep 1

sudo apt install xinput -y
sudo apt install libnotify-bin -y
echo -e "\n\n\n\n\n[*] Re run this  "
fi
