# Update package information and install Nginx
apt update
apt install nginx -y

# Create Nginx configuration for the vproapp application
cat <<EOT > vproapp
upstream vproapp {
  server app01:8080;  # Specify the upstream server and port
}
server {
  listen 80;  # Listen on port 80
  location / {
    proxy_pass http://vproapp;  # Proxy requests to the upstream server
  }
}
EOT

# Move the Nginx configuration file to the appropriate directory
mv vproapp /etc/nginx/sites-available/vproapp

# Remove the default Nginx configuration
rm -rf /etc/nginx/sites-enabled/default

# Create a symbolic link to enable the vproapp configuration
ln -s /etc/nginx/sites-available/vproapp /etc/nginx/sites-enabled/vproapp

# Start and enable the Nginx service
systemctl start nginx
systemctl enable nginx
systemctl restart nginx  # Restart Nginx for the changes to take effect

