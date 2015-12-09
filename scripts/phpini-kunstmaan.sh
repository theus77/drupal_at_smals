#!/usr/bin/env bash


echo 'configuring php.ini'
sed -ri '/\[PHP\]/a short_open_tag = Off' /etc/php.ini 
sed -ri '/\[PHP\]/a magic_quotes_gpc = Off' /etc/php.ini 
sed -ri '/\[PHP\]/a register_globals = Off' /etc/php.ini 
#TODO is this the best way??


echo 'restarting httpd'
systemctl restart httpd.service

echo 'php.ini configured'