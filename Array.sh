#!/bin/bash
fruits=("Apple" "Banana" "Cherry")
# echo "First fruit ${fruits[0]}"
# echo "All Fruits ${fruits[@]}"
for i in {0..3}; do
    echo "${fruits[i]}"
done

