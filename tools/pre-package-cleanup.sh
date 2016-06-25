#!/bin/sh

# Performs clean-up essential prior to running vagrant package.
# Requires to be executed as a root.

mkdir /home/vagrant/.ssh
wget --no-check-certificate \
    'https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub' \
    -O /home/vagrant/.ssh/authorized_keys
chmod 0700 /home/vagrant/.ssh
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh

pacman -Scc --noconfirm
paccache -ruk0

rm -rf home/vagrant/.cache
rm -f /home/vagrant/.bash_history

rm -rf /var/log/journal/* /var/log/old/* /var/log/faillog /var/log/lastlog /var/log/pacman.log
rm -f /root/.bash_history

cd /root
dd if=/dev/zero of=zerofillfile bs=1M
rm -f zerofillfile

history -c
