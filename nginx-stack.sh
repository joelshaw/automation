#!/usr/bin/env bash
echo 'Hello! Before we begin, lets make sure everything is up to date.'
yum update

# Nginx
echo 'Everything is good to go, Now we can install Nginx'
sudo yum install nginx
sudo systemctl start nginx
sudo systemctl enable nginx

# MySQL
echo 'Lets get MariaDB (MySQL) setup!'
sudo yum install mariadb-server mariadb
echo 'Starting MariaDB...'
sudo systemctl start mariadb
sudo mysql_secure_installation
sudo systemctl enable mariadb

# PHP
sudo yum install php php-mysql php-fpm
echo 'When prompted uncomment the line "cgi.fix_pathinfo=0" in the following script.'
read -p "Press any key to continue... " -n1 -s
sudo vi /etc/php.ini
sudo systemctl start php-fpm
sudo systemctl enable php-fpm

# Restart Nginx
sudo systemctl restart nginx
