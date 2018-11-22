#!/bin/bash

# add apt repositories
repositories=(
    sylvain-pineau/kazam
    stebbins/handbrake-releases
)

for repository in ${repositories[@]}; do
    apt-add-repository ppa:$repository -y
done

apt update
