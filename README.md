# Vagrant Boxes

Handcrafted [Vagrant](https://www.vagrantup.com/) [Boxes](https://www.vagrantup.com/docs/boxes.html).

List of boxes:

* [manjaro-i3-16.06-minimal](manjaro-i3-16.06-minimal/README.md)

All boxes are available from Atlas: https://atlas.hashicorp.com/mloskot

All boxes published via corresponding tagged release on GitHub are named according to the convention of `{operating system}-{version}-{flavour}-{box version}.box`.

## Usage

```
git clone https://github.com/mloskot/vagrant-boxes.git
cd {BOX}
vagrant up
```

## Troubleshooting

### Disabling `Win+Enter` Windows Narrator hotkey for i3 

In Windows, `Win+Enter` keybinding launches the Windows Narrator.
Windows key is a popular alternative [i3 modifier](https://i3wm.org/docs/userguide.html#_using_i3)
(`$mod`) key and pressing `$mod+Enter` opens a new terminal.
The annoyance of launching the Windows Narrator every time
you aim to open a terminal in the i3 environment of the guest VM,
can be avoided by disabling the `Win+Enter` as the Narrator hotkey:

1. Create registry key ` HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT \CurrentVersion\Image File Execution Options\Narrator.exe`
2. Create new String Value with name `Debugger` and value `%1`.