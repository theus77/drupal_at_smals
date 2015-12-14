#!/usr/bin/env bash
# Deps
. /vagrant/scripts/node.sh

# Install bower
echo "Installing gulp uglify-js uglifycss"
npm config set loglevel warn
npm install -g npm
npm install -g gulp
npm install -g uglify-js
npm install -g uglifycss
	

echo "Gulp, uglify-js, uglifycss installed"
