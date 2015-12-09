#!/usr/bin/env bash


echo 'install memcached'
yum -y install memcached


systemctl start memcached
systemctl enable memcached

systemctl status memcached


echo 'restarting httpd'
systemctl restart httpd.service

echo 'memcached installed'