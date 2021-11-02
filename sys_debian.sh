#!/bin/bash

COLOR_GREEN="\033[32;1m"
COLOR_PURPLE="\033[35;1m"
COLOR_RESET="\033[0m"

CR_LF="\n"
CR_LF_DOUBLE="\n\n"

MAINPROG="*** ОЧИСТКА ПАКЕТОВ ***"
UPDATE="Запуск apt update..."
AUTOCLEAN="Запуск apt autoclean..."
AUTOREMOVE="Запуск apt autoremove..."
FINISH="Нажмите любую клавишу, чтобы закрыть окно..."

BASEDIR=$(dirname $(realpath "$0"))
FILE=/pass.txt
PASS=$(<$BASEDIR$FILE)

echo -en ${COLOR_PURPLE}${MAINPROG}${CR_LF_DOUBLE}${COLOR_GREEN}${UPDATE}${COLOR_RESET}${CR_LF}
echo $PASS | sudo -S tee
sudo apt update
echo ""

echo -en ${COLOR_GREEN}${AUTOCLEAN}${COLOR_RESET}${CR_LF}
sudo apt autoclean
echo ""

echo -en ${COLOR_GREEN}${AUTOREMOVE}${COLOR_RESET}${CR_LF}
sudo apt autoremove
echo ""

echo -en ${COLOR_PURPLE}${FINISH}${COLOR_RESET} ""
read -n 1 -r
exit
