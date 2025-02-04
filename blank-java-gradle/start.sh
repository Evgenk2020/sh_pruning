#!/bin/bash

echo "Make a workpiece for your Java gradle project"
echo ""

gradle init --type java-application

echo ""
chmod -x start.sh
ls

exec $SHELL
