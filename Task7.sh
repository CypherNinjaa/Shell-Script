#!/bin/bash
multi(){
    multiplication=$(($1*$2))
    # echo "Product = $multiplication"
    return $multiplication
}
# read -p "Enter 1st number : " num1
# read -p "Enter 2nd number : " num2
multi "$1" "$2"
echo "Product = $multiplication"