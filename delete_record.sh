#!/bin/bash
###########################################
#Author:  Muhamed Maqbool
#Date:  Sunday 25 September 2022 10:59:12 PM IST
#Description:  script to delete record from database
#Modified:  Sunday 25 September 2022 10:59:12 PM IST
###########################################
echo "Enter the hostname or ip that you want to remove from databse"
read delete
          grep -q $delete /home/maqbool/SHELLSCRIPTS/testscript/imranafzal/database
          if [ $? -eq 0 ]
          then
            sed -i '/'$delete'/d' /home/maqbool/SHELLSCRIPTS/testscript/imranafzal/database
            echo "HURRAY!! SUCESSFULLY DELETED FROM THE DATABASE"
          else
            echo "The Entered hostname or ip is not found in DATABASE"
          fi
