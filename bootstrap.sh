#!/bin/sh

#Update distribution
sudo apt-get upgrade -y
sudo apt-get update -y


#Software
sudo apt-get install -y git
sudo apt-get install -y python-software-properties python g++ make
sudo apt-get install python-software-properties python g++ make

#Build node
# The install script
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install nodejs
sudo npm install sqlite3 --build-from-source

#Create your running config and bind server socket to all IPs.
cp ghost/config.example.js ghost/config.js
sed -i 's/127.0.0.1/0.0.0.0/g' ghost/config.js

#Install app dependencies
cd ghost
sudo npm install --production
