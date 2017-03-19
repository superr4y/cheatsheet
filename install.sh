#!/bin/bash

ln -s "$(pwd)"/i3 ~/.i3
ln -s "$(pwd)"/tmux/tmux.conf ~/.tmux.conf
ln -s "$(pwd)"/urxvt/Xresources ~/.Xresources
ln -s "$(pwd)"/vim/vimrc.txt ~/.vimrc
mkdir -p ~/.vim/syntax
ln -s "$(pwd)"/vim/rust.vim ~/.vim/syntax/rust.vim
mkdir -p ~/.urxvt/ext
ln -s "$(pwd)"/urxvt/urxvt_clipboard ~/.urxvt/ext/clipboard
ln -s "$(pwd)"/zshrc ~/.zshrc
mkdir -p ~/.zsh/cache

mkdir ~/bin
ln -s $(pwd)/wakeup_fix.sh ~/bin/wakeup_fix.sh
ln -s $(pwd)/brightness.sh ~/bin/brightness.sh
ln -s $(pwd)/i3/rofi-wrapper.sh ~/bin/rofi-wrapper.sh
ln -s $(pwd)/tmux_sessions.sh ~/bin/tmux_sessions.sh

mkdir ~/.config/htop
ln -s $(pwd)/htoprc ~/.config/htop/htoprc

mkdir ~/.config/termite
ln -s $(pwd)/termite.conf ~/.config/termite/config

#mkdir ~/.config/dunst
#ln -s "$(pwd)"/dunstrc ~/.config/dunst/dunstrc
