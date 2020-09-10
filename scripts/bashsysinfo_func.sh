#!/usr/bin/env bash

# A System Information Gathering Script

#Command 1
function uname_func() {
  #statements
  UNAME="uname -a"
  printf "Gathering System Information with the $UNAME command: \n\n"
  $UNAME
}

#Command 2
function disk_func() {
  #statements
  DISKSPACE="df -h"
  printf "Gathering diskspace Information with the $DISKSPACE command: \n\n"
  $DISKSPACE
}

function main() {
  #statements
  uname_func
  disk_func
}

main
