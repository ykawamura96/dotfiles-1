#!/bin/bash

# apt-get install
apt_packages=(
    apt
    aptitude
    # emacs
    git
    gnome-tweak-tool
    handbrake
    handbrake-cli
    handbrake-gtk
    htop
    ibus-mozc
    indicator-multiload
    ipython
    kazam
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
