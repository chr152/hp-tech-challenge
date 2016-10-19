#!/bin/bash

echo "Configuring vagrant private key"
priv_key=/home/vagrant/.ssh/id_rsa
cp /vagrant/provisioning/vagrant.priv $priv_key
chown vagrant:vagrant $priv_key
chmod 600 $priv_key


echo "Configuring /etc/hosts"
cp /vagrant/provisioning/hosts /etc/hosts

echo "Clean up yum repos"
yum clean all
yum history new


hostname=`uname -n`
# Ansible/jumphost specific config
case "$hostname" in
    jump*)

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
