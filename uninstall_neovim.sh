#!/usr/bin/env bash
# Remove the vimo NeoVim install and restore whatever was there before it.

set -uo pipefail

NVIM_CONFIG="$HOME/.config/nvim"

# Only remove it if this is in fact a vimo install, so an unrelated nvim
# config is never eaten. bundle/ being a symlink is the marker.
if [ -d "$NVIM_CONFIG" ] && [ ! -L "$NVIM_CONFIG/bundle" ] && [ ! -L "$NVIM_CONFIG" ]; then
  echo "~/.config/nvim does not look like a vimo install (bundle/ is not a symlink)." >&2
  echo "Refusing to remove it. Delete it by hand if that is what you want." >&2
  exit 1
fi

# rm -rf unlinks the autoload/bundle symlinks rather than following them,
# so this cannot reach into the repo.
rm -rf "$NVIM_CONFIG"

# -d, not -f: the backup is a directory. The old `[ -f ... ]` test was never
# true, so this restore silently never ran.
if [ -d "$HOME/.config/nvim_old" ]; then
  mv "$HOME/.config/nvim_old" "$NVIM_CONFIG"
  echo "restored ~/.config/nvim from ~/.config/nvim_old"
fi

echo "vimo uninstalled for NeoVim."
