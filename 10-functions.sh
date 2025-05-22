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

VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo "$2 installation is a success"
    else
        echo "Failure in installing $2"
        exit 1
    fi
}

SERVICE=$1
dnf list installed $SERVICE
if [ $? -ne 0 ]
then 
    dnf install $SERVICE -y
    VALIDATE $? $SERVICE
else
    echo "Alrady installed nth to do"
fi




