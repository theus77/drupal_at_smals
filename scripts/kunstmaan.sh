echo "Installing Kunstmaan DWHlabormarket"

cd /vagrant/webroot/
composer create-project kunstmaan/bundles-standard-edition DWHlabormarket

#TODO test is project exist.
#TODO give the name of the project "urlparser" as parameter found in a composer.json file.
php symfony new urlparser
echo "Symfony installed."