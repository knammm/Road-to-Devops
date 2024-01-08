#!/bin/bash

# Install required packages: unzip, httpd (Apache web server), wget
sudo yum install unzip httpd wget -y > /dev/null

# Start and enable the Apache web server
sudo systemctl start httpd
sudo systemctl enable httpd

# Create a temporary directory for downloading and extracting files
mkdir -p /tmp/websetup # -p for continue without error if the folder has existed
cd /tmp/websetup

# Download a zip file containing web templates from a URL
wget https://www.tooplate.com/zip-templates/2137_barista_cafe.zip > /dev/null

# Unzip the downloaded file
unzip 2137_barista_cafe.zip > /dev/null

# Copy the contents of the extracted directory to the Apache web server's document root
sudo cp -r 2137_barista_cafe/* /var/www/html/

# Restart the Apache web server to apply changes
sudo systemctl restart httpd

# Remove the temporary directory and its contents
sudo rm -rf /tmp/websetup

# Check status
sudo systemctl status httpd

# Show IPv4
echo ""
echo "########################################"
echo "Choose the correct IP:"
ip addr show | grep "inet "
echo "########################################"
echo ""
