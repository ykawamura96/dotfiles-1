#!/bin/bash

# apt-get install
apt_packages=(
    apt
    aptitude
    # emacs
    ibus-mozc
    indicator-multiload
    ipython
    git
    gnome-tweak-tool
    htop
    lm-sensors
    ntp
    python-pip
    ssh
    subversion
    xsel
    wget
)

for apt_package in ${apt_packages[@]}; do
    apt -y install $apt_package;
done
