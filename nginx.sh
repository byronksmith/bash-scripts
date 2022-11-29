#!/bin/bash

# Assign Public IP to a variable
ip=$(curl ifconfig.me)

# Create a Display message
display="My Public IP address is "

# Echo Public IP Address to the CLI
echo -e "\n\n"
echo -e $display $ip "\n\n"

# Update all packages on the server
sudo apt update

# Wait for dependencies to be installed
sleep 20

# Install & Configure Firewall
sudo apt install firewalld -y

# Wait for dependencies to be installed
sleep 10

# Enable and start Firewall
sudo systemctl enable firewalld
sudo systemctl start firewalld
sudo systemctl status firewalld

# Allow traffic on ports 80(HTTP) & 443(HTTPS)
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload
sudo firewall-cmd --permanent --list-all

# Install an NGINX web server
sudo apt install nginx -y

# Wait for dependencies to be installed
sleep 10

# Enable and start the NGINX service
sudo systemctl enable nginx
sudo systemctl start nginx
sudo systemctl status nginx

# figure out how to quit "q" after the nginx service starts

# Your web server is ready
echo -e "\nYour NGINX web server is ready sir.\n\n"

# Display the full address to view webpage
echo -e "http://"$ip
echo -e "\n\n"
