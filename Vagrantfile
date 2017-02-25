Vagrant.configure("2") do |config|

  # webserver
  config.vm.define :webserver do |webserver|
    webserver.vm.hostname = "webserver"
    webserver.vm.box = "puphpet/ubuntu1604-x64"
    webserver.vm.provider "virtualbox" do |virtualbox|
      virtualbox.memory = 1024
      virtualbox.cpus = 1
    end
    webserver.vm.network :forwarded_port, guest: 80, host: 8080
    webserver.vm.network :private_network, ip: "192.168.68.2"
    webserver.vm.synced_folder ".", "/vagrant", disabled: true
    webserver.vm.synced_folder "source/", "/vagrant/source"
    webserver.vm.synced_folder "provision/", "/vagrant/provision"
    webserver.vm.provision "shell", inline: "/bin/sh /vagrant/provision/bootstrap.sh"
    webserver.vm.provision "shell", inline: "/bin/sh /vagrant/provision/bootstrap-webserver.sh"
  end

  # yandex tank
  config.vm.define :yandex_tank do |yandex_tank|
    yandex_tank.vm.hostname = "yandex-tank"
    yandex_tank.vm.box = "puphpet/ubuntu1604-x64"
    yandex_tank.vm.provider "virtualbox" do |virtualbox|
      virtualbox.memory = 1024
      virtualbox.cpus = 1
    end
    yandex_tank.vm.network :forwarded_port, guest: 8001, host: 8001 # @yatank-online
    yandex_tank.vm.network :private_network, ip: "192.168.68.3"
    yandex_tank.vm.synced_folder ".", "/vagrant", disabled: true
    yandex_tank.vm.synced_folder "loadtests/", "/vagrant/loadtests"
    yandex_tank.vm.synced_folder "provision/", "/vagrant/provision"
    yandex_tank.vm.provision "shell", inline: "/bin/sh /vagrant/provision/bootstrap.sh"
    yandex_tank.vm.provision "shell", inline: "/bin/sh /vagrant/provision/bootstrap-yandex-tank.sh"
  end

end
