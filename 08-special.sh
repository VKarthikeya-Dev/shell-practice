#!/bin/bash

echo "Pass all variables to the script $@"
echo "Number of variables passed to the script $#"
echo "The Current directory of the script $PWD"
echo "The Home directory of the current user running the script $USER"
echo "The PID of the script executed $$"
sleep 10 &
echo "The PID of the last command in background $!"
echo "The last echo command exit status $?"