#!/bin/bash

USR="devops"

for host in `cat remhosts.txt`
do
	echo
	echo "#################################################"
	echo "Connecting to $host..."
	scp remote_websetup.sh $USR@$host:/tmp/
	ssh $USR@$host /tmp/remote_websetup.sh > /dev/null
	ssh $USR@$host rm -rf /tmp/remote_websetup.sh
	echo "#################################################"
	echo
	sleep 2
done
