#!/bin/bash
a=$(ps -ef | grep "sleep" | grep -v "grep" | awk '{print $2}' | xargs -I{} kill {})
for i in $a
do
  echo "KILLING ALL SLEEPING PROCESS!! PLEASE WAIT....."
  echo  $i
  echo
  echo "ALL SLEEPING PROCESS HAVE BEEN KILLED"
done

