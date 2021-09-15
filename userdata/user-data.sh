#!/bin/bash

sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install ansible -y
sudo apt-get install git -y
sudo mkdir /usr/local/dev
cd /usr/local/dev
sudo git clone https://github.com/Junaidshah/config.git
cd config
ansible-playbook -i localhosts, playbook.yaml




