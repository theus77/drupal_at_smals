#!/usr/bin/env bash

echo 'install Intl for php56'

#install required library
yum install -y icu libicu libicu-devel.x86_64
yum install -y gcc gcc-c++ autoconf automake

printf "\n" | /usr/bin/pecl install intl

chmod +x /usr/lib64/php/modules/intl.so

echo 'enabling intl in php'
sed -ri '/;extension=php_xsl.dll/a extension=intl.so' /etc/php.ini 
#TODO is this the best way??


echo 'restarting httpd'
systemctl restart httpd.service

echo 'Intl installed'