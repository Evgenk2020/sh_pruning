#!/bin/bash

COLOR_PURPLE="\033[35;1m"
COLOR_GREEN="\033[32;1m"
COLOR_RESET="\033[0m"
CR_LF="\n"
CR_LF_DOUBLE="\n\n"

ENCRYPTER=secret
BASEDIR=$(dirname $(realpath "$0"))
FILE=/usrpasswd.txt

PASS_TARGET=$BASEDIR$FILE

if [ -f $PASS_TARGET ]
then
    rm -rf $PASS_TARGET
fi

echo -en ${COLOR_PURPLE}"*** ЗАПИСЬ ПАРОЛЯ ПОЛЬЗОВАТЕЛЯ ***"${COLOR_RESET}${CR_LF_DOUBLE}
read -sp "Введите пароль пользователя: " PASSWD

echo $PASSWD | openssl enc -aes-256-cbc -md sha512 -a -pbkdf2 -iter 100000 \-salt -pass pass:ENCRYPTER > $PASS_TARGET
echo -e ${CR_LF}

echo -en ${COLOR_GREEN}"Готово. Нажмите любую клавишу..."${COLOR_RESET}
read -n 1 -r
exit