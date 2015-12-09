#!/usr/bin/env bash

# Install bower
echo "Installing bundler and rubygems"
yum install -y ruby rubygems

gem install bundler
gem install json_pure
gem update --system 	

echo "Gems installed"
