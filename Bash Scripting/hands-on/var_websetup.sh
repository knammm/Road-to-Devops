#!/bin/bash

# Improvement: Using variables
PACKAGES="unzip httpd wget"
SVC="httpd"
URL="https://www.tooplate.com/zip-templates/2137_barista_cafe.zip"
ART_NAME="2137_barista_cafe"
TMP_DIR="/tmp/websetup"

# Install required packages: unzip, httpd (Apache web server), wget
sudo yum install $PACKAGES -y > /dev/null

# Start and enable the Apache web server
sudo systemctl start $SVC
sudo systemctl enable $SVC

# Create a temporary directory for downloading and extracting files
mkdir -p $TMP_DIR # -p for continue without error if the folder has existed
cd $TMP_DIR

# Download a zip file containing web templates from a URL
wget $URL > /dev/null

# Unzip the downloaded file
unzip $ART_NAME.zip > /dev/null

# Copy the contents of the extracted directory to the Apache web server's document root
sudo cp -r $ART_NAME/* /var/www/html/

# Restart the Apache web server to apply changes
sudo systemctl restart $SVC

# Remove the temporary directory and its contents
sudo rm -rf $TMP_DIR

# Check status
sudo systemctl status $SVC

# Show IPv4
echo ""
echo "########################################"
echo "Choose the correct IP:"
ip addr show | grep "inet "
echo "########################################"
echo ""
