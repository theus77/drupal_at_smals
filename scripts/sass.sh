#!/usr/bin/env bash

echo "Installing SASS"
echo "Ensuring Ruby (dependency) is installed and up to date"
yum install -y ruby ruby-devel rubygems
echo "Ruby check complete. Version: `ruby --version`"


echo "#!/usr/bin/env bash" > /etc/profile.d/local-bin.sh
echo "pathmunge /usr/local/bin after" >> /etc/profile.d/local-bin.sh

gem install sass
echo "Installed SASS version: `/usr/local/bin/sass -v`"

echo "Installing Compass"
gem install compass
# needed to compile core sass
gem install compass-colors
echo "Compass installed `/usr/local/bin/compass -v`"
