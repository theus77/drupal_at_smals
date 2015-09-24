# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  #Vanilla
  config.vm.box = "grtjn/centos-7.0"

  #---Networking---
  #private network so the host will be accessible to IP 192.168.33.1
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.hostname = "drupalatsmals"
  
  # HTTP: Port forward 80 to 8080
  config.vm.network :forwarded_port, guest: 80, host: 8080, auto_correct: true
  # config.vm.network :forwarded_port, guest: 443, host: 443, auto_correct: true
  # config.vm.network :forwarded_port, guest: 3306, host: 3306, auto_correct: true
  # config.vm.network :forwarded_port, guest: 1080, host: 1080, auto_correct: true
  # config.vm.network :forwarded_port, guest: 1090, host: 1090, auto_correct: true
  # config.vm.network :forwarded_port, guest: 1080, host: 1080, auto_correct: true

  #Uncomment this if you want bridged network functionality
  #config.vm.network :public_network
  
  #autodetects proxy settings
  #http://stackoverflow.com/questions/19872591/how-to-use-vagrant-in-a-proxy-enviroment
  #puts "proxyconf..."
  #if Vagrant.has_plugin?("vagrant-proxyconf")
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
  #end
  
  # to use a local CNTML proxy
  # your cntlm config should add a listen port 3128 on the interafce 192.168.33.1 by adding the following line in the cntlm.ini file
  # Listen 		192.168.33.1:3128
  config.proxy.http     = "http://192.168.33.1:3128/"
  config.proxy.https    = "http://192.168.33.1:3128/"
  config.proxy.no_proxy = "localhost,127.0.0.1,.example.com"

  #Install lamp and so on
  #In future will probably swap this out with something like Puppet
  #config.vm.provision :shell, :path => "scripts/php-54.sh"
  #config.vm.provision :shell, :path => "scripts/php-55.sh"
  config.vm.provision :shell, :path => "scripts/php-56.sh"
  #config.vm.provision :shell, :path => "scripts/php-xhprof.sh"
  #config.vm.provision :shell, :path => "scripts/composer.sh"
  #config.vm.provision :shell, :path => "scripts/install-silverstripe.sh", :args => "-v 3.x-dev"
  config.vm.provision :shell, :path => "scripts/apache.sh"
  #config.vm.provision :shell, :path => "scripts/mariadb.sh"
  #config.vm.provision :shell, :path => "scripts/php-mcrypt.sh"
  #config.vm.provision :shell, :path => "scripts/xdebug.sh"
  #config.vm.provision :shell, :path => "scripts/ntp.sh"
  #config.vm.provision :shell, :path => "scripts/node.sh"
  config.vm.provision :shell, :path => "scripts/bower.sh"
  #config.vm.provision :shell, :path => "scripts/grunt.sh"
  #config.vm.provision :shell, :path => "scripts/grunt-watch.sh"
  config.vm.provision :shell, :path => "scripts/sass.sh"
  #config.vm.provision :shell, :path => "scripts/silverstripe-tasks.sh"
  #config.vm.provision :shell, :path => "scripts/sspak.sh"
  #config.vm.provision :shell, :path => "scripts/mailcatcher.sh"
  #config.vm.provision :shell, :path => "scripts/bootstrap.sh"
  #config.vm.provision :shell, :path => "scripts/always.sh", run: "always"
  config.vm.provision :shell, :path => "scripts/mc.sh"

end
