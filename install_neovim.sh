#!/usr/bin/env bash

VIMO=$(dirname $(realpath "$0"))

if [ -d ~/.config/nvim ]
then
  rm -rf ~/.config/nvim_old
  mv ~/.config/nvim ~/.config/nvim_old
fi

mkdir -p ~/.config/nvim

ln -s "$VIMO/vim/autoload" ~/.config/nvim/autoload
ln -s "$VIMO/vim/bundle" ~/.config/nvim/bundle
ln -s "$VIMO/vimrc" ~/.config/nvim/init.vim
