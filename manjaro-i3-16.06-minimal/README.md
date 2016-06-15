# manjaro-i3-16.06-minimal

* Atlas: [mloskot/manjaro-i3-16.06-minimal](https://atlas.hashicorp.com/mloskot/boxes/manjaro-i3-16.06-minimal/)
* Download: [manjaro-i3-16.06-minimal-v1.0.0.box](https://github.com/mloskot/vagrant-boxes/releases/download/manjaro-i3-16.06-minimal-v1.0.0/)

Built from [manjaro-i3-16.06-x86_64.iso](https://sourceforge.net/projects/manjarolinux/files/community/i3/16.06/) using VirtualBox 5.0.21 and packaged using Vagrant 1.8.1.

## Box VM

* CPU: 2
* RAM: 2048 MB
* VHD: 40 GB
* Network:
  * NAT
  * SSH via port fowarding: host `2222` to guest `22`
* Users
  * `root / vagrant`
  * `vagrant / vagrant` (Public Key authentication, password-less `sudo`)

## Box Software

Based on dafault installation cut down to minimal set of essential packages and pre-configured with extras:

* Vim - pre-configured with `jkl;` motion keys.
* VirtualBox Guest Addition 5.0.20:
  * [virtualbox-guest-utils](https://www.archlinux.org/packages/?name=virtualbox-guest-utils)
  * [virtualbox-guest-modules-arch](https://www.archlinux.org/packages/?name=virtualbox-guest-modules-arch)
* [Vundle](https://github.com/VundleVim) plug-in manager for Vim with a few handy plugins.

Chris Kempson's [Monokai](https://chriskempson.github.io/base16/#monokai) color scheme configured for
[urxvt](https://wiki.archlinux.org/index.php/rxvt-unicode) and Vim.

## Box Usage

* `vagrant init mloskot/manjaro-i3-16.06-minimal`
* Enable GUI in the generated Vagrantfile by uncommenting:
```
  config.vm.provider "virtualbox" do |v|
    v.gui = true
  end 
```
* `vagrant up --provider virtualbox`

Alternatively, use `Vagrantfile` from GitHub
```
git clone https://github.com/mloskot/vagrant-boxes.git
cd manjaro-i3-16.06-minimal
vagrant up
```
