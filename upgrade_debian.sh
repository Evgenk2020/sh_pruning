#!/bin/bash

#additional signs
COLOR_GREEN="\033[32;1m"
COLOR_PURPLE="\033[35;1m"
COLOR_CYAN="\033[96;1m"
COLOR_RESET="\033[0m"
CR_LF="\n"

#path to current dir and file
BASEDIR=$(dirname $(realpath "$0"))
FILE=/usrpasswd

#final target path
PASS_TARGET=$BASEDIR$FILE

#check if the file is absent and echo error
if ! [ -f $PASS_TARGET ]
then
    echo -e "Отсутствует необходимый файл записи..."
	sleep 1
	exit
fi

#decrypting password from file
ENCRYPTER=key_for_service
PASS=$(cat $PASS_TARGET | openssl enc -aes-256-cbc -md sha512 -a -d -pbkdf2 -iter 100000 \-salt -pass pass:ENCRYPTER)

#header
echo -en ${COLOR_PURPLE}"*** ОБНОВЛЕНИЕ КОМПОНЕНТОВ ***"${COLOR_RESET}
echo -e ${CR_LF}

#auto password entering
echo $PASS | sudo -S tee
echo "ввод пароля..."
echo -en ${CR_LF}

#updating apr repository
echo -en ${COLOR_GREEN}"Запуск apt update..."${COLOR_RESET}${CR_LF}
sudo apt update
echo -en ${CR_LF}

#ask to run update
echo -en ${COLOR_CYAN}"Выполнить обновление? <Y/N>"${COLOR_RESET}" "
read -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
	exit
fi
echo -e ${CR_LF}

#starting apt upgrade
echo -en ${COLOR_GREEN}"Запуск apt upgrade..."${COLOR_RESET}${CR_LF}
sudo apt upgrade
echo -en ${CR_LF}

#waighting for finish
echo -en ${COLOR_PURPLE}"Нажмите любую клавишу, чтобы закрыть окно..."${COLOR_RESET} ""
read -n 1 -r
exit
