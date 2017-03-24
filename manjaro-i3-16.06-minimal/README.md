# manjaro-i3-16.06-minimal

* Atlas: [mloskot/manjaro-i3-16.06-minimal](https://atlas.hashicorp.com/mloskot/boxes/manjaro-i3-16.06-minimal/)
* Download: [manjaro-i3-16.06-minimal-v1.1.0.box](https://github.com/mloskot/vagrant-boxes/releases/download/manjaro-i3-16.06-minimal-v1.1.0/manjaro-i3-16.06-minimal-v1.1.0.box)

Built from [manjaro-i3-16.06-x86_64.iso](https://sourceforge.net/projects/manjarolinux/files/community/i3/16.06/)
using VirtualBox 5.0.22, packaged using Vagrant 1.8.1 and updated to [Manjaro Update 2016-06-25](https://manjaro.github.io/Update-2016-06-25_(stable)/)
## Box VM

* CPU: 2
* RAM: 2048 MB
* VMDK: 40 GB
* Network:
  * NAT
  * SSH via port fowarding: host `2222` to guest `22`
* Hostname: `vagrant-manjaro-1606`
* Users / Passwords:
  * `root / vagrant`
  * `vagrant / vagrant` (Public Key authentication, password-less `sudo`)

## Box Software

Based on dafault installation cut down to minimal set of essential packages and pre-configured with extras:

* VirtualBox Guest Addition 5.0.22:
  * [virtualbox-guest-utils](https://www.archlinux.org/packages/?name=virtualbox-guest-utils)
  * [virtualbox-guest-modules-arch](https://www.archlinux.org/packages/?name=virtualbox-guest-modules-arch)
* Other customizations and tweaks listed in [docs/HowToCreateBox.md](../docs/HowToCreateBox.md).

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
