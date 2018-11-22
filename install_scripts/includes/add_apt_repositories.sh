#!/bin/bash

# add apt repositories
repositories=(
    mc3man/trusty-media  # for ffmpeg
    stebbins/handbrake-releases  # for handbrake
    sylvain-pineau/kazam  # for kazam
)

for repository in ${repositories[@]}; do
    apt-add-repository ppa:$repository -y
done

apt update
