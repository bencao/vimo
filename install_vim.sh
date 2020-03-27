#!/usr/bin/env bash

VIMO=$(dirname $(realpath "$0"))

if [ -d ~/.vim ]
then
  rm -rf ~/.vim_old
  mv ~/.vim ~/.vim_old
fi

if [ -f ~/.vimrc ]
then
  rm ~/.vimrc_old
  mv ~/.vimrc ~/.vimrc_old
fi

ln -s "$VIMO/vim" ~/.vim
ln -s "$VIMO/vimrc" ~/.vimrc
