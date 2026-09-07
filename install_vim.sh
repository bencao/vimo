#!/usr/bin/env bash
# Install vimo for Vim.
#
# ~/.vim is a real directory with only autoload/ and bundle/ symlinked into
# this repo, and ~/.vimrc points at ./vimrc. Keeping ~/.vim real matters:
# Vim writes undo history and netrw history inside it at runtime, and if the
# whole directory were a symlink into the repo that state would show up as
# untracked junk in git (this is how vim/.netrwhist got committed once).

set -euo pipefail

VIMO=$(cd "$(dirname "$0")" && pwd)

# Re-running must not clobber the genuine backup with vimo's own symlinks.
if [ -L "$HOME/.vimrc" ] && [ "$(readlink "$HOME/.vimrc")" = "$VIMO/vimrc" ]; then
  echo "vimo is already installed for Vim; nothing to do."
  exit 0
fi

if [ -e "$HOME/.vim" ] || [ -L "$HOME/.vim" ]; then
  rm -rf "$HOME/.vim_old"
  mv "$HOME/.vim" "$HOME/.vim_old"
  echo "moved existing ~/.vim to ~/.vim_old"
fi

if [ -e "$HOME/.vimrc" ] || [ -L "$HOME/.vimrc" ]; then
  rm -rf "$HOME/.vimrc_old"
  mv "$HOME/.vimrc" "$HOME/.vimrc_old"
  echo "moved existing ~/.vimrc to ~/.vimrc_old"
fi

mkdir -p "$HOME/.vim/undodir"

ln -s "$VIMO/vim/autoload" "$HOME/.vim/autoload"
ln -s "$VIMO/vim/bundle" "$HOME/.vim/bundle"
ln -s "$VIMO/vimrc" "$HOME/.vimrc"

echo "vimo installed for Vim."
