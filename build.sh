#!/bin/bash
rm hosts*
wget https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling/hosts
cat hosts | grep '^0\.0\.0\.0' | awk '{print "local-zone: \""$2"\" redirect\nlocal-data: \""$2" A 0.0.0.0\""}' > ads.conf
echo 'server: ' | cat - ads.conf > temp && mv temp ads.conf
sudo cp ads.conf /etc/unbound/unbound.conf.d/ads.conf
#sudo systemctl reload unbound
