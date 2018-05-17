# dotfiles

## 1. Install minimum required packages
In this procedure, some `apt` and `pip` packages are installed.
```bash
sudo apt-get install git
cd ~
git clone https://github.com/708yamaguchi/dotfiles.git
cd ./dotfiles/install_scripts
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


### Setting ssh
Generate ssh key.
```bash
ssh-keygen -t rsa
```
In `/etc/ssh/sshd_config`,
```
PermitRootLogin no
PasswordAuthentication no
```
Next, save the `~/.ssh/rsa.pub` to `https://github.com/(yourname).keys`

After the above, restart ssh.
```bash
sudo service ssh restart
```
At last, make and edit `~/.ssh/authorized_keys` and `~/.ssh/config`

### Setting ntp
For security, `disable monitor` in `/etc/ntp.conf`. Then,
```bash
sudo service ntp restart
```

### Install ROS
For ROS installation, follow instructions in [ROS Installation](http://wiki.ros.org/ROS/Installation). At this stage, you install minimum required packages for ROS.

Next, install some packages for `JSK` environment:
```bash
sudo apt-get install python-catkin-tools
sudo apt-get install ros-$(rosversion -d)-jsk-tools
sudo apt-get install ros-$(rosversion -d)-rosemacs
```

In order to create ROS workspace, do
```bash
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws
catkin init
cd src
wstool init .
wstool set ~~~
wstool update
rosdep update
rosdep isntall --from-paths . --ignore-src -y -r
cd ..
catkin build
```

### Make Caps additional Ctrl
```bash
gnome-tweak-tool
```
Select `Typing -> Caps Lock key behavior -> Make Caps Lock an additinal Ctrl`

### Setting Mozc for Japanese input
First, at `System Settings -> Text Entry -> Input sources to use`,
Add `Japanese` and `Mozc`.

Next, click keyboard icon at upper right side of window, and select `Composition Mode -> Hiragana`.

Then, select `Configure Current Input Method -> Global Config -> Hotkey -> Trigger Input Method and change CTRL_SHIFT to Zenkakuhankaku`.
