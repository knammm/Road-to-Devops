#!/bin/bash

# Install EPEL repository and update system packages
sudo yum install epel-release -y
sudo yum update -y
sudo yum install wget -y

# Install RabbitMQ server
cd /tmp/
dnf -y install centos-release-rabbitmq-38
dnf --enablerepo=centos-rabbitmq-38 -y install rabbitmq-server

# Enable and start RabbitMQ service
systemctl enable --now rabbitmq-server

# Configure firewall to allow RabbitMQ port
firewall-cmd --add-port=5672/tcp
firewall-cmd --runtime-to-permanent

# Start RabbitMQ server
sudo systemctl start rabbitmq-server
sudo systemctl enable rabbitmq-server

# Check the status of RabbitMQ server
sudo systemctl status rabbitmq-server

# Configure RabbitMQ to allow external connections
sudo sh -c 'echo "[{rabbit, [{loopback_users, []}]}]." > /etc/rabbitmq/rabbitmq.config'

# Create a RabbitMQ user and set administrator privileges
sudo rabbitmqctl add_user test test
sudo rabbitmqctl set_user_tags test administrator

# Restart RabbitMQ server for changes to take effect
sudo systemctl restart rabbitmq-server
