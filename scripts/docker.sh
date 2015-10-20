#!/usr/bin/env bash
#https://docs.docker.com/installation/centos/

echo "Installing Docker"

cat >/etc/yum.repos.d/docker.repo <<-EOF
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/7
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF

install docker-engine

service docker start

usermod -aG docker vagrant

chkconfig docker on

