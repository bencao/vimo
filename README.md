# VIMO

Personalized VIM/NeoVim configurations

## VIM Installation

```
git clone current project

cd project

ln -s "$(pwd)/vim" ~/.vim
ln -s "$(pwd)/vimrc" ~/.vimrc
```

## NeoVim Installation

```
git clone current project

cd project

mkdir -p ~/.config/nvim

ln -s "$(pwd)/vim/autoload" ~/.config/nvim/autoload
ln -s "$(pwd)/vim/bundle" ~/.config/nvim/bundle
ln -s "$(pwd)/vimrc" ~/.config/nvim/init.vim
```
