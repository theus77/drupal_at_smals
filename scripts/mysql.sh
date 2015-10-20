#!/usr/bin/env bash

echo "Installing MySql"
rpm -Uvh http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm
yum -y install mysql-community-server

echo "Adding MySql service to autostart"
systemctl enable mysqld

echo "Starting MySql service"
systemctl start mysqld

# find the DB folder
if [ -d /vagrant/database ]
then
	echo "Found folder 'database', using as db folder"
	DATABASE_FOLDER="database"
elif [ -d /vagrant/db ]
then
	echo "Found folder 'db', using as db folder"
	DATABASE_FOLDER="db"
else
	echo "Can't find db folder."
fi
