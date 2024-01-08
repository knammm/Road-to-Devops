#!/bin/bash

# Command substitution is method of storing OUTPUT of a command into variable.
# First method
cd ~/

FILES=$(sudo ls /opt/script/)
echo $FILES

# Second method
FILES2=`sudo ls /opt/script/`
echo $FILES2

echo ""
free -m
echo ""
echo ""
FREE_MEM=$(free -m | grep Mem | awk '{print $4}')
echo "Free memory space: $FREE_MEM mb"

