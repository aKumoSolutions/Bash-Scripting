#!/usr/bin/env bash

file1=abc1.txt
file2=abc2.txt
file3=abc3.txt

file1time=`stat -c %Y $file1`
file2time=`stat -c %Y $file2`
file3time=`stat -c %Y $file3`

if ( [ $file3time -gt $file2time ] );
then
 echo "$file3 modification time is recent compared to $file2"
fi     