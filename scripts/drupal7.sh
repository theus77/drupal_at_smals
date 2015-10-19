#!/usr/bin/env bash
cd /etc/
sudo mkdir jq
cd jq
sudo wget "https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64"
sudo mv jq-linux64 jq
sudo chmod 777 jq
if [ -r "/vagrant/config.json" ]
then
  echo "Config.json found"
  account_name=$(cat "/vagrant/config.json" | /etc/jq/jq '.drupal .sites .drupal7 .account_name')
  account_pass=$(cat "/vagrant/config.json" | /etc/jq/jq '.drupal .sites .drupal7 .account_pass')
  site_name=$(cat "/vagrant/config.json" | /etc/jq/jq '.drupal .sites .drupal7 .site_name')
else
  echo "Config.json not found"
  account_name="admin"
  account_pass="admin"
  site_name="drupal7_at_smals"
fi
echo "Installing Drush 7"
export PATH=$PATH:/etc/vendor/drush/drush
composer global require drush/drush:7.*
composer install
echo "Downloading Drupal 7"
cd /vagrant/webroot/
drush dl drupal-7.x -y
if [ -d "${site_name:1:${#site_name}-2}" ]; then
  echo ${site_name:1:${#site_name}-2} found
  chmod -R 777 ${site_name:1:${#site_name}-2}
  sudo rm -rf ${site_name:1:${#site_name}-2}
else
  echo ${site_name:1:${#site_name}-2} not found
fi
mv drupal-7.x-dev ${site_name:1:${#site_name}-2}
cd /vagrant/webroot/${site_name:1:${#site_name}-2}
echo "Installing Drupal 7"
drush site-install standard -y --user=1 --account-name=${account_name:1:${#account_name}-2} --account-pass=${account_pass:1:${#account_pass}-2} --db-url=mysql://root:@localhost/${site_name:1:${#site_name}-2}
echo "Installing Drupal 7 Done!"
echo "Provisionning Modules"
drush dl devel -y
drush en devel -y
drush dl migrate -y
drush en migrate -y
