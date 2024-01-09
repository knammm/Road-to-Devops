#!/bin/bash

USR="devops"

for HOST in $(cat remhosts.txt)
do
	echo
	echo "#############################################"
	echo "Connecting to host $HOST..."
	echo "Successfully..."
	echo "Deleting files..."
	scp disable.sh $USR@$HOST:/tmp/
	ssh $USR@$HOST /tmp/disable.sh > /dev/null
	ssh $USR@$HOST rm -rf /tmp/disable.sh
	echo "Done..."
	echo "#############################################"
	echo
	sleep 2
done
