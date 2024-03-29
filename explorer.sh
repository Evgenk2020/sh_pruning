#!/bin/bash

#additional signs
COLOR_PURPLE="\033[35;1m"
COLOR_RESET="\033[0m"
CR_LF="\n"

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
echo -en ${COLOR_PURPLE}"*** ФАЙЛОВЫЙ МЕНЕДЖЕР ***"${COLOR_RESET}
echo -e ${CR_LF}

#run nautilus file browser using superuser mode
echo $PASS | sudo -S tee
echo "ввод пароля..."
sudo nautilus
