#!/bin/bash
read -p "Enter your name : " name
if [ "$name" = "vikash" ]; then
    echo "Welcome vikash!"
else 
    echo "You are not vikash!"
fi