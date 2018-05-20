#!/bin/bash

# execute scripts
scripts=(
    install_apt.sh
    install_pip.sh
    setup.sh
    install_ffmpeg.sh
    install_tmux2.5.sh
    install_anaconda.sh
    install_mozc.sh
)

progress="";
loop_count=1;
for script in ${scripts[@]}; do
    # main script
    ./includes/$script;
    # show progress
    max_sharp=$(( $(tput cols) - 5))
    script_num=${#scripts[@]}
    for i in `seq $(expr $max_sharp / $script_num)`; do
        progress=$progress"#";
    done;
    echo -e "\033[0;32m$progress""  $(expr $(expr 100 \* $loop_count) / $script_num)%\033[0;39m"
    loop_count=$(( loop_count + 1 ))
done;
