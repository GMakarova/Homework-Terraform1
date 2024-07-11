#!/bin/bash
sudo apt update
sudo apt install apache2 -y
sudo systemctl start apache2
sudo systemctl enable apache2

sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
sudo echo HELLO, WORLD! >> /var/www/html/index.html