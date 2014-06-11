#!/usr/bin/env bash
set -e

echo "deb http://www.rabbitmq.com/debian/ testing main" > /etc/apt/sources.list.d/rabbitmq.list
wget http://www.rabbitmq.com/rabbitmq-signing-key-public.asc
sudo apt-key add rabbitmq-signing-key-public.asc
apt-get update
apt-get install rabbitmq-server -y
service rabbitmq-server start
rabbitmq-plugins enable rabbitmq_management
rabbitmqctl add_user admin password
#rabbitmqctl set_user_tags admin administrator
#rabbitmqctl set_permissions -p / admin ".*" ".*" ".*"
#rabbitmqctl delete_user guest
service rabbitmq-server restart