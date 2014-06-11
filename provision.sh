#!/usr/bin/env bash
set -e

export DEBIAN_FRONTEND=noninteractive
apt-get update && apt-get upgrade -y
apt-get install git -y

./scripts/install_xvfb_and_firefox.sh

./scripts/install_oracle_java8.sh

./scripts/install_mysql.sh

./scripts/install_rabbitmq.sh

#run script as Vagrant user not as root
su -c "./scripts/install_as_vagrant.sh" -s /bin/bash vagrant