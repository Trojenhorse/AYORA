#/bin/bash
#uasge:to understand continue in loop

<< com
for loop in $(seq 1 15)
do
  if [[ $loop -gt 5 ]]
  then
     break
     echo "$loop is started"
  fi
done
com

<< com
for loop in $(seq 1 15)
do
  if [[ $loop -ne 5 ]]
  then 
     echo "$loop is started"
  fi
done
com


for loop in $(seq 1 15)
do
  if [[ $loop -eq 5 ]]
  then
     continue
     echo "$loop is started"
  fi
done
echo "finished"





