# dotfiles

## 1. Install minimum required packages
In this procedure, some `apt` and `pip` packages are installed.
```bash
sudo apt-get install git -y
cd ~
git clone https://github.com/708yamaguchi/dotfiles.git --recursive # use --recursive to install submodules
cd ./dotfiles/install_scripts
sudo ./install_main.sh  # this script may need to be executed twice
```

## 2. Create symbolic links to setting files
In this step, setting files for some packages get located in the form of symbolic link.
```
~/dotfiles/install_scripts/make_symbolic_link.sh
exec bash
```
At this stage, there are some errors which is solved at later stages.

## 3. Others
### Make Caps additional Ctrl
For ubuntu 16.04 or older
```bash
gnome-tweak-tool
```
Select `Typing -> Caps Lock key behavior -> Make Caps Lock an additinal Ctrl`

For ubuntu 18.04 or newer.
```bash
sudo emacs -nw /etc/default/keyboard
```
and write `XKBOPTIONS="ctrl:nocaps" `.

### Use google-chrome
First, get `.deb` file from [google website](https://www.google.co.jp/chrome/).

Next,
```bash
sudo apt-get install libappindicator1 -y
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
In `/etc/ssh/sshd_config`, (`sshd_config`, not `ssh_config`)
```
PermitRootLogin no
PasswordAuthentication no
```
Next, save the `~/.ssh/id_rsa.pub` to your github repository. (Change `GITHUB_USERNAME` to your github username)
```
GITHUB_USERNAME=708yamaguchi; curl -u $GITHUB_USERNAME --data '{"title":"'"$(whoami)@$(hostname)"'","key":"'"$(cat ~/.ssh/id_rsa.pub)"'"}' https://api.github.com/user/keys
```

If you want to ssh to your computer,
```bash
wget https://github.com/708yamaguchi.keys -O ~/.ssh/authorized_keys
```

After the above, restart ssh.
```bash
sudo service ssh restart
```
At last, make and edit `~/.ssh/authorized_keys` and `~/.ssh/config`

### Setting ntp
For security, write `disable monitor` to `/etc/ntp.conf`. Then,
```bash
sudo service ntp restart
```

### Install ROS
For ROS installation, follow instructions in [ROS Installation](http://wiki.ros.org/ROS/Installation). At this stage, you install minimum required packages for ROS.

After installing ROS, install some packages for `JSK` environment:
```bash
exec bash
sudo apt-get install python-catkin-tools -y
sudo apt-get install ros-$(rosversion -d)-jsk-tools -y
sudo apt-get install ros-$(rosversion -d)-rosemacs -y
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
rosdep install --from-paths . --ignore-src -y -r  # make sure that $ROS_DISTRO is correctly set.
cd ..
catkin build
exec bash # if you cannot source your workspace, type 'sudo updatedb'. This command updates database for 'locate' command.
```


### Setting Mozc for Japanese input
- For Unity (16.04 or older)

First, at `System Settings -> Text Entry -> Input sources to use`,
Add only `Mozc`. (Do NOT add `japanese`. This is to switch Japanese input and English input within `Mozc`)
Also, do not forget to check box of `Show current input source in the menu bar`. This is an important step for switching input sources.

Next, click keyboard icon at upper right side of window, and select `Composition Mode -> Hiragana`.

Then, select `Configure Current Input Method -> Global Config -> Hotkey -> Trigger Input Method and change CTRL_SHIFT to Zenkakuhankaku`.

- For GNOME (18.04 or newer)

At `Settings -> Region & Language -> Input Sources`, add `Japanese (Mozc)` and remove `Japanese`.

Then, push `Manage Installed Languages` button.

To set ibus-mozc default keyboard layout as Japanese one, edit the settings file (`/usr/share/ibus/component/mozc.xml`) like below:
```
# <layout>default</layout>
<layout>jp</layout>
```

Finally, you can change input sources by Zenkaku-hankaku key.

### Displaying System Load Indicator
- For Unity (16.04 or older)

First, start `System Load Indicator` from `Search your computer` (ubuntu icon on the left side of desctop).
Then, `System Load Indicator` icon appears at the upper right side of desctop, so click it and set preferences.

- For GNOME (18.04 or newer)

Open Tweaks by typing `gnome-tweaks`. Then, select `Extensions` and turn on the `System-monitor`. After that, you can show system-monitor on desktop.
