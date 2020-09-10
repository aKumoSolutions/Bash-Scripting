#!/bin/bash 

# set variable package to httpd
package=(httpd vim curl wget git)

#echo ${package[*]}

# call package with yum command 
yum install ${package[*]} -y
echo $?
sleep 5
## call package with systemctl command
systemctl start ${package[0]}
echo $?