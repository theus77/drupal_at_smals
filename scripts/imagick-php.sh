#!/usr/bin/env bash

#Ensure that php-pear is installed
yum install -y php-pear

echo 'install ImageMagick'
yum install -y ImageMagick*

echo 'install Imagick php'
pecl install Imagick

echo 'enabling imagick in php'
sed -ri '/;extension=php_xsl.dll/a extension=imagick.so' /etc/php.ini 
#TODO is this the best way??


echo 'restarting httpd'
systemctl restart httpd.service

echo 'imageick php installed'