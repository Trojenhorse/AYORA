#/bin/bash

addition()
{
 m=$1
 n=$2
 sum=$((m+n))
 echo "the sum of $m and $n is: $sum"
}

x=16
y=32
addition $x $y
p=12
q=24
addition $p $q


addition 100 1000
addition 16 32
