#!/usr/bin/env bash
# Remove the vimo Vim install and restore whatever was there before it.

set -uo pipefail

# Only remove ~/.vim if it is in fact a vimo install, so this never eats an
# unrelated ~/.vim. bundle/ being a symlink is the marker.
if [ -d "$HOME/.vim" ] && [ ! -L "$HOME/.vim/bundle" ] && [ ! -L "$HOME/.vim" ]; then
  echo "~/.vim does not look like a vimo install (bundle/ is not a symlink)." >&2
  echo "Refusing to remove it. Delete it by hand if that is what you want." >&2
  exit 1
fi

# rm -rf unlinks the autoload/bundle symlinks rather than following them,
# so this cannot reach into the repo.
rm -rf "$HOME/.vim"
rm -f "$HOME/.vimrc"

# -d / -e, not -f: the ~/.vim_old backup is a directory.
if [ -d "$HOME/.vim_old" ]; then
  mv "$HOME/.vim_old" "$HOME/.vim"
  echo "restored ~/.vim from ~/.vim_old"
fi

if [ -e "$HOME/.vimrc_old" ]; then
  mv "$HOME/.vimrc_old" "$HOME/.vimrc"
  echo "restored ~/.vimrc from ~/.vimrc_old"
fi

echo "vimo uninstalled for Vim."
