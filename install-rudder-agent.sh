#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

wget --quiet -O- "https://www.rudder-project.org/apt-repos/rudder_apt_key.pub" | sudo apt-key add -

echo "deb http://www.rudder-project.org/apt-4.3/ $(lsb_release -cs) main" > /etc/apt/sources.list.d/rudder.list

apt-get update
apt-get -y install rudder-agent

echo 'rudder01.home.intra' > /var/rudder/cfengine-community/policy_server.dat
rudder agent start
