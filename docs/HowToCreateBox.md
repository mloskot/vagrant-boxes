# How-To create minimal Vagrant base box for Arch Linux

Applies to all Arch-based Linux distributions (eg. Manjaro Linux)

## Create

Create a new Virtual Machine and install Arch Linux.

* [Create an Arch Linux ase Vagrant base box](https://www.ideaplexus.com/2015/09/05/create-an-arch-linux-based-vagrant-base-box/)

## Import Insecure Keypair for SSH

* Check [Insecure Keypair](https://github.com/mitchellh/vagrant/tree/master/keys) 

```shell
mkdir /home/vagrant/.ssh
wget --no-check-certificate \
    'https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub' \
    -O /home/vagrant/.ssh/authorized_keys
chmod 0700 /home/vagrant/.ssh
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh
```

## Configure

### VirtualBox Shared Folders

```shell
su
systemctl enable vboxservice
systemctl start vboxservice
groupadd vboxsf
gpasswd -a $USER vboxsf
exit
```
## Tweak

* Install Vim and gVim
* Install https://github.com/powerline/fonts
* Install https://github.com/vim-airline/vim-airline
* Install https://github.com/VundleVim/Vundle.vim
* Install https://github.com/tomasr/molokai
* Switch Vim motion keys `hjkl` to ergonomic `jkl;`
* Generate https://terminal.sexy color scheme and pate to `~/.Xresources`

## Clean up

* Find installed packages by size

```shell
expac -H M "%011m\t%-20n\t%10d" $(comm -23 <(pacman -Qqen | sort) <(pacman -Qqg base base-devel | sort)) | sort -n
```

* Remove packages

```shell
su
pacman -Rns $(pacman -Qtdq)
pacman -Scc --noconfirm
paccache -ruk0
rm -rf /var/log/journal/* /var/log/old/* /var/log/faillog /var/log/lastlog /var/log/pacman.log
rm -f /home/vagrant/.bash_history
rm -f /root/.bash_history
cd /root
dd if=/dev/zero of=zerofillfile bs=1M
rm -f zerofillfile
```

## Package

First, temporarily, add `config.ssh.insert_key = false` to the Vagrantfile (see https://github.com/mitchellh/vagrant/issues/5186#issuecomment-81409295)

```shell
vagrant package --base {VIRTUALBOX VM NAME} --output virtualbox.box
```

Finally, remove `config.ssh.insert_key = false` from the Vagrantfile.

## Test

```shell
vagrant box add {VAGRANT BOX NAME} virtualbox.box
```
