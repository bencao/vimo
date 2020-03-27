#!/usr/bin/env bash

rm -r ~/.config/nvim

if [ -f ~/.config/nvim_old ]
then
  mv ~/.config/nvim_old ~/.config/nvim
fi
