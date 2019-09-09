# VIMO

Personalized VIM/NeoVim configurations

## VIM Installation

```
git clone https://github.com/bencao/vimo.git ~/.vimo

cd ~/.vimo

ln -s "$(pwd)/vim" ~/.vim
ln -s "$(pwd)/vimrc" ~/.vimrc
```

## NeoVim Installation

```
git clone https://github.com/bencao/vimo.git ~/.vimo

cd ~/.vimo

mkdir -p ~/.config/nvim

ln -s "$(pwd)/vim/autoload" ~/.config/nvim/autoload
ln -s "$(pwd)/vim/bundle" ~/.config/nvim/bundle
ln -s "$(pwd)/vimrc" ~/.config/nvim/init.vim
```
