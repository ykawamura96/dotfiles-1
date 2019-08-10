#!/bin/bash

# directories which should be accessible
directories=(
    ~/.emacs.d/
    ~/.local/
)

for directory in ${directories[@]}; do
    chmod -R 777 $directory
    echo -e "change permission of $directory to 777";
done;
