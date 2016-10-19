# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.


Vagrant.configure(2) do |config|
  config.ssh.insert_key = false
  config.vm.boot_timeout = 300
  config.vm.box = "https://dl.dropboxusercontent.com/u/51478659/vagrant/morungos-centos67.box"
  config.vm.provision :shell, path: "provisioning/provision.sh"


  # jump/ansible host

  config.vm.define "jump01" do |v|
      v.vm.host_name = "jump01.hipages.com"
      v.vm.network "private_network", ip: "192.168.135.2"
      v.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", "256"]
      end
  end

  config.vm.define "dev01" do |v|
      v.vm.host_name = "dev01.hipages.com"
      v.vm.network "private_network", ip: "192.168.135.10"
      v.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", "256"]
      end
  end

  config.vm.define "dev02" do |v|
      v.vm.host_name = "dev02.hipages.com"
      v.vm.network "private_network", ip: "192.168.135.11"
      v.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", "256"]
      end
  end

end
