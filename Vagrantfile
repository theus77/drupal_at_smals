# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "grtjn/centos-7.1"
  config.vm.hostname = "drupalatsmals"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false
  
  #disable the override of the default ssh key
  #https://github.com/mitchellh/boot2docker-vagrant-box/issues/79
  #config.ssh.insert_key = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network "forwarded_port", guest: 80, host: 8080
  #config.vm.network "forwarded_port", guest: 3306, host: 3306

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.33.11"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  #autodetects proxy settings
  #http://stackoverflow.com/questions/19872591/how-to-use-vagrant-in-a-proxy-enviroment
  #puts "proxyconf..."
  if Vagrant.has_plugin?("vagrant-proxyconf")
	  #  puts "find proxyconf plugin !"
	  #  if ENV["http_proxy"]
	  #    puts "http_proxy: " + ENV["http_proxy"]
	  #    config.proxy.http     = ENV["http_proxy"]
	  #  end
	  #  if ENV["https_proxy"]
	  #    puts "https_proxy: " + ENV["https_proxy"]
	  #    config.proxy.https    = ENV["https_proxy"]
	  #  end
	  #  if ENV["no_proxy"]
	  #    config.proxy.no_proxy = ENV["no_proxy"]
	  #  end
	
	  # to use a local CNTML proxy
	  # your cntlm config should add a listen port 3128 on the interafce 192.168.33.1 by adding the following line in the cntlm.ini file
	  # Listen 		192.168.33.1:3128
	  
	  config.proxy.http     = "http://192.168.33.1:5865/"
	  config.proxy.https    = "http://192.168.33.1:5865/"
	  config.proxy.no_proxy = "localhost,127.0.0.1,.example.com"
  end

  #activate the gui
  #config.vm.provider :virtualbox do |vb|
  #  vb.gui = true
  #end

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  #Install docker and so on
  #In future will probably swap this out with something like Puppet
  config.vm.provision :shell, :path => "scripts/bootstrap.sh"
  config.vm.provision :shell, :path => "scripts/update.sh" 
    #config.vm.provision :shell, :path => "scripts/php.sh"
    #config.vm.provision :shell, :path => "scripts/php-54.sh"
    #config.vm.provision :shell, :path => "scripts/php-55.sh"
  config.vm.provision :shell, :path => "scripts/php-56.sh"
  config.vm.provision :shell, :path => "scripts/apache.sh"
    #config.vm.provision :shell, :path => "scripts/install-silverstripe.sh", :args => "-v 3.x-dev"
    #config.vm.provision :shell, :path => "scripts/php-xhprof.sh"
    #config.vm.provision :shell, :path => "scripts/php-mcrypt.sh"
    #config.vm.provision :shell, :path => "scripts/xdebug.sh"
    #config.vm.provision :shell, :path => "scripts/ntp.sh"
    #config.vm.provision :shell, :path => "scripts/grunt.sh"
    #config.vm.provision :shell, :path => "scripts/node.sh"
    #config.vm.provision :shell, :path => "scripts/grunt-watch.sh"
    #config.vm.provision :shell, :path => "scripts/silverstripe-tasks.sh"
    #config.vm.provision :shell, :path => "scripts/sspak.sh"
  config.vm.provision :shell, :path => "scripts/mailcatcher.sh"
  config.vm.provision :shell, :path => "scripts/composer.sh"
  config.vm.provision :shell, :path => "scripts/sass.sh"  
  config.vm.provision :shell, :path => "scripts/mariadb.sh"
  #config.vm.provision :shell, :path => "scripts/mysql.sh"
  config.vm.provision :shell, :path => "scripts/bower.sh"
  config.vm.provision :shell, :path => "scripts/docker.sh"
  config.vm.provision :shell, :path => "scripts/mc.sh"
  config.vm.provision :shell, :path => "scripts/phpmyadmin.sh", privileged: false
  config.vm.provision :shell, :path => "scripts/linkchecker.sh"
  config.vm.provision :shell, :path => "scripts/symfony.sh"

  config.vm.provision :shell, :path => "scripts/always.sh", run: "always"
  config.vm.provision :shell, :path => "scripts/user.sh", run: "always", privileged: false
   
end
