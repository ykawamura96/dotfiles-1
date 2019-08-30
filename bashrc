# for tmux
# if [ $SHLVL = 1 ]; then
#     export PATH=$HOME/.local/bin:$PATH
#     tmux
# fi

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

# prompt setup
parse_branch() {
  local branch
  branch=`git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
  [ "$branch" != "" ] && printf "\e[0m on \e[31m$branch\e[0m"
}

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;37m\]\t\[\033[00m\]\[\e[1;34m\] \[\033[01;34m\]\w\[\033[00m\]\[\e[1;34m\]\[\e[m\]$(parse_branch)\n\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

## Alias Commands
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias grep='grep --exclude-dir=.svn'

# source ~/.bashrc.orig

## SVN and SSH
export SSH_USER=yamaguchi
export SVN_SSH="ssh -l ${SSH_USER}"

## Rviz for a laptop user
export OGRE_RTT_MODE=Copy

# if [ "$DISPLAY" != "" ]; then
#   xmodmap ~/.Xmodmap
# fi
xmodmap ~/.Xmodmap &>/dev/null

# history search bindkey
_replace_by_history() {
  local l=$(HISTTIMEFORMAT= history | tac | sed -e 's/^\s*[0-9]\+\s\+//' | percol --query "$READLINE_LINE")
  READLINE_LINE="$l"
  READLINE_POINT=${#l}
}
bind -x '"\C-r": _replace_by_history'

_rostopic_list_percol() {
  local l=$(rostopic list | percol)
  READLINE_LINE="$READLINE_LINE$l"
  READLINE_POINT=${#l}
}
bind -x '"\C-o": _rostopic_list_percol'

# image_view
image_view () {
  rosrun image_view image_view image:=$@
}

# Google search
google () {
  search=""
  for term in $@; do
      search="$search%20$term"
  done
  google-chrome "http://www.google.com/search?q=$search"
}

chrome() {
    google-chrome $@
}


source ~/.bashrc.alias

# setup ROS (this must be after PS1 settings)
source /opt/ros/$(ls /opt/ros)/setup.bash
source $(locate .catkin_tools 2>/dev/null | sed -n 1p | sed s#.catkin_tools#devel/setup.bash#) 2>/dev/null
echo "CMAKE_PREFIX_PATH: ""$CMAKE_PREFIX_PATH"
# setup ROS_MASTER_URI
rosdefault
# setup ROS_IP and ROS_HOSTNAME
rossetip
# for catkin source
source `catkin locate --shell-verbs`
# set ROS default editor as emacs -nw
export EDITOR='emacs -nw'

# # ignore TouchPad
# if [ "$(xinput | grep TouchPad)" != "" ]; then
# id=$(xinput | grep TouchPad | grep -E -o "id=[[:digit:]]+" | grep -E -o "[[:digit:]]+")
# if [ "$id" = "" ]
# then
#     echo "no touchpad found."
#     # exit 0
# fi
# status=$(xinput list-props 10 | grep "Device Enabled" | cut -f3)
# if [ $status -eq 0 ]
# then
#     xinput set-prop $id "Device Enabled" 1
#     # echo "enabling device $id"
# else
#     xinput set-prop $id "Device Enabled" 0
#     # echo "disabling device $id"
# fi
# fi


# you can run `roseus` configuring by "$HOME/jskeus/eus"
if [ -d "$HOME/jskeus" ]; then
    export EUSDIR=$HOME/jskeus/eus
    export ARCHDIR=Linux64
    export PATH=$EUSDIR/$ARCHDIR/bin:$EUSDIR/$ARCHDIR/lib:$PATH
    export LD_LIBRARY_PATH=$EUSDIR/$ARCHDIR/bin:$LD_LIBRARY_PATH
    echo "EUSDIR: $EUSDIR"
fi

# for ping with detailed information
function pg(){
    # set default value of $1
    host=${1:-"8.8.8.8"};
    while true; do rslt=`ping -w 1 -c 1 $host | grep 'bytes from '`;
        if [ $? -gt 0 ]; then echo -e "`date +'%Y-%m-%d %H:%M:%S'` $host Request timed out.";
        else echo "`date +'%Y-%m-%d %H:%M:%S'` $host`echo $rslt | cut -d  ':' -f 2`";
            sleep 1;
        fi;
    done;
}

# for connect/disconnect to network
function con(){
    # if number of argments is 'g'reater 't'han 0, disconnect from wlan0
    if [ $# -gt 0 ]; then
        nmcli c up id $1;
        if [ $? -eq 0 ]; then
            echo "connect to $1";
        # else
        #     echo "cannot connect to $1";
        fi;
    else
        network=${2:-"wlan0"};
        nmcli d disconnect iface $network;
        if [ $? -eq 0 ]; then
            echo "disconnect from $network"
        # else
        #     echo "cannot disconnect from $network";
        fi;
    fi;
}

function activate(){
    version=${1:-"python3.5"};
    export PATH=~/.pyenv/versions/anaconda3-4.3.1/bin:$PATH;
    source ~/.pyenv/versions/anaconda3-4.3.1/bin/activate;
    source activate $version;
    export VIRTUAL_ENV_DISABLE_PROMPT=1;
    }

function mvtk_activate(){
    source ~/mvtk/.anaconda/bin/activate;
}

# for terminal color
export TERM=xterm

# for display setting
export DISPLAY=:0

## CUDA and cuDNN paths
export PATH=/usr/local/cuda/bin:${PATH}
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH}

## for japanese input using ibus-mozc
# killall ibus-daemon > /dev/null
# ibus-daemon -d -x

# record date and time in history
HISTTIMEFORMAT='%Y-%m-%dT%T%z '

# inaba sensei
export OPENHRPHOME=~/prog/OpenHRP

# export path
export PATH=$PATH:$HOME/.local/bin

# make emacs tags if euslisp package exists and the tags does not exist
rospack find euslisp >/dev/null 2>&1
if [ $? -eq 0 ]; then
    ls /tmp/TAGS >/dev/null 2>&1
    if [ $? -ne 0 ]; then
        (cd /tmp;
         for f in $(find $(rospack find euslisp) -name "*.l"); do
             etags $f --append
         done)
    fi
fi

# complete all files when pressing Tab after typing 'google-chrome' in bash
function _complete_all_files(){
    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $(compgen -W "$(ls *)" -- $cur) )
}
complete -F _complete_all_files google-chrome

function jaxon(){
    echo "[Launch Choreonoid]"
    echo "rtmlaunch hrpsys_choreonoid_tutorials jaxon_red_choreonoid.launch USE_VISION:=False";
    echo ""
    echo "[Control JAXON]"
    echo "roseus \`rospack find hrpsys_ros_bridge_tutorials\`/euslisp/jaxon_red-interface.l"
    echo "(jaxon_red)                  ;; set *jaxon_red*"
    echo "(jaxon_red-init)             ;; set *ri*"
    echo "(setq *robot* *jaxon_red*)   ;; set *robot*"
    source /opt/ros/$ROS_DISTRO/setup.bash;
    source $HOME/agent-system/choreonoid_ws/devel/setup.bash;
    export CNOID_INSTALL_DIR=/usr/local/choreonoid;
    export CNOID_RTM_DIR=/opt/ros/${ROS_DISTRO};
    export PKG_CONFIG_PATH=${CNOID_INSTALL_DIR}/lib/pkgconfig:$PKG_CONFIG_PATH;
    export PATH=${CNOID_INSTALL_DIR}/bin:$PATH;
}
