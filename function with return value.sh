#!/bin/bash
sum(){
    result=$(($1+$2))
    return $result
}
sum 10 20
echo "Sum : $result"