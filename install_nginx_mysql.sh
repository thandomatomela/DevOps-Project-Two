#! /bin/bash

## Change Hostname 

    sudo hostname webserver

## Installing NGINX

    sudo apt-get update
    sudo apt-get install -y nginx
    sudo systemctl start nginx
    sudo systemctl enable nginx
    sudo chown ubuntu:ubuntu /var/www/html/ -R

## Installing MYSQL

    sudo apt update
    sudo apt install mysql-server -y
    sudo mysql -u root << 
    
    -EOF
    UPDATE mysql.user SET Password=PASSWORD('$rootpass') WHERE User='root';
    DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
    DELETE FROM mysql.user WHERE User='';
    DELETE FROM mysql.db WHERE Db='test' OR Db='test_%';
    FLUSH PRIVILEGES;

    EOF 

## Restart Machine
    sudo init 6
