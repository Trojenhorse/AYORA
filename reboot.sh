#/usr/bin/env bash

x=$(mysql -h10.8.0.25 -uvuelogix -pcarinov@123 -e "SELECT server_ip_wan from offsite.recording_server JOIN offsite.u_recording_server_status ON server_id=recording_server_id WHERE server_status='LOGOUT' AND status='LOGIN' AND is_disabled=0" > iplist.txt)
for host in $(< x );
do
   echo -e "\033[0;31mrebooting $host\033[0;31m"
   curl -i --fail -X PUT "admin:admin123@$host/ISAPI/System/reboot" --connect-timeout 5
    if [ $? -eq 0 ]
    then
       echo "The $host nvr_ip is sucessfully rebooted" >> sucess.txt
    else
       echo "The $host nvr_ip is not rebooted"  >> error.txt
    fi
done

