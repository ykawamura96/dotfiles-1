#!/bin/bash

# symbolic link
dotfiles_path=$HOME/dotfiles
symbolic_links=(
    bashrc
    bashrc.alias
    bashrc.orig
    condarc
    emacs
    gitconfig
    percol.d/rc.py
    profile
    tmux.conf
    # uim.d
    # xinputrc
    Xmodmap
)

for symbolic in ${symbolic_links[@]}; do
    eval rm -rf ~/"."$(echo $symbolic | awk -F'[/]' '{print $1}')
    if [ $(echo $symbolic | awk -F'[/]' '{print $2}') ]; then
        eval mkdir ~/"."${symbolic%$(echo $symbolic | awk -F'[/]' '{print $NF}')}
    fi
    eval ln -sfn $dotfiles_path/$symbolic ~/"."$symbolic
done
