#!/bin/bash

pass= # password
COLOR_GREEN="\033[32;1m"
COLOR_PURPLE="\033[35;1m"
COLOR_RESET="\033[0m"
LF="\n"

echo -en ${COLOR_PURPLE}"*** REMOVE OLD KERNELS ***"${COLOR_RESET}
echo -e ${LF}

echo ${pass} | sudo -S tee
echo -en ${COLOR_GREEN}"******"${COLOR_RESET}
echo ""
echo -en ${LF}

curr_dir=$0
curr_dir=$(realpath $curr_dir)
curr_dir=$(dirname $curr_dir)
kern=${curr_dir}/old-kernels.sh

sudo ${kern}

exec $SHELL
