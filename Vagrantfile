# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "precise32"
  config.vm.network :private_network, ip: "192.168.250.2"
  config.vm.provider "virtualbox" do |v|
        v.memory = 512
        v.cpus = 2
        v.gui = true
    end
end