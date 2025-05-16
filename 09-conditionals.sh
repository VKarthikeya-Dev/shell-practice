#!/bin/bash

#conditional statements in bash

USERID=$(id -u)

if [ $? -ne 0 ]
then
    echo "The user doesnt have root access"
    exit 1
else
    echo "The user has root axit can procceed for installation"
fi

dnf install mysql -y

if [ $? -ne 0 ]
then
    echo "installation is a success"
else
    echo "Failure"
    exit 1
fi



