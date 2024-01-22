#!/bin/bash

# Download and install Java and required packages
TOMURL="https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.75/bin/apache-tomcat-9.0.75.tar.gz"
dnf -y install java-11-openjdk java-11-openjdk-devel
dnf install git maven wget -y

# Download and extract Apache Tomcat
cd /tmp/
wget $TOMURL -O tomcatbin.tar.gz
EXTOUT=`tar xzvf tomcatbin.tar.gz`
TOMDIR=`echo $EXTOUT | cut -d '/' -f1`

# Create a tomcat user and set permissions
useradd --shell /sbin/nologin tomcat
rsync -avzh /tmp/$TOMDIR/ /usr/local/tomcat/
chown -R tomcat.tomcat /usr/local/tomcat

# Remove existing Tomcat systemd service file
rm -rf /etc/systemd/system/tomcat.service

# Create and configure a new Tomcat systemd service file
cat <<EOT>> /etc/systemd/system/tomcat.service
[Unit]
Description=Tomcat
After=network.target

[Service]
User=tomcat
Group=tomcat
WorkingDirectory=/usr/local/tomcat
Environment=JAVA_HOME=/usr/lib/jvm/jre
Environment=CATALINA_PID=/var/tomcat/%i/run/tomcat.pid
Environment=CATALINA_HOME=/usr/local/tomcat
Environment=CATALINE_BASE=/usr/local/tomcat
ExecStart=/usr/local/tomcat/bin/catalina.sh run
ExecStop=/usr/local/tomcat/bin/shutdown.sh
RestartSec=10
Restart=always

[Install]
WantedBy=multi-user.target
EOT

# Reload systemd configurations and start Tomcat service
systemctl daemon-reload
systemctl start tomcat
systemctl enable tomcat

# Clone the vprofile-project repository and build with Maven
git clone -b main https://github.com/hkhcoder/vprofile-project.git
cd vprofile-project
mvn install

# Stop Tomcat, replace the deployed WAR file, and restart Tomcat
systemctl stop tomcat
sleep 20
rm -rf /usr/local/tomcat/webapps/ROOT*
cp target/vprofile-v2.war /usr/local/tomcat/webapps/ROOT.war
systemctl start tomcat
sleep 20

# Stop and disable firewalld temporarily (consider security implications)
systemctl stop firewalld
systemctl disable firewalld

# Restart Tomcat to apply changes
systemctl restart tomcat
