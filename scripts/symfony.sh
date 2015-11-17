echo "Installing Symfony"
sudo curl -LsS http://symfony.com/installer -o /vagrant/webroot/symfony
sudo chmod a+x /vagrant/webroot/symfony
cd /vagrant/webroot/
#TODO test is project exist.
#TODO give the name of the project "urlparser" as parameter found in a composer.json file.
php symfony new urlparser
echo "Symfony installed."