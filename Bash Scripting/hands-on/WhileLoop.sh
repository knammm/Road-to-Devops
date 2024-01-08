#!/bin/bash

counter=0

while [ $counter -lt 5 ]
do
	echo "##################################"
	echo "Looping..."
	sleep 2
	echo "Value of counter is $counter."
	echo "##################################"
	echo
	counter=$(( $counter + 1 ))
done

echo "Exit the while loop, value of counter is $counter"
date
