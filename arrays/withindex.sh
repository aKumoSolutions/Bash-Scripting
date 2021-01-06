#!/usr/bin/env bash

Fruits=('Apple' 'Banana' 'Orange')

for i in "${!Fruits[@]}"; do
    printf "%s\t%s\n" "$i" "${Fruits[$i]}"
done