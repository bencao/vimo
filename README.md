# VIMO

Personalized NeoVim configurations

## Installation

Install NeoVim first if you haven't done so.

```
git clone https://github.com/bencao/vimo.git ~/.vimo

~/.vimo/install_neovim.sh
```

Also install [Universal Ctags](https://github.com/universal-ctags/ctags) for ctags based code navigation.

## Uninstallation

```
~/.vimo/uninstall_neovim.sh
rm -rf ~/.vimo
```

## Plugins Selection and Why

[List of Plugins](https://github.com/bencao/vimo/blob/master/PLUGINS.md)

## Vim Frequently Used Key Bindings

### Vimo Help

- [normal mode] <kbd>Space then h</kbd> open vimo help in VIM

### Movement Key Bindings

- [normal mode] <kbd>Space then f</kbd> quick jump to any words in the screen ![Demo](https://raw.githubusercontent.com/bencao/vimo/master/demo/easy_motion.gif)
- [normal mode] <kbd>Space then r</kbd> rebuild ctags for current directory
- [normal mode] <kbd>Ctrl + ]</kbd> jump to definition, need to rebuild ctags first
- [normal mode] <kbd>Ctrl + o</kbd> jump back to last cursor position
- [normal mode] <kbd>Ctrl + i</kbd> jump back to next cursor position
- [normal mode] <kbd>Space then Space</kbd> jump to and jump back between the current editing file and the last edited file

### Selection Key Bindings

- [normal mode] <kbd>Ctrl + n</kbd> press multiple times to select multiple current word and edit all of them at the same time ![Demo](https://raw.githubusercontent.com/bencao/vimo/master/demo/multi_cursor.gif)

### Comment Key Bindings

- [visual mode] <kbd>g then c</kbd> toggle comment

### Complete Key Bindings

- [insert mode] <kbd>Tab</kbd> auto complete with next candidate
- [insert mode] <kbd>Shift + Tab</kbd> auto complete with previous candidate

### Format/Alignment Key Bindings

- [visual mode] <kbd>space then p</kbd> format the file with Prettier
- [visual mode] <kbd>Enter then =</kbd> align selected lines by =
- [visual mode] <kbd>Enter then :</kbd> align selected lines by :

### Search & Navigations Bindings

- [normal mode] <kbd>Space then b</kbd> browse files, use <kbd>Ctrl + j</kbd>/<kbd>Ctrl + k</kbd> to move between candidates ![Demo](https://raw.githubusercontent.com/bencao/vimo/master/demo/ctrlp.gif)
- [normal mode] <kbd>Space then a</kbd> search text patterns in directories using Ag, the result will be shown in a [Quickfix](http://usevim.com/2012/08/24/vim101-quickfix/) window

### Windows Key Bindings

- [normal mode] <kbd>Space then t</kbd> toggle directory tree
- [normal mode] <kbd>Space then T</kbd> open directory tree and select current editing file ![Demo](https://raw.githubusercontent.com/bencao/vimo/master/demo/nerdtree.gif)
- [normal mode] <kbd>Space then s</kbd> split a new horizontal window to the left
- [normal mode] <kbd>Space then S</kbd> split a new vertical window to the top
- [normal mode] <kbd>Space then o</kbd> toggle window/fullscreen
- [normal mode] <kbd>Space then w</kbd> shortcut for :w
- [normal mode] <kbd>Space then W</kbd> shortcut for :w!
- [normal mode] <kbd>Space then q</kbd> shortcut for :q
- [normal mode] <kbd>Space then Q</kbd> shortcut for :q!
- [normal mode] <kbd>Ctrl + h</kbd>/<kbd>Ctrl + j</kbd>/<kbd>Ctrl + k</kbd>/<kbd>Ctrl + l</kbd> move left/up/down/right among windows ![Demo](https://raw.githubusercontent.com/bencao/vimo/master/demo/windowing.gif)

### List Available Key Bindings

- `:map` all mode key mappings
- `:nmap` normal mode key mappings
- `:vmap` visual mode key mappings
- `:imap` insert mode key mappings
