#!/bin/bash
<< com
if [ $# -ne 1 ]
   then
     echo "THIS SCRIPT IS USED TO FIND THE INTERNET CONNECTIVITY"
     echo "you can only run the script by mentioning ip address along with the script as shown below:"
     echo " $0 <ip address> "
     exit 1
fi


hosts=$1
ping -c1 $host &> /dev/null               #c1 means to ping once (c1 means count1)
	if [ $? -eq 0 ]
        then
           echo "$hosts has internet connectivity"
        else
           echo "$hosts has no internet connectivity"
        fi
com




iplist="/home/maqbool/SHELLSCRIPTS/IMP_SHELL/iplist"
if [ ! -e "${iplist}" ]
    then
      echo "unable to run the script"
      echo "create a file named iplist in the path (/home/maqbool/SHELLSCRIPTS/IMP_SHELL) and mention the ips that needed to ping in that file so, then retry"
      exit 2
fi

for ip in $(cat $iplist)
do
	ping -c1 $ip &> /dev/null               #c1 means to ping once (c1 means count1)
        if [ $? -eq 0 ]
        then
           echo "$ip has internet connectivity"
        else
           echo "$ip has no internet connectivity"
        fi
done

