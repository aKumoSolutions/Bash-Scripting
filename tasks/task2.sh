#!/bin/bash 

# set variable package to httpd
package="httpd"
package2="vim"
package3="curl"

# call package with yum command 
yum install $package $package2 $package3 -y
echo $?
sleep 5
# call package with systemctl command
systemctl start $package
echo $?