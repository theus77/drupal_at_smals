#!/usr/bin/env bash
# Deps
. /vagrant/scripts/node.sh

# Install bower
echo "Installing gulp uglify-js uglifycss"
npm install -g gulp
npm install -g uglify-js
npm install -g uglifycss
	

echo "Gulp, uglify-js, uglifycss installed"
