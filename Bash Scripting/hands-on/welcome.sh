#!/bin/bash

# Display a welcome message with the username and hostname
echo "Welcome $USER on $HOSTNAME"

# Get free RAM in megabytes
FREE_RAM=$(free -m | grep Mem | awk '{print $4}')

# Get server uptime
TIME=$(uptime | awk '{print $3}' | sed 's/,//g')

# Get the number of CPU cores
CPUS=$(cat /proc/cpuinfo | grep "cpu cores" | awk '{print $4}' | head -n 1)

# Display the information
echo "Free memory: $FREE_RAM mb"
echo "Server uptime: $TIME"
echo "Number of CPUs: $CPUS"

