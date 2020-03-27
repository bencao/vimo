#!/usr/bin/env bash

rm -r ~/.vim
rm ~/.vimrc

if [ -f ~/.vim_old ]
then
  mv ~/.vim_old ~/.vim
fi

if [ -f ~/.vimrc_old ]
then
  mv ~/.vimrc_old ~/.vimrc
fi
