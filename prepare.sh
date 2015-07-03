#!/bin/bash

echo preparing for Puppet

sudo hostname precise64
sudo su -c 'echo precise64 >/etc/hostname'

echo 'log out and log back to check that the host name is corretly set'
ip addr list | grep eth0$ 

#  inet 10.0.2.15/24 brd 10.0.2.255 scope global eth0
echo 'copy the @ip of the server and add this to the etc/hosts'
sudo su -c 'echo 10.0.2.15 precise64 precise64.example.com >> /etc/hosts'  


# download and install puppet

wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb
sudo dpkg -i puppetlabs-release-precise.deb

# update apt configuration
sudo apt-get update 
# apt-get update downloads the package lists from the repositories and "updates" them to get information on the newest versions of packages and their dependencies. It will do this for all repositories and PPAs.

sudo apt-get -y install puppet

# to update puppet and vim

# http://stackoverflow.com/questions/23929235/bash-multi-line-string-with-extra-space


