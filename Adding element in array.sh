#!/bin/bash
fruits=("Apple" "Banana" "Cherry")
echo "Before addition : ${fruits[@]}"

fruits+=" Mango"
echo "After Addition ${fruits[@]}"

unset fruits[1]
echo "After Sub ${fruits[@]}"