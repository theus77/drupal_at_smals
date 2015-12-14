#!/usr/bin/env bash

echo "Starting BB bootstrap"

#Fixing slow curl requests (ipv6 resolving timeouts causing issue)
#See: https://github.com/mitchellh/vagrant/issues/1172
if [ ! "$(grep single-request-reopen /etc/resolv.conf)" ];
	then echo 'options single-request-reopen' >> /etc/resolv.conf && systemctl restart network;
fi

yum install -y kernel-devel-$(uname -r) kernel-headers-$(uname -r)
/etc/init.d/vboxadd setup

dd if=/dev/zero of=/swapfile bs=1024 count=2097152
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
printf '%s\n' '/swapfile swap swap defaults 0 0' >> /etc/fstab


echo "Bootstrap complete"
