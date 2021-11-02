#!/bin/bash

COLOR_GREEN="\033[32;1m"
COLOR_PURPLE="\033[35;1m"
COLOR_RESET="\033[0m"

CR_LF="\n"
CR_LF_DOUBLE="\n\n"

MAINPROG="*** ОЧИСТКА ПАКЕТОВ ***"
CLEAN="Запуск dnf clean all..."
AUTOREMOVE="Запуск dnf autoremove..."
FINISH="Нажмите любую клавишу, чтобы закрыть окно..."

BASEDIR=$(dirname $(realpath "$0"))
FILE=/pass.txt
PASS=$(<$BASEDIR$FILE)

echo -en ${COLOR_PURPLE}${MAINPROG}${CR_LF_DOUBLE}

echo -en ${COLOR_GREEN}${CLEAN}${COLOR_RESET}${CR_LF}
echo $PASS | sudo -S tee
echo "ввод пароля..."
sudo dnf clean all
echo ""

echo -en ${COLOR_GREEN}${AUTOREMOVE}${COLOR_RESET}${CR_LF}
sudo dnf autoremove
echo ""

echo -en ${COLOR_PURPLE}${FINISH}${COLOR_RESET} ""
read -n 1 -r
exit
