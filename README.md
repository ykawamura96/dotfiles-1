# dotfiles

## 1. Install minimum required packages
In this procedure, some `apt` and `pip` packages are installed.
```bash
sudo apt-get install git
cd ~
git clone https://github.com/708yamaguchi/dotfiles.git
cd ./dotfiles/install_scripts
chmod u+x install_main.sh
sudo ./install_main.sh
```

## 2. Create symbolic links to setting files
In this step, setting files for some packages get located in the form of symbolic link.
```
~/dotfiles/install_scripts/make_symbolic_link.sh
exec bash
```
At this stage, there are some errors which is solved at later stages.

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

### Setting Mozc for Japanese input
First, at System Settings -> Text Entry -> Input sources to use,
Add `Japanese` and `Mozc`.

Then, click keyboard icon at upper right side of window, and select Composition Mode -> Hiragana.

### Use google-chrome
First, get `.deb` file from [google website](https://www.google.co.jp/chrome/).

Next,
```bash
sudo apt-get install libappindicator1
sudo dpkg -i (google-chrome-installer-name).deb
```
Now, you can start `google chrome` by typing below:
```
google-chrome
```
It may be good if you set `google-chrome` as default browser, lock it to launcher and use your own google acount to share passwards, bookmarks or extentions.
