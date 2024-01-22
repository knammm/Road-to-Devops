#!/bin/bash

# Install EPEL repository and Memcached
sudo dnf install epel-release -y
sudo dnf install memcached -y

# Start and enable Memcached service
sudo systemctl start memcached
sudo systemctl enable memcached

# Check the status of Memcached service
sudo systemctl status memcached

# Update Memcached configuration to listen on all interfaces
sed -i 's/127.0.0.1/0.0.0.0/g' /etc/sysconfig/memcached

# Restart Memcached service with the new configuration
sudo systemctl restart memcached

# Configure firewall to allow Memcached ports
firewall-cmd --add-port=11211/tcp
firewall-cmd --runtime-to-permanent
firewall-cmd --add-port=11111/udp
firewall-cmd --runtime-to-permanent

# Start Memcached daemon with specified parameters
sudo memcached -p 11211 -U 11111 -u memcached -d