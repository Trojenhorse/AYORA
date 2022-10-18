#!/bin/bash
echo "Please provide a username?"
read u
echo

grep -q $u /etc/passwd
        if [ $? -eq 0 ]
        then
        echo ERROR -- User $u already exist
        echo Please choose another username
        echo
        exit 0
        fi


echo "Please provide user description?"
read d
echo

echo "do you need to add user id (y/n)?"
read ynu
echo
         if [ $ynu == y ]
         then
         echo "enter uid number"
         read uid
                grep -q $uid /etc/passwd
                if [ $? -eq 0 ]
                then
                echo "the entered user id is already exist try another one"
                echo
                exit 1
                else
                useradd $u -c "$d" -u $uid
                echo "$u account has been created"
                fi
          elif [ $ynu == n ]
          then
             echo "No worries we will assign a UID"
             useradd $u -c "$d"
             echo
             echo "$u account has been created"
          fi
