#!/bin/bash

for VAR1 in java shell devops python
do
	echo "####################################"
	date
	echo "Looping..."
	sleep 1
	echo "Value of VAR1: $VAR1."
	echo "####################################"
	echo
done

echo "Bash version ${BASH_VERSION}"
for i in {0..10..2}
do
     echo "Welcome $i times"
done

for (( c=1; c<=5; c++ ))
do  
   echo "Welcome $c times"
done
