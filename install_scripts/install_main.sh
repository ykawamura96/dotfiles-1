#!/bin/bash

# apt-get install
apt-get -y install apt
apt-get -y install aptitude
apt-get -y install emacs
apt-get -y install ibus-mozc
apt-get -y install indicator-multiload
apt-get -y install ipython
apt-get -y install git
apt-get -y install gnome-tweak-tool
apt-get -y install htop
apt-get -y install ntp
apt-get -y install python-pip
apt-get -y install ssh
apt-get -y install subversion
apt-get -y install wget


# pip install
pip install --upgrade pip
pip install matplotlib
pip install numpy
pip install percol

# from web source
curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
