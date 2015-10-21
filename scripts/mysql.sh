#!/usr/bin/env bash
echo "Installing MySql"
rpm -Uvh http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm
yum -y install mysql-community-server

echo "Adding MySql service to autostart"
systemctl enable mysqld.service

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

DB_FILES=/vagrant/$DATABASE_FOLDER/*.sql
shopt -s nullglob
for file in $DB_FILES
do
	DB_NAME=`basename $file .sql`
	echo "Creating database '$DB_NAME'"
	# Drop the DB so that we can run the provisioner on a machine that already has had it run once
	mysql -u root <<< "DROP DATABASE IF EXISTS \`$DB_NAME\`; CREATE DATABASE IF NOT EXISTS \`$DB_NAME\`;"

	echo "Importing database dump"
	sed '/^CREATE DATABASE/d;/^USE/d' $file | mysql $DB_NAME -u root
	
	mysql -u root <<< "CREATE USER \`$DB_NAME\`@'%';"
	mysql -u root <<< "GRANT USAGE ON * . * TO  \`$DB_NAME\`@'%' WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0 ;"
	mysql -u root <<< "GRANT ALL PRIVILEGES ON  \`$DB_NAME\` . * TO  \`$DB_NAME\`@'%';"
done;

echo "Databases imported"
#Reload the database
echo "Setting DB permissions for root"
mysql -u root <<< "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES;"