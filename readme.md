### Important information ###
* All bash scripts on host machine must have LF type of line breaks.
* Command `$ yandex-tank` in vagrant box is alias for `$ yandex-tank -c /vagrant/provision/configs/yandex-tank/load.ini -l /vagrant/loadtests/tank.log`.

_____________________________________________________
### Yandex.Tank (last version) + Overload ###
1. clone this repository
2. edit ./provision/bootstrap-yandex-tank.sh
  * comment lines with `@yatank-online`, `@blazemeter` tags
  * uncomment lines with `@overload` tag
3. edit ./provision/configs/yandex-tank/load.ini
  * comment lines with `@yatank-online`, `@blazemeter` tags
  * uncomment lines with `@overload` tag
4. put your overload token in ./provision/configs/yandex-tank/overload_token.txt
5. [host]$ vagrant up
6. [host]$ vagrant ssh yandex_tank
7. [vagrant]$ yandex-tank

Yandex.Tank: https://github.com/yandex/yandex-tank    
OverLoad: https://overload.yandex.net/    

_____________________________________________________
### Yandex.Tank 1.7.32 + Yandex.Tank OnlineReport ###
1. clone this repository
2. [host]$ vagrant up
3. [host]$ vagrant ssh yandex_tank
4. [vagrant]$ yandex-tank

Yandex.Tank: https://github.com/yandex/yandex-tank    
Yandex.Tank OnlineReport: https://github.com/yandex-load/yatank-online    
OnlineReport GUI: http://127.0.0.1:8001    

_____________________________________________________
### Yandex.Tank 1.7.32 + Blazemeter ###
1. clone this repository
2. edit ./provision/configs/yandex-tank/load.ini
  * uncomment lines with `@blazemeter` tag
  * set your blazemeter(loadosophia) token
3. [host]$ vagrant up
4. [host]$ vagrant ssh yandex_tank
5. [vagrant]$ yandex-tank

Yandex.Tank: https://github.com/yandex/yandex-tank    
Blazemeter: https://www.blazemeter.com/    
Blazemeter GUI: https://sense.blazemeter.com/gui/    
