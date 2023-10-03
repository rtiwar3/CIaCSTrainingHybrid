#!/bin/bash

set -e

sudo -s
apt-get update
apt-get install -y apache2
systemctl enable apache2

git clone -b rds https://github.com/SmithaVerity/IMS.git
mv IMS /var/www/html
