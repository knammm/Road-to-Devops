#!/bin/bash

echo
echo "####################################"
date
ls /var/run/httpd/httpd.pid &> /dev/null

if [ $? -eq 0 ]
then
	echo "HTTPD process is running."
else
	echo "HTTPD is not running,"
	sleep 2
	echo "Bringing httpd to run..."
	sudo systemctl start httpd
	if [ $? -eq 0 ]
	then
		sleep 2
		echo "HTTPD process is active."
	fi
fi

echo "#####################################"
echo

# For crontab job: use crontab -e
# minute hour dateOfMonth month dateOfWeek COMMAND
# Syntax: Minute (0 - 59) Hour (0 - 23) Day of month (1 - 31) Month (1 - 12) Day of week (0 - 6) Command
# Example 1: * * * * * /opt/script/httpd_check.sh
# Explain: Execute every minute.
# Example 2: 40 20 * 12 1-5 /opt/script/httpd_check.sh
# Explain: Minute: 40, Hour: 20, Day of Month: *, Month: 12 (December), Day of Week: 1-5 (Monday to Friday), Command: /opt/script/httpd_check.sh => This crontab entry is set to run the /opt/script/httpd_check.sh script at 8:40 PM every day from Monday to Friday in the month of December.
