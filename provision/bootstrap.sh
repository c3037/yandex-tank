#!/usr/bin/env bash

# system
sudo apt-get update
sudo apt-get upgrade
sudo apt-get -y install mc
sudo timedatectl set-timezone Europe/Moscow
sudo locale-gen ru_RU.utf8
update-locale LANG=ru_RU.UTF8

# ssh public key
cat /vagrant/provision/configs/system/ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys

# ssh private key
cp /vagrant/provision/configs/system/ssh/id_rsa /home/vagrant/.ssh/id_rsa
sudo chown vagrant:vagrant /home/vagrant/.ssh/id_rsa
sudo chmod 600 /home/vagrant/.ssh/id_rsa

# ssh configs
cp /vagrant/provision/configs/system/ssh/config /home/vagrant/.ssh/config
sudo chown vagrant:vagrant /home/vagrant/.ssh/config
sudo chmod 600 /home/vagrant/.ssh/config
