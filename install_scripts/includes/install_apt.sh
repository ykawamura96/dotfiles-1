#!/bin/bash

# apt-get install
apt_packages=(
    apt
    aptitude
    curl
    emacs
    software-properties-common
    ffmpeg  # after software-properties-common
    git
    gnome-tweak-tool
    handbrake-cli
    handbrake-gtk
    handbrake  # after handbrake-cli/gtk
    htop
    ibus-mozc
    indicator-multiload
    ipython
    kazam
    lm-sensors
    ntp
    python-pip
    silversearcher-ag
    ssh
    subversion
    vlc
    xsel
    wget
)

for apt_package in ${apt_packages[@]}; do
    apt -y install $apt_package;
done
