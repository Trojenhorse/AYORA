#!/bin/bash
###########################################
#Author:  Muhamed maqbool
#Date:  Monday 26 September 2022 05:07:58 PM IST
#Description:  script to make adding and deleting of database script more easier
#Modified:  Monday 26 September 2022 05:07:58 PM IST
###########################################
echo "SELECT ANY OF THE BELOW OPTION TO DEPLOYYY!!!"
echo
echo "1)adding record on database"
echo "2)deleting record from database"
read HURRAY
echo
echo "you have selected $HURRAY option"
echo
case $HURRAY in
     1)  /home/maqbool/SHELLSCRIPTS/testscript/imranafzal/add_record.sh
       ;;
     2)  /home/maqbool/SHELLSCRIPTS/testscript/imranafzal/delete_record.sh
       ;;
     *) echo "The entered option is invalid"
        echo "either choose option 1 or 2"
       ;;
esac
