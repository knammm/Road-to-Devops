#!/bin/bash

echo "Variable of 0:"
echo $0

echo "Variable of 1:"
echo $1

echo "Variable of 2:"
echo $2

echo "Variable of 3:"
echo $3

# Output 1: If we dont pass any argument outside, the output of variable 0 is the file's name ("./arguments.sh"), others print empty.
# Output 2: If the arguments are AWS, Ansible, DevOps. Then the output of each variable is respectively as ("./arguments.sh" "AWS" "Ansible" "DevOps").
