#/usr/bin/env bash
<< com
while read f1 f2 f3 f4
do
  echo "$f1"
done < test.txt


while IFS="," read f1 f2 f3 f4
do
  echo "$f1 $f4"
done < test.txt
com

OLD_IFS=$IFS
cat test.txt | awk 'NR!=1 {print}' | while IFS="," read f1 f2 f3 f4
do
  echo "$f1 $f2"
done < test.txt

IFS=$OLD_IFS
