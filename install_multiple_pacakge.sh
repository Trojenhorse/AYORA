#/usr/bin/env bash

if [[ $# -eq 0 ]]           # $# is the command line argument
then
    echo "you must enter the package name along with the script to run as shown below:"
    echo " $0 <PACKAGE NAME1> <PACKAGE NAME2>"
    exit 1
fi


if [[ $(id -u) -ne 0 ]]    #userid is 0 for rootuser
then
    echo "WARNING!! you can run this script as a root user or with sudo previlrges"
    exit 2
fi


for choosed_pkg in $@
do
  if which $choosed_pkg &>/dev/null
 then
   echo "$choosed_pkg has been already installed"
 else
   echo "installing $choosed_pkg..."
   apt-get install $choosed_pkg -y &>/dev/null
   if [[ $? -eq 0 ]]
   then
      echo "hurray!! $choosed_pkg has been sucessfully installed"
   else
      echo -e "unable to install $choosed_pkg package,\n so we can figure it out why it is not installing, let install the package on screen"
      apt-get install $choosed_pkg -y
   fi
fi
done


