#!/usr/bin/env bash
set -e

export DEBIAN_FRONTEND=noninteractive
apt-get update && apt-get upgrade -y
apt-get install git -y

./install_xvfb_and_firefox.sh

./install_oracle_java8.sh

./install_mysql.sh

#run script as Vagrant user not as root
su -c "./install_as_vagrant.sh" -s /bin/bash vagrant

# set up rabbitmq