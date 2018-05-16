# dotfiles

## 1. Install minimum required packages
In this procedure, some `apt` and `pip` packages are installed.
```bash
sudo apt-get install git
cd ~
git clone https://github.com/708yamaguchi/dotfiles.git
cd ./dotfiles/install_scripts
chmod u+x minimum_install.sh
sudo ./minimul_install.sh
```

## 2. Create symbolic links to setting files
In this step, setting files for some packages get located in the form of symbolic link.
```
~/dotfiles/install_scripts/make_symbolic_link.sh
```

## 3. Others
### Setting ssh
Generate ssh key.
```bash
ssh-keygen -t rsa
```
In `etc/ssh/sshd_config`,
```
PermitRootLogin no
PasswordAuthentication no
```
After the above, restart ssh.
```bash
sudo service ssh restart
```
At last, make and edit `~/.ssh/authorized_keys` and `~/.ssh/config`

### Setting ntp
For security,
```bash
disable monitor
sudo service restart ntp
```

### Install ROS
For ROS installation, see `http://wiki.ros.org/ROS/Installation`.

### Make Caps additional Ctrl
```bash
gnome-tweak-tool
```
Typing -> Caps Lock key behavior -> Make Caps Lock an additinal Ctrl
