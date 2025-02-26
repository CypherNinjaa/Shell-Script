#!/bin/bash

read -p "Enter the number: " num

# Check if the input is a number
if ! [[ "$num" =~ ^-?[0-9]+$ ]]; then
    echo "Error: Please enter a valid integer."
    exit 1
fi

if [ "$num" -gt 0 ]; then     # Check for positive
    echo "$num is a positive number"  
elif [ "$num" -eq 0 ]; then
    echo "It is zero"
else
    echo "$num is a negative number"
fi