echo "Installing Midnight Commander"
yum install -y mc
echo "Midnight Commander installed."

echo "Add putty ssh key"
cat /vagrant/keys/vagrant-putty.authkey >> /home/vagrant/.ssh/authorized_keys
yum install -y dos2unix