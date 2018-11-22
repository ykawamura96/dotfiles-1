#!/bin/bash

# execute scripts
scripts=(
    add_apt_repositories.sh
    install_apt.sh
    install_pip.sh
    unity_setup.sh
    install_emacs_24_4.sh
    install_ffmpeg.sh
    install_tmux2.5.sh
    install_anaconda.sh
    install_mozc.sh
)

progress="";
loop_count=1;
for script in ${scripts[@]}; do
    echo -e "\033[0;32mStarting $script\033[0;39m"
    # main script
    ./includes/$script;
    # show progress
    max_sharp=$(( $(tput cols) - 5))
    script_num=${#scripts[@]}
    for i in `seq $(expr $max_sharp / $script_num)`; do
        progress=$progress"#";
    done;
    echo -e "\033[0;32mDone $script\033[0;39m"
    echo -e "\033[0;32m$Progress""  $(expr $(expr 100 \* $loop_count) / $script_num)%\033[0;39m"
    loop_count=$(( loop_count + 1 ))
done;
