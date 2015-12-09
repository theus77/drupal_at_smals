#!/usr/bin/env bash

echo 'enabling opcache'


sed -ri '/\[opcache\]/a opcache.enable_cli=1' /etc/php.ini 
sed -ri '/\[opcache\]/a opcache.fast_shutdown=1' /etc/php.ini 
sed -ri '/\[opcache\]/a opcache.revalidate_freq=60' /etc/php.ini 
sed -ri '/\[opcache\]/a opcache.max_accelerated_files=4000' /etc/php.ini 
sed -ri '/\[opcache\]/a opcache.interned_strings_buffer=8' /etc/php.ini 
sed -ri '/\[opcache\]/a opcache.memory_consumption=128' /etc/php.ini 
sed -ri '/\[opcache\]/a opcache.enabled=1' /etc/php.ini 

echo 'opcache enabled'

#echo 'installing apcu'
#yum install -y php56-php-pecl-apcu.x86_64 --enablerepo=remi
#echo 'apcu installed'