#!/bin/bash

read -p "Enter your number: " NUM
echo

if [ $NUM -gt 100 ]
then
	echo "Entering the IF block..."
	sleep 2
	echo "Your number is greater than 100"
elif [ $NUM == 100 ]
then
	echo "Checking..."
	sleep 2
	echo "Your number is exactly 100"
else
	echo "Entering the ELSE block..."
	sleep 2
	echo "Your number is less than 100"
fi
echo
date
