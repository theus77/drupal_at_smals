#!/usr/bin/env bash

if [ ! -f /etc/yum.repos.d/epel.repo ]; then
	echo "Installing EPEL"
	rpm -i http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
	sed -i 's/enabled=1/enabled=0/g' /etc/yum.repos.d/epel.repo
else
  echo "EPEL already installed"
fi
if [ ! -f /etc/yum.repos.d/remi-php70.repo ]; then
	echo "Installing Remi-PHP70"
	rpm -i http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
	sed -i 's/enabled=1/enabled=0/g' /etc/yum.repos.d/remi-php70.repo
else
  echo "Remi-PHP70 already installed"
fi
