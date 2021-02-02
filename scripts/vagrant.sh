#!/bin/sh

###
## all vagrant relevant stuff lands here
## Note: for an ec2 ami this would not be applied at all

set -ex

## doas is the new sudo
echo "permit nopass vagrant" >> /etc/doas.conf

mkdir -p /home/vagrant/.ssh
ftp -o /home/vagrant/.ssh/authorized_keys https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub
chown -R vagrant /home/vagrant/.ssh
chmod -R go-rwsx /home/vagrant/.ssh

## mount point for vagrant shared folder
mkdir /vagrant
chown vagrant /vagrant