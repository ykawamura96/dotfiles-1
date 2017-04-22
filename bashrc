source ~/.bashrc.orig
source ~/.bashrc.alias

## SVN and SSH
export SSH_USER=yamaguchi
export SVN_SSH="ssh -l ${SSH_USER}"

## Rviz for a laptop user
export OGRE_RTT_MODE=Copy

# if [ "$DISPLAY" != "" ]; then
#   xmodmap ~/.Xmodmap
# fi
xmodmap ~/.Xmodmap

# history search bindkey
_replace_by_history() {
  local l=$(HISTTIMEFORMAT= history | tac | sed -e 's/^\s*[0-9]\+\s\+//' | percol --query "$READLINE_LINE")
  READLINE_LINE="$l"
  READLINE_POINT=${#l}
}
bind -x '"\C-r": _replace_by_history'

# _rostopic_list_percol() {
#   local l=$(rostopic list | percol)
#   READLINE_LINE="$READLINE_LINE$l"
#   READLINE_POINT=${#l}
# }
# bind -x '"\C-o": _rostopic_list_percol'

#setup ROS
source /opt/ros/indigo/setup.bash
source ~/Projects/jsk_apc/devel/setup.bash
rossetip

# Google search
google () {
  search=""
  for term in $@; do
      search="$search%20$term"
  done
  google-chrome "http://www.google.com/search?q=$search"
}
