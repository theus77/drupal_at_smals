#!/usr/bin/env bash
<<<<<<< HEAD
echo "Installing phpmyadmin"

wget https://github.com/phpmyadmin/phpmyadmin/archive/RELEASE_4_5_0_2.tar.gz
tar -zxvf RELEASE_4_5_0_2.tar.gz
cp /home/vagrant/phpmyadmin-RELEASE_4_5_0_2/config.sample.inc.php /home/vagrant/phpmyadmin-RELEASE_4_5_0_2/config.inc.php
#Modify config.inc.php
sed -i "s/AllowNoPassword'] = false/AllowNoPassword'] = true/i" /home/vagrant/phpmyadmin-RELEASE_4_5_0_2/config.inc.php
echo "Phpmyadmin installed"
=======
echo "User init script"

wget https://github.com/phpmyadmin/phpmyadmin/archive/RELEASE_4_5_0_2.tar.gz
tar -zxvf RELEASE_4_5_0_2.tar.gz

echo "Vagrant is up and running"
>>>>>>> bccbbd470ea33b97f0bc5e6a242ea2f3c0bfe8fd
