#!/usr/bin/env bash
export DEBIAN_FRONTEND=noninteractive
apt-get update

# install java
add-apt-repository ppa:webupd8team/java
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
apt-get install oracle-java8-installer -y
apt-get install oracle-java8-set-default -y
apt-get install maven

# install mysql server
debconf-set-selections <<< 'mysql-server mysql-server/root_password password taxcalculator'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password taxcalculator'
apt-get install mysql-server-5.5 -y

# set up mysql database

# install nodejs

# setup firefox for e2e?

# set up rabbitmq

# env variables needed?

# tomcat 1, tomcat 2 for webservices
