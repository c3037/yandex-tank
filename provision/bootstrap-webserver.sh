#!/usr/bin/env bash

# nginx
sudo apt-get -y install nginx
sudo /etc/init.d/nginx start

# set up nginx server
sudo rm -f /etc/nginx/sites-available/*
sudo ln -s /vagrant/provision/configs/nginx/nginx.conf /etc/nginx/sites-available/site.conf
sudo rm -f /etc/nginx/sites-enabled/*
sudo ln -s /etc/nginx/sites-available/site.conf /etc/nginx/sites-enabled/site.conf
sudo /etc/init.d/nginx restart

# clean /var/www
sudo rm -Rf /var/www

# symlink /var/www => /vagrant/source
ln -s /vagrant/source /var/www

# php 7.1
sudo apt-get -y install python-software-properties
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get -y install php7.1 php7.1-common php7.1-cli php7.1-fpm
sudo apt-get -y install php7.1-curl php7.1-mbstring php7.1-xml php7.1-json php7.1-zip php7.1-gd php7.1-mysql
sudo apt-get -y install php-xdebug
sudo /etc/init.d/php7.1-fpm start

# set up php fpm
sudo rm /etc/php/7.1/cli/php.ini
sudo ln -s /vagrant/provision/configs/php/cli/php.ini /etc/php/7.1/cli/php.ini
sudo rm /etc/php/7.1/fpm/php.ini
sudo ln -s /vagrant/provision/configs/php/fpm/php.ini /etc/php/7.1/fpm/php.ini
sudo rm /etc/php/7.1/fpm/php-fpm.conf
sudo ln -s /vagrant/provision/configs/php/fpm/php-fpm.conf /etc/php/7.1/fpm/php-fpm.conf
sudo rm /etc/php/7.1/fpm/pool.d/www.conf
sudo ln -s /vagrant/provision/configs/php/fpm/pool.d/www.conf /etc/php/7.1/fpm/pool.d/www.conf
sudo rm /etc/php/7.1/mods-available/xdebug.ini
sudo ln -s /vagrant/provision/configs/php/mods-available/xdebug.ini /etc/php/7.1/mods-available/xdebug.ini
sudo /etc/init.d/php7.1-fpm restart

# composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv composer.phar /usr/local/bin/composer
