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

#define proxy parameters
#https://docs.docker.com/articles/systemd/#http-proxy
mkdir /etc/systemd/system/docker.service.d
cat > /etc/systemd/system/docker.service.d/http-proxy.conf <<-EOF
[Service]
Environment="HTTP_PROXY=http://127.0.0.1:5865/" "HTTPS_PROXY=http://127.0.0.1:5865/" "NO_PROXY=localhost,127.0.0.1,.example.com"
EOF


yum install -y docker-engine

service docker start

usermod -aG docker vagrant

chkconfig docker on

curl -L https://github.com/docker/compose/releases/download/1.5.0rc1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
 
chmod +x /usr/local/bin/docker-compose

#http://www.devops-insight.com/2014/11/using-docker-with-a-proxy.html
cp /vagrant/keys/repo.cer /etc/pki/ca-trust/source/anchors/
update-ca-trust extract
service docker restart

echo "Docker and Docker-Compose have been installed"
