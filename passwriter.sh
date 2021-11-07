#!/bin/bash

#additional signs
COLOR_PURPLE="\033[35;1m"
COLOR_RESET="\033[0m"
CR_LF="\n"

#path to current dir and file
TARGET_FILE=$(dirname $(realpath "$0")) #dir
TARGET_FILE=${TARGET_FILE}/usrpasswd #file

#check if the file is present and remove it
if [ -f $TARGET_FILE ]
then
    rm -rf $TARGET_FILE
fi

#header
echo -en ${COLOR_PURPLE}"*** ЗАПИСЬ ПАРОЛЯ ПОЛЬЗОВАТЕЛЯ ***"${COLOR_RESET}
echo -e ${CR_LF}

#enter password with * on screen instead
PASSWD=""
echo -n "Введите пароль пользователя: "
while
read -s -n1 BUFF
[[ -n $BUFF ]]
do
    PASSWD=$PASSWD$BUFF
    echo -n "$"
done

#encrypting password into file
ENCRYPTER=key_for_service    #encrypt key
echo $PASSWD | openssl enc -aes-256-cbc -md sha512 -a -pbkdf2 -iter 100000 \-salt -pass pass:ENCRYPTER > $TARGET_FILE
echo -e ${CR_LF}

#waighting for finish
echo -en ${COLOR_PURPLE}"Готово. Нажмите любую клавишу..."${COLOR_RESET}
read -n 1 -r
exit