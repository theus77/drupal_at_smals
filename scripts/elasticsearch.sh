echo "Installing ElasticSearch"
#https://www.elastic.co/guide/en/elasticsearch/reference/current/setup-repositories.html
sudo rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch
if [ ! -f /etc/yum.repos.d/elasticsearch.repo ]; then
    sudo touch /etc/yum.repos.d/elasticsearch.repo 
    sudo echo "[elasticsearch-2.x]" | sudo tee -a /etc/yum.repos.d/elasticsearch.repo > /dev/null
    sudo echo "name=Elasticsearch repository for 2.x packages" | sudo tee -a /etc/yum.repos.d/elasticsearch.repo > /dev/null
    sudo echo "baseurl=http://packages.elastic.co/elasticsearch/2.x/centos" | sudo tee -a /etc/yum.repos.d/elasticsearch.repo > /dev/null
    sudo echo "gpgcheck=1" | sudo tee -a /etc/yum.repos.d/elasticsearch.repo > /dev/null
    sudo echo "gpgkey=http://packages.elastic.co/GPG-KEY-elasticsearch" | sudo tee -a /etc/yum.repos.d/elasticsearch.repo > /dev/null
    sudo echo "enabled=1" | sudo tee -a /etc/yum.repos.d/elasticsearch.repo > /dev/null
fi
echo "Installing JRE 1.8"
sudo yum -y install java-1.8.0-openjdk
echo "JRE 1.8 installed."
sudo yum -y install elasticsearch 
sudo /usr/share/elasticsearch/bin/plugin install mobz/elasticsearch-head 
sudo sed -i 's/# network.host: 192.168.0.1/network.host: ::0/i' /etc/elasticsearch/elasticsearch.yml
#https://www.elastic.co/guide/en/elasticsearch/reference/1.3/setup-service.html
sudo /sbin/chkconfig --add elasticsearch
sudo service elasticsearch start
echo "ElasticSearch installed."