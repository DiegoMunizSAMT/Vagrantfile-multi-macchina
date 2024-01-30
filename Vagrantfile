# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # General
  BOX_IMAGE = "ubuntu/jammy64"
  GUI_ENABLE = false
  
  # Network
  BASE_INT_NETWORK = "10.10.20"
  BASE_HOST_ONLY_NETWORK = "192.168.56"
  PROXY_ENABLE = true
  PROXY_URL = "http://10.20.5.51:8888" # oppure "http://10.0.2.2:5865"
  PROXY_EXCLUDE = "localhost,127.0.0.1"
  
  
  config.vm.define "web" do |webconfig| # WEB
    # General
	webconfig.vm.box = BOX_IMAGE
    webconfig.vm.hostname = "web.m340"
	webconfig.vm.provider "virtualbox" do |vb|
	  vb.name = "web.m340"
	  vb.gui = GUI_ENABLE
	  vb.memory = "1024"
	  vb.cpus = 1
    end
	
	# Network
	webconfig.vm.network "private_network", ip: "#{BASE_INT_NETWORK}.10", virtualbox__intnet: true
	webconfig.vm.network "private_network", ip: "#{BASE_HOST_ONLY_NETWORK}.10"
	if Vagrant.has_plugin?("vagrant-proxyconf") && PROXY_ENABLE
		webconfig.proxy.http = PROXY_URL 
		webconfig.proxy.https = PROXY_URL 
		webconfig.proxy.no_proxy = PROXY_EXCLUDE
	end
	
	# Provisioning
	webconfig.vm.provision "shell", path: "./scripts/provision_apache.sh"
	
	# Sycn Sites folder
	webconfig.vm.synced_folder "./site", "/var/www/html"
  end


  config.vm.define "db" do |dbconfig| # DB
    # General
    dbconfig.vm.box = BOX_IMAGE
    dbconfig.vm.hostname = "db.m340"
	dbconfig.vm.provider "virtualbox" do |vb|
	  vb.name = "db.m340"
	  vb.gui = GUI_ENABLE
	  vb.memory = "1024"
	  vb.cpus = 1
    end
	
	# Network
	dbconfig.vm.network "private_network", ip: "#{BASE_INT_NETWORK}.11", virtualbox__intnet: true
	if Vagrant.has_plugin?("vagrant-proxyconf") && PROXY_ENABLE
		dbconfig.proxy.http = PROXY_URL 
		dbconfig.proxy.https = PROXY_URL 
		dbconfig.proxy.no_proxy = PROXY_EXCLUDE
	end
	
	# Provisioning
    dbconfig.vm.provision "shell", path: "./scripts/provision_mysql.sh"
  end
end
