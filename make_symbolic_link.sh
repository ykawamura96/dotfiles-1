# symbolic link
dotfiles_path=$HOME/dotfiles
eval ln -sfn  $dotfiles_path/bash/bashrc ~/.bashrc
eval ln -sfn  $dotfiles_path/bash/bashrc.orig ~/.bashrc.orig
eval ln -sfn $dotfiles_path/bash/bashrc.alias ~/.bashrc.alias
eval ln -sf  $dotfiles_path/gitconfig ~/.gitconfig
eval rm -rf ~/.percol.d
eval mkdir ~/.percol.d
eval ln -sfn $dotfiles_path/percol.d/rc.py ~/.percol.d/rc.py
eval ln -sf  $dotfiles_path/tmux.conf ~/.tmux.conf
eval ln -sf  $dotfiles_path/emacs ~/.emacs
eval ln -sf  $dotfiles_path/profile ~/.profile
eval ln -sf $dotfiles_path/Xmodmap ~/.Xmodmap
eval ln -sf $dotfiles_path/xinputrc ~/.xinputrc
eval ln -s $dotfiles_path/uim.d ~/.uim.d
