#!/bin/bash
###########################################
#Author:  Muhamed Maqbool
#Date:  Sunday 25 September 2022 10:57:56 PM IST
#Description:  script to add record to database
#Modified:  Sunday 25 September 2022 10:57:56 PM IST
###########################################

echo "Enter the hostname you want to add on database:"
read hostname
          grep -q $hostname /home/maqbool/SHELLSCRIPTS/testscript/imranafzal/database
          if [ $? -eq 0 ]
          then
             echo "ERROR--> the entered hostname is already exist"
             exit 0
          fi

echo "Enter the ip address you want to add on database for the hostname:"
read ipaddress
          grep -q $ipaddress /home/maqbool/SHELLSCRIPTS/testscript/imranafzal/database
          if [ $? -eq 0 ]
          then
             echo "ERROR--> the entered ip address is already exist"
             exit 1
          fi
echo "Enter the description for the hostname:"
read description
       echo "HURRAY!! SUCESSFULLY ADDED TO THE DATABASE"
       echo  $hostname $ipaddress $description >> database
