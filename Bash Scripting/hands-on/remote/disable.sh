#!/bin/bash

yum --help > /dev/null
if [ $? -eq 0 ]
then
	sudo systemctl stop httpd
	sudo rm -rf /var/www/html/*
	sudo yum remove unzip httpd wget -y > /dev/null
else
	sudo systemctl stop apache2
        sudo rm -rf /var/www/html/*
        sudo apt remove unzip httpd wget -y > /dev/null
fi
