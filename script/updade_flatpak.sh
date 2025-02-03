#!/bin/bash

pass= # password
COLOR_GREEN="\033[32;1m"
COLOR_PURPLE="\033[35;1m"
COLOR_CYAN="\033[96;1m"
COLOR_RESET="\033[0m"
LF="\n"

echo -en ${COLOR_PURPLE}"*** FLATPAK UPDATE ***"${COLOR_RESET}
echo -e ${LF}

echo ${pass} | sudo -S tee
echo -en ${COLOR_GREEN}"******"${COLOR_RESET}
echo ""
echo -en ${LF}

echo -en ${COLOR_CYAN}"Start update? <Y/N>"${COLOR_RESET} ""
read -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
	echo ""
	echo -en ${COLOR_GREEN}"cancell..."${COLOR_RESET}
	sleep 1
	exit
fi
echo -e ${LF}

echo -en ${COLOR_GREEN}"Run flatpak updade..."${COLOR_RESET}${LF}
sudo flatpak update
echo -en ${LF}

echo -en ${COLOR_PURPLE}"Press any key to close terminal..."${COLOR_RESET} ""
read -s -n 1 -r
exit
