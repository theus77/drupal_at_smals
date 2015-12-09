#!/usr/bin/env bash

#Ensure that php-pear is installed
yum install -y php-pear

#Ensure that gcc is installed
yum install -y gcc


yum install -y curl-devel

echo 'install raphf and propro'
/usr/bin/pecl install raphf
printf "\n" | /usr/bin/pecl install propro

chmod +x /usr/lib64/php/modules/raphf.so
chmod +x /usr/lib64/php/modules/propro.so

echo 'enabling raph and propro in php and load iconv before'
sed -ri '/;extension=php_xsl.dll/a extension=raphf.so' /etc/php.ini 
sed -ri '/;extension=php_xsl.dll/a extension=propro.so' /etc/php.ini 


echo 'change load order for iconv'
sed -ri '/;extension=php_xsl.dll/a extension=iconv.so' /etc/php.ini 


echo 'restarting httpd'
systemctl restart httpd.service


echo 'install pecl-http'
yum install -y zlib-devel
printf "\n" | /usr/bin/pecl install pecl_http

chmod +x /usr/lib64/php/modules/http.so

echo 'enabling pecl-http in php after raphf and propro!'
sed -ri '/extension=raphf.so/a extension=http.so' /etc/php.ini 


echo 'restarting httpd'
systemctl restart httpd.service
echo 'pecl-http installed'