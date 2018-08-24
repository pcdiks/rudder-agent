#!/bin/bash

wget --quiet -O- "https://www.rudder-project.org/apt-repos/rudder_apt_key.pub" | sudo apt-key add -

echo "deb http://www.rudder-project.org/apt-4.3/ $(lsb_release -cs) main" > /etc/apt/sources.list.d/rudder.list

sudo apt-get update
sudo apt-get install rudder-agent

echo 'rudder01.home.intra' > /var/rudder/cfengine-community/policy_server.dat
rudder agent start
