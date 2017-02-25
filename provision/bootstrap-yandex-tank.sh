#!/usr/bin/env bash

# docker
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'
sudo apt-get update
sudo apt-get -y install docker-engine docker-compose

# telegraf
curl -sL https://repos.influxdata.com/influxdb.key | sudo apt-key add -
echo "deb https://repos.influxdata.com/ubuntu xenial stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
sudo apt-get update
sudo apt-get -y install telegraf
sudo systemctl start telegraf

# yandex tank
sudo apt-get -y install python-pip build-essential python-dev libffi-dev gfortran libssl-dev
sudo -H pip install --upgrade pip
sudo -H pip install --upgrade setuptools
# sudo -H pip install https://api.github.com/repos/yandex/yandex-tank/tarball/master # @overload
sudo -H pip install https://api.github.com/repos/yandex/yandex-tank/tarball/v1.7.32 # @yatank-online, @blazemeter
sudo -H pip install https://api.github.com/repos/yandex-load/yatank-online/tarball/1.7_branch # @yatank-online

sudo add-apt-repository -y ppa:yandex-load/main
sudo apt-get update
sudo apt-get -y install phantom phantom-ssl

echo "alias yandex-tank='yandex-tank -c /vagrant/provision/configs/yandex-tank/load.ini -l /vagrant/loadtests/tank.log'" >> /home/vagrant/.bash_aliases
sudo chown vagrant:vagrant /home/vagrant/.bash_aliases
