#!/usr/bin/env bash

echo "Installing MySql"
rpm -Uvh http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm
yum -y install mysql-community-server

echo "Adding MySql service to autostart"
systemctl enable mysqld

echo "Starting MySql service"
systemctl start mysqld
