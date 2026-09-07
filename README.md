# VIMO

Personalized VIM/NeoVim configurations

The same `vimrc` drives both editors; it branches on `has('nvim')` only where
the two genuinely differ (clipboard register, undo directory, truecolor
termcap). Tested on NeoVim 0.12 and Vim 9.1.

## Installation

Install NeoVim or Vim first if you haven't done so.

<details><summary>NeoVim</summary>
<p>

```
git clone https://github.com/bencao/vimo.git ~/.vimo

~/.vimo/install_neovim.sh
```

</p>
</details>

<details><summary>VIM</summary>
<p>

```
git clone https://github.com/bencao/vimo.git ~/.vimo

~/.vimo/install_vim.sh
```

For system-clipboard integration your Vim needs to be built with `+clipboard`
(check with `vim --version | grep clipboard`). The macOS system Vim qualifies;
`brew install vim` also works.

</p>
</details>

External tools the plugins use:

```
brew install ripgrep universal-ctags fzf node
```

None are required to start vimo, and each install script ends by running
`check_prereqs.sh`, which reports what is missing and which feature it costs
you. Two notes: macOS ships a BSD `ctags` that rejects `-R`, so `<leader>r`
and vim-gutentags both need Universal Ctags (gutentags stays disabled until
it is installed), and ALE's Prettier fixer needs `node`.

## Uninstallation

<details><summary>NeoVim</summary>
<p>

```
~/.vimo/uninstall_neovim.sh
rm -rf ~/.vimo
```

</p>
</details>

<details><summary>VIM</summary>
<p>

```
~/.vimo/uninstall_vim.sh
rm -rf ~/.vimo
```

</p>
</details>

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

- [normal/visual mode] <kbd>Space then p</kbd> format the file (ALE; uses Prettier for JS/TS/CSS/JSON/YAML/Markdown, gofmt for Go, rustfmt for Rust)
- [visual mode] <kbd>Enter then =</kbd> align selected lines by =
- [visual mode] <kbd>Enter then :</kbd> align selected lines by :

### Search & Navigations Bindings

- [normal mode] <kbd>Space then b</kbd> fuzzy-find files (fzf), use <kbd>Ctrl + j</kbd>/<kbd>Ctrl + k</kbd> to move between candidates ![Demo](https://raw.githubusercontent.com/bencao/vimo/master/demo/ctrlp.gif)
- [normal mode] <kbd>Space then B</kbd> fuzzy-find open buffers
- [normal mode] <kbd>Space then l</kbd> fuzzy-find lines in the current buffer
- [normal mode] <kbd>Space then a</kbd> search text patterns in directories using Rg (ripgrep), the result will be shown in a [Quickfix](http://usevim.com/2012/08/24/vim101-quickfix/) window
- [normal mode] <kbd>Space then k</kbd> search the word under the cursor (whole words only), same Quickfix window
- [normal mode] <kbd>\</kbd> same as <kbd>Space then a</kbd>

### Diagnostics and Code Intelligence Bindings

ALE provides these; each needs the relevant linter or language server on `PATH`.

- [normal mode] <kbd>Space then d</kbd> show the full diagnostic under the cursor
- [normal mode] <kbd>Space then g</kbd> go to the definition under the cursor
- [normal mode] <kbd>]</kbd> then <kbd>w</kbd> / <kbd>[</kbd> then <kbd>w</kbd> next/previous diagnostic
- [insert mode] <kbd>Tab</kbd> completes from the language server when one is running, otherwise from keywords in the buffer

### Undo, Tests and Discoverability

- [normal mode] <kbd>Space then u</kbd> toggle the undo history tree
- [normal mode] <kbd>Space then n</kbd> run the test nearest the cursor
- [normal mode] <kbd>Space then N</kbd> run every test in the file
- [normal mode] <kbd>Space then ?</kbd> show the available leader bindings

### Bracket Bindings

From vim-unimpaired, plus a few from other plugins:

- [normal mode] <kbd>]</kbd>/<kbd>[</kbd> then <kbd>q</kbd> next/previous quickfix entry (pairs with <kbd>Space then a</kbd>)
- [normal mode] <kbd>]</kbd>/<kbd>[</kbd> then <kbd>b</kbd> next/previous buffer
- [normal mode] <kbd>]</kbd>/<kbd>[</kbd> then <kbd>c</kbd> next/previous git hunk (gitgutter)
- [normal mode] <kbd>y</kbd> then <kbd>o</kbd> then an option letter toggles that option, e.g. <kbd>yow</kbd> for wrap

### Windows Key Bindings

- [normal mode] <kbd>Space then t</kbd> toggle directory tree, revealing the current file ![Demo](https://raw.githubusercontent.com/bencao/vimo/master/demo/nerdtree.gif)
- [normal mode] <kbd>Space then T</kbd> toggle directory tree
- [normal mode] <kbd>Space then s</kbd> split a new vertical window to the right
- [normal mode] <kbd>Space then S</kbd> split a new horizontal window below
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
