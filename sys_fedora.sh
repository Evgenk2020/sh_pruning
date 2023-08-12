#!/bin/bash

#additional signs
COLOR_GREEN="\033[32;1m"
COLOR_PURPLE="\033[35;1m"
COLOR_RESET="\033[0m"
LF="\n"

#path to current dir and file
CURR=$(realpath "$0")
CURR=$(dirname $CURR)

TARGET_FILE=${CURR}/usrpwd	#file
KEY_FILE=${CURR}/usrkey #file

#check if the file is absent and echo error
if ! [ -f $TARGET_FILE ] || ! [ -f $KEY_FILE ]
then
    echo -e "Отсутствует необходимый файл записи..."
	sleep 1
	exit
fi

#decrypting password from file
ENCRYPTER=$(cat $KEY_FILE)
PASS=$(cat $TARGET_FILE | openssl enc -aes-256-cbc -md sha512 -a -d -pbkdf2 -iter 100000 -salt -pass pass:ENCRYPTER)

#header
echo -en ${COLOR_PURPLE}"*** ОЧИСТКА ПАКЕТОВ ***"${COLOR_RESET}
echo -e ${LF}

#auto password entering
echo $PASS | sudo -S tee
echo "ввод пароля..."
echo -en ${LF}

#run dnf clean
echo -en ${COLOR_GREEN}"Запуск dnf clean all..."${COLOR_RESET}${LF}
sudo dnf clean all
echo -en ${LF}

#run dnf autoremove
echo -en ${COLOR_GREEN}"Запуск dnf autoremove..."${COLOR_RESET}${LF}
sudo dnf autoremove
echo -en ${LF}

#waighting for finish
echo -en ${COLOR_PURPLE}"Нажмите любую клавишу, чтобы закрыть окно..."${COLOR_RESET} ""
read -n 1 -r
exit
