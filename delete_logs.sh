#!/bin/bash

Source_Dir="/home/ec2-user/app-logs"
Files_Delete=$(find $Source_Dir -name "*.log" -mtime +14)

while IFS= read -r filepath
do 
rm -rf $filepath
done <<<$Files_Delete