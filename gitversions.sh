#/bin/bash
GIT_VERS_URL="https://mirrors.edge.kernel.org/pub/software/scm/git/"
GIT_VERS_FILE="git_vers_info.html"
 if [ -e "${GIT_VERS_FILE}" ]
 then
    echo "$(date): Found old ${GIT_VERS_FILE}.Deleting this old file and downloading new content.Please wait..."
    rm -rf ${GIT_VERS_FILE}
 else
    echo "$(date): Downloading git vers info. Please wait..."
 fi
 which wget 1>/dev/null 2>&1
 if [ $? -ne 0 ]
 then
   echo "$(date): Sorry unable to download , wget command is not installed on this host. Please install it and retry"
   exit 2
 fi
 wget ${GIT_VERS_URL} --output-document=${GIT_VERS_FILE} 1>/dev/null 2>&1
 if [ $? -ne 0 ]
 then
   echo "$(date): Unable to download. Please try the below command manually and verify"
   echo "$(date): wget ${GIT_VERS_URL} --output-document=${GIT_VERS_FILE}"
 else
   echo "$(date): Successfully downloaded git vers info from git-scm and stored the info into a file: ${GIT_VERS_FILE}"
 fi

  if [ ! -e ${GIT_VERS_FILE} ]
  then
    echo "$(date): Unable to find the ${GIT_VERS_FILE}"
  fi
    echo "$(date): Sorting git versions. Please wait..."
  while read line
  do
git_vers+=($(echo $line | sed -n '/git-\([0-9]\+\.\)\+tar.gz/p' | awk -F '"' '{print $2}'| cut -c 5- | awk -F ".tar.gz" '{print $1}'))
done < ${GIT_VERS_FILE}
  #echo ${#git_vers[@]}
  #prheader
  #prtxtCentre
  echo "$(date): Displaying all available git versions"
  cnt=0
  no_vers=${#git_vers[*]}
  WIDTH=14
  #prHeader "="
  for each_ver in ${git_vers[*]}
  do
   printf "%-*s %-*s %-*s %-*s %-*s %-*s %-*s %-*s\n" $WIDTH  ${git_vers[$cnt]}  $WIDTH ${git_vers[$((cnt+1))]} $WIDTH ${git_vers[$((cnt+2))]} $WIDTH ${git_vers[$((cnt+3))]} $WIDTH  ${git_vers[$((cnt+4))]} $WIDTH  ${git_vers[$((cnt+5))]}  $WIDTH  ${git_vers[$((cnt+6))]} $WIDTH  ${git_vers[$((cnt+7))]}
   cnt=$((cnt+8))
   if [ $cnt -ge $no_vers ]
   then
     break
   fi
  done
  #prHeader "_"

