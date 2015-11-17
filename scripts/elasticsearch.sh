#!/usr/bin/env bash

yum install -y java

rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch

cat >/etc/yum.repos.d/elasticsearch.repo <<-EOF
[elasticsearch-2.x]
name=Elasticsearch repository for 2.x packages
baseurl=http://packages.elastic.co/elasticsearch/2.x/centos
gpgcheck=1
gpgkey=http://packages.elastic.co/GPG-KEY-elasticsearch
enabled=1
EOF

yum install -y elasticsearch

sed -i 's/# network.host: 192.168.0.1/network.host: 192.168.33.11/i' /etc/elasticsearch/elasticsearch.yml

/usr/share/elasticsearch/bin/plugin -DproxyPort=5865 -DproxyHost=192.168.33.1 install mobz/elasticsearch-head
 
/sbin/chkconfig --add elasticsearch
service elasticsearch start