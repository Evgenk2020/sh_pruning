#!/bin/bash

COLOR_GREEN="\033[32;1m"
COLOR_PURPLE="\033[35;1m"
COLOR_CYAN="\033[96;1m"
COLOR_RESET="\033[0m"

CR_LF="\n"
CR_LF_DOUBLE="\n\n"

MAINPROG="*** ОБНОВЛЕНИЕ КОМПОНЕНТОВ ***"
HEAD1="Запуск apt update..."
HEAD2="Запуск apt upgrade..."
ASK="Выполнить обновление? <Y/N>"
FINISH="Нажмите любую клавишу, чтобы закрыть окно..."

BASEDIR=$(dirname $(realpath "$0"))
FILE=/pass.txt
PASS=$(<$BASEDIR$FILE)

echo -en ${COLOR_PURPLE}${MAINPROG}${CR_LF_DOUBLE}${COLOR_GREEN}${HEAD1}${COLOR_RESET}${CR_LF}
echo $PASS | sudo -S tee
sudo apt update
echo ""

echo -en ${COLOR_CYAN}${ASK}${COLOR_RESET} ""
read -n 1 -r

if [[ ! $REPLY =~ ^[Yy]$ ]]
then
	exit
fi

echo ""
echo -en ${CR_LF}

echo -en ${COLOR_GREEN}${HEAD2}${COLOR_RESET}${CR_LF}
sudo apt upgrade
echo ""

echo -en ${COLOR_PURPLE}${FINISH}${COLOR_RESET} ""
read -n 1 -r
exit
