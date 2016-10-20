#!/bin/bash

echo "Configuring vagrant private key"
priv_key=/home/vagrant/.ssh/id_rsa
cp /vagrant/provisioning/vagrant.priv $priv_key
chown vagrant:vagrant $priv_key
chmod 600 $priv_key


echo "Configuring /etc/hosts"
cp /vagrant/provisioning/hosts /etc/hosts

echo "Set timezone"
rm -f /etc/localtime;ln -s /usr/share/zoneinfo/Australia/NSW /etc/localtime

echo "Clean up yum repos"
yum clean all
yum history new

if [ ! -f /usr/lib/python2.6/site-packages/selinux/_selinux.so ]; then
    echo "Install libselinux-python for ansible on selinux enable boxes"
    yum install libselinux-python -y
fi


hostname=`uname -n`
# Ansible/jumphost specific config
case "$hostname" in
    jump*)

        rm -f bin ansible
        ln -s /vagrant/ansible
        ln -s ansible/bin

        if [ ! -f /etc/yum.repos.d/epel.repo ]; then
            echo "Install epel-release to get ansible"
            yum install epel-release -y
        fi

        if [ ! -f /usr/bin/ansible ]; then
            sleep 5
            echo "Install anisble"
            yum install ansible -y
        fi
        ;;
esac
