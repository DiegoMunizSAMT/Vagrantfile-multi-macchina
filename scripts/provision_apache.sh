#!/bin/bash

# Install Apache
sudo apt-get update -y
sudo apt-get install apache2 -y
sudo a2enmod rewrite
sudo service apache2 restart

# Install PHP
sudo apt-get install php libapache2-mod-php php-mysql -y
# php: è il linguaggio di scripting PHP.
# libapache2-mod-php: È un modulo che permette al server web Apache di interpretare i file PHP.
# php-mysql: È un modulo che permette a PHP di comunicare con i database MySQL.