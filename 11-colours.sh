#!/bin/bash

#colours

#echo -e "\e[31m Hello world \e[0m" # -e is for enabling the colours and the syntax is \e[<style><colour>m
#echo -e "Hello no colour"

#!/bin/bash

#conditional statements in bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"



if [ $USERID -ne 0 ]
then
    echo -e "$R The user doesnt have root access $N"
    exit 1
else
    echo -e "$G The user has root axit can procceed for installation $N"
fi

VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo -e"$G $2 installation is a success $N"
    else
        echo -e"$R Failure in installing $2 $N"
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
    echo -e"$Y Alrady installed nth to do $N"
fi




