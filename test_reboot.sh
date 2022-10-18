#!/usr/bin/env bash
FILE=ip_list
mysql -h 10.8.0.25 -u vuelogix -pCarinov@123 -e "SELECT server_ip_wan from offsite.recording_server JOIN offsite.u_recording_server_status ON server_id=recording_server_id WHERE server_status='LOGOUT' AND status='LOGIN' AND is_disabled=0" 1> $FILE
tail -n +2 "$FILE" > "$FILE.tmp" && mv "$FILE.tmp" "$FILE"
while read -r host
do
  echo -e Restarting "\033[1;32m$host\033[1;32m"
  curl -i --fail -X PUT "admin:admin123@$host/ISAPI/System/reboot" --connect-timeout 5
  if [ $? -eq 0 ];
  then
    echo "The $host nvr_ip is sucessfully rebooted" >> sucess_nvr.txt
  else
    echo "The $host nvr_ip is not rebooted"  >> error_nvr.txt
  fi
done < "$FILE"
