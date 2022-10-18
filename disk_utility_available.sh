#!/usr/bin/env bash

#MailID="muhamedmaqbool412@gmail.com"
#echo -e "The disk space utilization on $(hostname) is : \n $(df -h | grep -Ev "udev|tmpfs")" | /usr/bin/mail -s  "File system utilization" "$MailID"




Mail="muhamedmaqbool412@gmail.com"
cur_disk=$(df -h | grep /dev/nvme0n1p2 | awk '{print $5 }' | tr -d "%")
if [[ $cur_disk -gt 80 ]]
then
    echo -e "warning!!! your disk space is high.\nYour files system /dev/nvme0n1p2 usage is : $cur_disk" | /usr/bin/mail -s "file system utilization alert" "$Mail"
fi
