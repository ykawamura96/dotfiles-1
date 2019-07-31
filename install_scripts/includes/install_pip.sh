#!/bin/bash

# pip install
pip install --upgrade pip
pip_packages=(
    flake8
    matplotlib
    numpy
    percol
    pyaudio
)
for pip_package in ${pip_packages[@]}; do
    pip install $pip_package;
done
