#!/bin/bash

# apt-get install
apt_packages=(
    apt
    aptitude
    colordiff
    curl
    emacs
    software-properties-common
    ffmpeg  # after software-properties-common
    git
    handbrake-cli
    handbrake-gtk
    handbrake  # after handbrake-cli/gtk
    htop
    ibus-mozc
    indicator-multiload
    ipython
    kazam
    libappindicator1 # before installing google-chrome.deb
    lm-sensors
    net-tools
    ntp
    portaudio19-dev # for pyaudio. before pyaudio (in pip install)
    python-pip
    ruby
    silversearcher-ag
    ssh
    subversion
    tree
    vlc
    xsel
    wget
)

version=$(lsb_release -rs)
if [ ${version%.*} -gt 16 ]; then # 18.04 or newer
    apt_packages+=(gnome-tweaks)
else                              # 16.04 or older
    apt_packages+=(gnome-tweak-tool)
fi

for apt_package in ${apt_packages[@]}; do
    apt -y install $apt_package;
done
