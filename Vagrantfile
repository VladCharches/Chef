# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "sbeliakou/centos-6.7-x86_64"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "private_network", ip: "192.168.56.101"
  config.vm.provision "shell", path: "1.sh"
  config.vm.hostname = "chef2"
  
  config.vm.provider "virtualbox" do |vb|
    vb.name = "task7"
  end
end
