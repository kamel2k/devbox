# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "centos7"
  config.vm.box_url = "ftp://support-esa.noe.edf.fr/OFM/public/jboss/outils_vm/centos-7-x86_64.box"

  if Vagrant.has_plugin?("vagrant-proxyconf")
    config.proxy.http     = "http://10.151.27.88:3128/"
    config.proxy.https    = "http://10.151.27.88:3128/"
    config.proxy.no_proxy = "localhost,127.0.0.1,.example.com"
  end

  #config.vm.network "forwarded_port", guest: 8090, host: 8090
  #config.vm.network "forwarded_port", guest: 8080, host: 8080

  # config.vm.synced_folder ".", "/vagrant", type: "virtualbox"
  config.vm.synced_folder "./files", "/vagrant_data", type: "virtualbox"
  
   config.vm.provider "virtualbox" do |vb|
     vb.memory = "4096"
   end

  config.vm.provision :shell, inline: <<-SHELL
	yum install -y ansible
  SHELL
			
	
 end
