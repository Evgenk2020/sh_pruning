#!/bin/bash

pass= # password
COLOR_GREEN="\033[32;1m"
COLOR_PURPLE="\033[35;1m"
COLOR_RESET="\033[0m"
LF="\n"

echo -en ${COLOR_PURPLE}"*** PACKAGE CLEAN ***"${COLOR_RESET}
echo -e ${LF}

echo ${pass} | sudo -S tee
echo -en ${COLOR_GREEN}"******"${COLOR_RESET}
echo ""
echo -en ${LF}

echo -en ${COLOR_GREEN}"Start dnf clean all..."${COLOR_RESET}${LF}
sudo dnf clean all
echo -en ${LF}

echo -en ${COLOR_GREEN}"Start dnf autoremove..."${COLOR_RESET}${LF}
sudo dnf autoremove
echo -en ${LF}

echo -en ${COLOR_PURPLE}"Press any key to close terminal..."${COLOR_RESET} ""
read -s -n 1 -r
exit
