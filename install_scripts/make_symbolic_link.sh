# symbolic link
dotfiles_path=$HOME/dotfiles
eval rm -f ~/.bashrc
eval ln -sfn  $dotfiles_path/bash/bashrc ~/.bashrc
eval rm -f ~/.bashrc.orig
eval ln -sfn  $dotfiles_path/bash/bashrc.orig ~/.bashrc.orig
eval rm -f ~/.bashrc.alias
eval ln -sfn $dotfiles_path/bash/bashrc.alias ~/.bashrc.alias
eval rm -f ~/.gitconfig
eval ln -sf  $dotfiles_path/gitconfig ~/.gitconfig
eval rm -rf ~/.percol.d
eval mkdir ~/.percol.d
eval ln -sfn $dotfiles_path/percol.d/rc.py ~/.percol.d/rc.py
eval rm -f ~/.tmux.conf
eval ln -sf  $dotfiles_path/tmux.conf ~/.tmux.conf
eval rm -f ~/.emacs
eval ln -sf  $dotfiles_path/emacs ~/.emacs
eval rm -rf ~/.profile
eval ln -sf  $dotfiles_path/profile ~/.profile
eval rm -rf ~/.Xmodmap
eval ln -sf $dotfiles_path/Xmodmap ~/.Xmodmap
# eval rm -rf ~/.xinputrc
# eval ln -sf $dotfiles_path/xinputrc ~/.xinputrc
# eval rm -rf ~/.uim.d
# eval ln -sf $dotfiles_path/uim.d ~/.uim.d
eval rm -rf ~/.condarc
eval ln -sf $dotfiles_path/condarc ~/.condarc
