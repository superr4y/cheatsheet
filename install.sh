#!/bin/bash

ln -s $(pwd)/i3 ~/.i3
ln -s $(pwd)/tmux/tmux.conf ~/.tmux.conf
ln -s $(pwd)/urxvt/Xresources ~/.Xresources
ln -s $(pwd)/vim/vimrc.txt ~/.vimrc
mkdir ~/.urxvt
mkdir ~/.urxvt/ext
ln -s $(pwd)/urxvt/urxvt_clipboard ~/.urxvt/ext/clipboard
