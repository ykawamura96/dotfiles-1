#!/bin/bash

# directories which should be accessible
directories=(
    ~/.emacs.d
    ~/.local
)

for directory in ${directories[@]}; do
    chown -R $(whoami) $directory;
    echo -e "change own of $directory";
done;
