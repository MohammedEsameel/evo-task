#! /bin/bash

echo " `date` : Part 1 - Installing VirtualBox "
echo " `date` : Install Epel Repo "
sleep 3
yum -y install epel-release

echo " `date` : Installing Required Packages "
sleep 3
yum -y install gcc dkms make qt libgomp patch
yum -y install kernel-headers kernel-devel binutils glibc-headers glibc-devel font-forge

echo " `date` : Install VirtualBox Repo "
sleep 3
cd /etc/yum.repos.d/
wget http://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo

echo " `date` : Install VirtualBox Package"
sleep 3
yum install -y VirtualBox-6.1.x86_64

echo " `date` : Part 2 - Installing Vagrant "
sleep 3
yum -y install https://releases.hashicorp.com/vagrant/2.2.14/vagrant_2.2.14_x86_64.rpm

echo " `date` : Part 3 - Installing Ansible "
sleep 3
yum install -y ansible


