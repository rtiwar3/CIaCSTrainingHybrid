# Install apache server
sudo apt update && sudo apt install apache2 -y

# Allow ports 80 for application, 3306 for mysql and 22 for SSH connection
sudo ufw app list
sudo ufw allow in "Apache"
sudo ufw allow 3306
sudo ufw allow in "OpenSSH"
sudo ufw status
echo "y" | sudo ufw enable
sudo ufw status

# Install PHP 
sudo apt install php libapache2-mod-php php-mysql -y
php -v
sudo a2enmod rewrite
sudo systemctl restart apache2

# Allow access for apache and mysql from remote
sudo chmod 777 -R /etc/apache2/apache2.conf
sudo mv /etc/apache2/apache2.conf /etc/apache2/apache2_old.conf
sudo cp apache2.conf /etc/apache2/apache2.conf
sudo rm /etc/apache2/apache2_old.conf
sudo systemctl restart apache2


# Place the code in the server html folder
sudo chmod 777 -R /var/www/html
sudo mv IMS /var/www/html
