#!/bin/bash
echo "Enter your name and last name"
read first last
# echo "Hello $first $last !"
printf "Hello %s %s\n" "$first" "$last"