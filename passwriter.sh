#!/bin/bash

#additional signs
COLOR_PURPLE="\033[35;1m"
COLOR_RESET="\033[0m"
CR_LF="\n"

#path to current dir and file
CURR=$(realpath "$0")
CURR=$(dirname $CURR)

TARGET_FILE=${CURR}/usrpwd #file
KEY_FILE=${CURR}/usrkey #file

#check if the file is present and remove it
if [ -f $TARGET_FILE ] || [ -f $KEY_FILE ]
then
    rm -rf $TARGET_FILE
    rm -rf $KEY_FILE
fi

#header
echo -en ${COLOR_PURPLE}"*** ЗАПИСЬ ПАРОЛЯ ПОЛЬЗОВАТЕЛЯ ***"${COLOR_RESET}
echo -e ${CR_LF}

#enter password with * on screen instead
PASSWD=""
echo -n "Введите пароль пользователя: "
while
    read -s -n1 BUFFER
    [[ -n $BUFFER ]]
do
    if [ "$BUFFER" = $'\177' ]
    then
        PASSWD=""
        echo -en '\n'
        echo "password is null"
        echo -n "Введите ноовый пароль пользователя: "
    else
        PASSWD=$PASSWD$BUFFER
        echo -n '#'
    fi
done

#encrypting password into file
ENCRYPTER=$(openssl rand -base64 32)   #encrypt key
echo $PASSWD | openssl enc -aes-256-cbc -md sha512 -a -pbkdf2 -iter 100000 -salt -pass pass:ENCRYPTER > $TARGET_FILE
echo $ENCRYPTER > $KEY_FILE
chmod 600 $TARGET_FILE
chmod 600 $KEY_FILE
echo -e ${CR_LF}

#waighting for finish
echo -en ${COLOR_PURPLE}"Готово. Нажмите любую клавишу..."${COLOR_RESET}
read -n 1 -r
exit
