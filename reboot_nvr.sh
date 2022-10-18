#!/bin/bash
FILE=ip_list
mysql -h 10.8.0.25 -u vuelogix -pCarinov@123 -e "SELECT server_ip_wan from offsite.recording_server JOIN offsite.u_recording_server_status ON server_id=recording_server_id WHERE server_status='LOGOUT' AND status='LOGIN' AND is_disabled=0" 1> $FILE
tail -n +2 "$FILE" > "$FILE.tmp" && mv "$FILE.tmp" "$FILE"
while read -r host
do
  echo "$host"
  echo Restarting "$host" >> success.txt
  echo Restarting "$host" >> error.txt
  curl -i --fail -X PUT "admin:admin123@$host/ISAPI/System/reboot" --connect-timeout 5 1>> success.txt 2>> error.txt
  if [ $? -eq 0 ];then
    echo "The $host nvr_ip is sucessfully rebooted" >> success.txt
  else
    echo "The $host nvr_ip is not rebooted"  >> error.txt
  fi
done < "$FILE"
