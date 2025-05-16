#!/bin/bash

#conditional statements in bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "The user doesnt have root access"
    exit 1
else
    echo "The user has root axit can procceed for installation"
fi

SERVICE=$1
dnf list installed $SERVICE
if [ $? -ne 0 ]
then 
    dnf install $SERVICE -y
    if [ $? -eq 0 ]
    then
        echo "installation is a success"
    else
        echo "Failure"
        exit 1
    fi
else
    echo "Alrady installed nth to do"
fi




