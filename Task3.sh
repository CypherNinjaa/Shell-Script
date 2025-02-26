#!/bin/bash
read -p "Enter your name : " name
read -p "Enter your age : " age
read -p "Enter your os name : " os
#echo "Hello $name, you are $age year old, and your favorite os is $os."
printf "Hello %s, You are %d year old and your favorite OS is %s.\n" "$name" "$age"  "$os"