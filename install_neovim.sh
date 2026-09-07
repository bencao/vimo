#!/usr/bin/env bash
# Install vimo for NeoVim.
#
# ~/.config/nvim is a real directory with only autoload/ and bundle/ symlinked
# into this repo, and init.vim points at ./vimrc. Keeping the directory real
# matters: nvim writes undo history there at runtime, and if the whole thing
# were a symlink into the repo that state would land in git.

set -euo pipefail

VIMO=$(cd "$(dirname "$0")" && pwd)
NVIM_CONFIG="$HOME/.config/nvim"

# Re-running must not clobber the genuine backup with vimo's own symlinks.
if [ -L "$NVIM_CONFIG/init.vim" ] &&
   [ "$(readlink "$NVIM_CONFIG/init.vim")" = "$VIMO/vimrc" ]; then
  echo "vimo is already installed for NeoVim; nothing to do."
  exit 0
fi

if [ -e "$NVIM_CONFIG" ] || [ -L "$NVIM_CONFIG" ]; then
  rm -rf "$HOME/.config/nvim_old"
  mv "$NVIM_CONFIG" "$HOME/.config/nvim_old"
  echo "moved existing ~/.config/nvim to ~/.config/nvim_old"
fi

mkdir -p "$NVIM_CONFIG/undodir"

ln -s "$VIMO/vim/autoload" "$NVIM_CONFIG/autoload"
ln -s "$VIMO/vim/bundle" "$NVIM_CONFIG/bundle"
ln -s "$VIMO/vimrc" "$NVIM_CONFIG/init.vim"

echo "vimo installed for NeoVim."
echo

# Report on the external tools the plugins shell out to. Advisory only:
# a missing tool disables a feature, it does not break the install.
"$VIMO/check_prereqs.sh" || true
