#!/usr/bin/env bash
cd /etc/
sudo mkdir jq
cd jq
sudo wget "https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64"
sudo mv jq-linux64 jq
sudo chmod 777 jq
cd ..
if [ -r "/vagrant/config.json" ]
then
  echo "Config.json found"
  account_name=$(cat "/vagrant/config.json" | /etc/jq/jq '.drupal .sites .drupal8 .account_name')
  account_pass=$(cat "/vagrant/config.json" | /etc/jq/jq '.drupal .sites .drupal8 .account_pass')
  site_name=$(cat "/vagrant/config.json" | /etc/jq/jq '.drupal .sites .drupal8 .site_name')
else
  echo "Config.json not found"
  account_name="admin"
  account_pass="admin"
  site_name="drupal8_at_smals"
fi
echo "Installing Drush 8"
export PATH=$PATH:/etc/vendor/drush/drush
composer require drush/drush:dev-master
composer install
echo "Downloading Drupal 8"
cd /vagrant/webroot/
drush dl drupal-8.0.0-rc1 -y
if [ -d "${site_name:1:${#site_name}-2}" ]; then
  echo ${site_name:1:${#site_name}-2} found
  chmod -R 777 ${site_name:1:${#site_name}-2}
  sudo rm -rf ${site_name:1:${#site_name}-2}
else
  echo ${site_name:1:${#site_name}-2} not found
fi
mv drupal-8.0.0-rc1 ${site_name:1:${#site_name}-2}
cd /vagrant/webroot/${site_name:1:${#site_name}-2}
echo "Installing Drupal 8 Site"
drush site-install standard -y --user=1 --account-name=${account_name:1:${#account_name}-2} --account-pass=${account_pass:1:${#account_pass}-2} --db-url=mysql://root:@localhost/${site_name:1:${#site_name}-2}
echo "Installing Drupal 8 Site Done!"
echo "Provisionning Modules"
drush dl devel -y
drush en devel -y
drush en migrate -y
drush en migrate_drupal -y
drush dl migrate_plus -y
drush en migrate_plus -y
drush dl migrate_upgrade -y
drush en migrate_upgrade -y
drush en migrate_tools -y