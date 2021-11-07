#!/bin/bash

#additional signs
COLOR_GREEN="\033[32;1m"
COLOR_PURPLE="\033[35;1m"
COLOR_RESET="\033[0m"
CR_LF="\n"

#path to current dir and file
TARGET_FILE=$(dirname $(realpath "$0"))	#dir
TARGET_FILE=${TARGET_FILE}/usrpasswd	#file

#check if the file is absent and echo error
if ! [ -f $TARGET_FILE ]
then
    echo -e "Отсутствует необходимый файл записи..."
	sleep 1
	exit
fi

#decrypting password from file
ENCRYPTER=key_for_service
PASS=$(cat $TARGET_FILE | openssl enc -aes-256-cbc -md sha512 -a -d -pbkdf2 -iter 100000 \-salt -pass pass:ENCRYPTER)

#header
echo -en ${COLOR_PURPLE}"*** ОЧИСТКА ПАКЕТОВ ***"${COLOR_RESET}
echo -e ${CR_LF}

#auto password entering
echo $PASS | sudo -S tee
echo "ввод пароля..."
echo -en ${CR_LF}

#run apt update
echo -en ${COLOR_GREEN}"Запуск apt update..."${COLOR_RESET}${CR_LF}
sudo apt update
echo -en ${CR_LF}

#run apt autoclean
echo -en ${COLOR_GREEN}"Запуск apt autoclean..."${COLOR_RESET}${CR_LF}
sudo apt autoclean
echo -en ${CR_LF}

#run apt autoremove
echo -en ${COLOR_GREEN}"Запуск apt autoremove..."${COLOR_RESET}${CR_LF}
sudo apt autoremove
echo -en ${CR_LF}

#waighting for finish
echo -en ${COLOR_PURPLE}"Нажмите любую клавишу, чтобы закрыть окно..."${COLOR_RESET} ""
read -n 1 -r
exit