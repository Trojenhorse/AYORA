#/bin/bash

<< com
#just for understanding the logic of scope of a variable
#here local p=70 is the scope
display()
{
 y=32
 echo "the function value x  is: $x"
 local x=67
 local p=70
}

x=33
display

echo "value of y is: $y"
echo "the x valu after calling display function: $x"
echo "the value of p is: $p"
com

<< com2
#returning value through the echo command
display()
{
 local x=33
 echo "$x"
}

y=$(display)
echo "the function value of x is: $y"
com2

<< com3
#it shows the use of return command
#return $x means it will direct the x value as exit status,and we can see it by $?.
return_variable()
{
 local x=10
 return $x
}

return_variable
y=$?
echo "the value of x is : $y"
com3
