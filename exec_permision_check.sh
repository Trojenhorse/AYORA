#/usr/bin/env bash

#[[ -x rootornotttt.txt ]] &&  echo "rootornotttt.txt file have execution permission" || echo "rootornotttt.txt have no execution permission"


#if [[ -x rootornotttt.txt ]]
#then
#    echo "rootornotttt.txt file have execution permission"
#else
#    echo "rootornotttt.txt have no execution permission"
#fi

<< commented
for maqbool in rootornotttt.txt case.sh
do
  if [[ -x rootornotttt.txt ]]
  then
    echo "$maqbool file have execution permission"
  else
    echo "$maqbool have no execution permission"
  fi
done
commented



<< commented
for maqbool in $(ls)
do
  if [[ -x rootornotttt.txt ]]
  then
    echo "$maqbool file have execution permission"
  else
    echo "$maqbool have no execution permission"
  fi
done
commented









if [[ $# -ne 1 ]]
then
    echo "Warning!!  This script is to find execution permission for your prefered file, so you have to mention the file path within the script as shown below:"
    echo " USAGE: $0 <file path as your preference>"
    exit 1
fi


path=$1
for maqbool in $(ls $path) 
do
  if [[ -x rootornotttt.txt ]]
  then
    echo "$maqbool file have execution permission"
  else
    echo "$maqbool have no execution permission"
  fi
done

