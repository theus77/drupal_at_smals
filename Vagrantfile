# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # Load config JSON.
  config_json = JSON.parse(File.read("config.json"))

  #Vanilla
  config.vm.box = config_json["vm"]["box"]

  #---Networking---
  #private network so the host will be accessible to IP 192.168.33.1
  config.vm.network "private_network", ip: config_json["vm"]["ip"]
  config.vm.hostname = config_json["vm"]["hostname"]
  
  # HTTP: Port forward 80 to 8080
  config.vm.network :forwarded_port, guest: 80, host: 8080, auto_correct: true
  # config.vm.network :forwarded_port, guest: 443, host: 443, auto_correct: true
  # config.vm.network :forwarded_port, guest: 3306, host: 3306, auto_correct: true
  # config.vm.network :forwarded_port, guest: 1080, host: 1080, auto_correct: true
  # config.vm.network :forwarded_port, guest: 1090, host: 1090, auto_correct: true
  # config.vm.network :forwarded_port, guest: 1080, host: 1080, auto_correct: true
  # User defined forwarded ports.
  config_json["vm"]["forwarded_ports"].each do |port|
    config.vm.network "forwarded_port", guest: port["guest_port"],
      host: port["host_port"], protocol: port["protocol"], auto_correct: true
  end

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
  # Listen 		http://127.0.0.1:5865/
  config.proxy.http     = config_json["vm"]["proxy_http"]
  config.proxy.https    = config_json["vm"]["proxy_https"]
  config.proxy.no_proxy = config_json["vm"]["proxy_no_proxy"]

  #Install lamp and so on
  #In future will probably swap this out with something like Puppet
  ##config.vm.provision :shell, :path => config_json["provisionning"]["php"]
  #config.vm.provision :shell, :path => "scripts/php-xhprof.sh"
  ##config.vm.provision :shell, :path => config_json["provisionning"]["composer"]
  #config.vm.provision :shell, :path => "scripts/install-silverstripe.sh", :args => "-v 3.x-dev"
  ##config.vm.provision :shell, :path => config_json["provisionning"]["apache"]
  ##config.vm.provision :shell, :path => config_json["provisionning"]["mysql"]
  #config.vm.provision :shell, :path => "scripts/php-mcrypt.sh"
  #config.vm.provision :shell, :path => "scripts/xdebug.sh"
  #config.vm.provision :shell, :path => "scripts/ntp.sh"
  ##config.vm.provision :shell, :path => config_json["provisionning"]["node"]
  ##config.vm.provision :shell, :path => config_json["provisionning"]["bower"]
  #config.vm.provision :shell, :path => "scripts/grunt.sh"
  #config.vm.provision :shell, :path => "scripts/grunt-watch.sh"
  ##config.vm.provision :shell, :path => config_json["provisionning"]["sass"]
  #config.vm.provision :shell, :path => "scripts/silverstripe-tasks.sh"
  #config.vm.provision :shell, :path => "scripts/sspak.sh"
  #config.vm.provision :shell, :path => "scripts/mailcatcher.sh"
  #config.vm.provision :shell, :path => "scripts/bootstrap.sh"
  #config.vm.provision :shell, :path => "scripts/always.sh", run: "always"
  ##config.vm.provision :shell, :path => config_json["provisionning"]["mc"]
  # Install provisinning
  config_json["provisionning"].each do |provision|
    config.vm.provision :shell, :path => config_json["parameters"]["scripts_location"] + provision + ".sh"
  end
  puts "Yeah! Done!"
end
