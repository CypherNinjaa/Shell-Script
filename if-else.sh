#!/bin/bash
read -p "Enter the number : " num
if [ $num -gt 5 ] ; then
    echo "the $num is greater than 5"
else
    echo "It is less than or equal to 5"
fi
