#!/usr/bin/env bash
set -e

export DEBIAN_FRONTEND=noninteractive
apt-get update && apt-get upgrade -y
apt-get install git firefox xvfb htop -y

# configure display for e2e
export DISPLAY=:10

XCFB_PID=`ps ax|grep Xvfb|cut -d' ' -f1`
if [[ -n "$XCFB_PID" ]]; then killall Xvfb ;fi
Xvfb :10 -ac </dev/null &>/dev/null &

# install java
# add-apt-repository ppa:webupd8team/java
# echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
# sudo apt-get install oracle-java8-installer -y
# sudo apt-get install oracle-java8-set-default -y
# sudo apt-get install maven -y
#

# install mysql server
debconf-set-selections <<< 'mysql-server mysql-server/root_password password taxcalculator'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password taxcalculator'
sudo apt-get install mysql-server-5.5 -y

# set up mysql database

# install nodejs
chmod +x /home/vagrant/install_nodejs.sh 
su -c "./install_nodejs.sh" -s /bin/bash vagrant

# set up rabbitmq

# env variables needed?
