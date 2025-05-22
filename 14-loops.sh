#!/bin/bash


USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOG_FOLDER="/var/log/shell-log"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"
PACKAGES=("mysql" "nginx" "python3" "httpd")

mkdir -p $LOG_FOLDER
 
echo "The script started execution at $(date)" | tee -a $LOG_FILE



if [ $USERID -ne 0 ]
then
    echo -e "$R The user doesnt have root access $N" | tee -a $LOG_FILE
    exit 1
else
    echo -e "$G The user has root axit can procceed for installation $N" | tee -a $LOG_FILE
fi

VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo -e "$G $2 installation is a success $N" | tee -a $LOG_FILE
    else
        echo -e "$R Failure in installing $2 $N"| tee -a $LOG_FILE
    fi
}

for package in ${PACKAGES[@]}
do
    dnf list installed $package &>>$LOG_FILE
if [ $? -ne 0 ]
then 
    dnf install $package -y &>>$LOG_FILE
    VALIDATE $? $package
else
    echo -e "$Y Alrady installed nth to do $N" | tee -a $LOG_FILE
fi
done







