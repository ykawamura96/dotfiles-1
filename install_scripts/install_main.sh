#!/bin/bash

# apt-get install
apt_packages=(
    apt
    aptitude
    emacs
    ibus-mozc
    indicator-multiload
    ipython
    git
    gnome-tweak-tool
    htop
    ntp
    python-pip
    ssh
    subversion
    wget
)

for apt_package in ${apt_packages[@]}; do
    apt-get -y install $apt_package;
done

# pip install
pip install --upgrade pip
pip_packages=(
    matplotlib
    numpy
    percol
)
for pip_package in ${pip_packages[@]}; do
    apt-get -y install $pip_package;
done

# from web source
curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
