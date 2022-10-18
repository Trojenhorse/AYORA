#/usr/bin/env bash

read -p "proceed the confirmation before starting docker: (yes/no)" cnf
#if [[ $cnf == yes || $cnf == y ]]
if [[ $cnf =~ yes|y ]] 
then
    echo "starting the docker service.."
    sleep 1
    sudo systemctl start docker
    echo "docker service have started sucessfully"
else
    if [[ $cnf == no ]] || [[ $cnf == n ]]
    then
    echo "ok cancelled the conformation"
    fi
fi



<< maqqu
read -p "Enter the number:" num
if [[ $num -ge 50 ]] 
then
   echo "you have entered the number $num"
   echo "$num is greater than 50"
else
   echo "you have entered the number $num"
   echo "$num is lesser than 50"
fi
maqqu

<< maqqu
read -p "Enter the number:" num
if [[ $num -ge 50 ]] && [[ $num -le 100 ]]
then
   echo "you have entered the number $num"
   echo "$num is between 50 and 100"
else
   echo "you have entered the number $num"
   echo "$num is not between 50 and 100"
fi
maqqu
