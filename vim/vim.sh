#!/bin/bash

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
ln -s $(pwd)/vimrc.txt ~/.vimrc
mkdir ~/.vim/color
mkdir ~/.vim/spell
cp de.utf-8.spl ~/.vim/spell/
