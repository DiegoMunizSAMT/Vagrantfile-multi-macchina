#!/bin/bash

# Install mysql-server
sudo apt-get update -y
sudo apt-get install -y mysql-server

# Configuration MySql
sudo sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf
# sed: È un editor di flusso per filtrare e trasformare il testo.
# -i: Opzione che dice a sed per salvare di nuovo nel file originale.
# "s/.*bind-address.*/bind-address = 0.0.0.0/": Sostituisce tutte le rige che contengono bind-address con bind-address = 0.0.0.0.
# /etc/mysql/mysql.conf.d/mysqld.cnf: È il file di configurazione di MySQL.

# Create new user in MySql
sudo mysql -e "CREATE USER 'webuser'@'10.10.20.10' IDENTIFIED BY 'password';"
sudo mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'webuser'@'10.10.20.10';"

# Create db in MySql
sudo mysql -e "CREATE DATABASE myDatabase;"
sudo mysql -e "USE myDatabase; CREATE TABLE Employees (ID INT PRIMARY KEY, Name VARCHAR(20), Age INT, Salary DECIMAL(10, 2));"
sudo mysql -e "USE myDatabase; INSERT INTO Employees (ID, Name, Age, Salary) VALUES (1, 'John Doe', 30, 50000.00), (2, 'Jane Smith', 28, 60000.00), (3, 'Mike Johnson', 35, 70000.00);"

# Restart MySql
sudo service mysql restart