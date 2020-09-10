#!/usr/bin/env bash

#Check the list of crontab set by all users in the system
for user in $(cut -f1 -d: /etc/passwd);
 do
    crontab -u $user -l;
 done
