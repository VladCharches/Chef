# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "sbeliakou/centos-6.7-x86_64"
  config.vm.network "forwarded_port", guest: 80, host: 8100
  config.vm.network "private_network", ip: "192.168.56.110"
#config.vm.provision "shell", path: "1.sh"
  config.vm.hostname = "chefX"
  
  config.vm.provider "virtualbox" do |vb|
    vb.name = "task8.1"
  end
end
