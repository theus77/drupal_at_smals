#!/usr/bin/env bash

# Grab the installer and pipe it into PHP
echo "Downloading composer"
curl -sS https://getcomposer.org/installer | php

echo "Moving composer to make it globally accessable"
mv composer.phar /usr/bin/composer

echo "Adding composer's vendor directory to system PATH"
cat >/etc/profile.d/composer-bin-root.sh <<EOF
#!/usr/bin/env bash

pathmunge /home/vagrant/.composer/vendor/bin after
pathmunge /root/.composer/vendor/bin after
EOF

echo "Composer installed"

echo "Installing git due to composer dependency"
yum install -y git
