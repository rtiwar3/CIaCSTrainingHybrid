#!/bin/bash

set -e

sudo -s
apt-get update
apt-get install -y apache2
systemctl enable apache2
apt install php libapache2-mod-php php-mysql -y
a2enmod rewrite
systemctl restart apache2
chmod 777 -R /etc/apache2/apache2.conf
mv /etc/apache2/apache2.conf /etc/apache2/apache2_old.conf
cp apache2.conf /etc/apache2/apache2.conf
rm /etc/apache2/apache2_old.conf
systemctl restart apache2

git clone -b rds https://github.com/SmithaVerity/IMS.git
mv IMS /var/www/html
