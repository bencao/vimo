#!/usr/bin/env bash
# Refresh vendored Vim bundles in-place from their upstream repositories.
#
# Usage:
#   update_bundles.sh                 # update every known bundle
#   update_bundles.sh nerdtree ag.vim # update only the listed bundles
#
# Each bundle is replaced by a fresh shallow clone; local edits are not preserved.
# 'vimo' is this repo's own bundle and is skipped.

set -uo pipefail
export GIT_TERMINAL_PROMPT=0

VIMO=$(cd "$(dirname "$0")" && pwd)
BUNDLE_DIR="$VIMO/vim/bundle"

[ -d "$BUNDLE_DIR" ] || { echo "bundle dir not found: $BUNDLE_DIR" >&2; exit 1; }

# name|upstream-url — sources: PLUGINS.md, plus vim-jst (not listed there).
BUNDLES=(
  "ag.vim|https://github.com/rking/ag.vim.git"
  "copilot.vim|https://github.com/github/copilot.vim.git"
  "ctrlp.vim|https://github.com/kien/ctrlp.vim.git"
  "elm.vim|https://github.com/lambdatoast/elm.vim.git"
  "nerdtree|https://github.com/scrooloose/nerdtree.git"
  "rust.vim|https://github.com/rust-lang/rust.vim.git"
  "supertab|https://github.com/ervandew/supertab.git"
  "typescript-vim|https://github.com/leafgarland/typescript-vim.git"
  "vim-afterglow|https://github.com/danilo-augusto/vim-afterglow.git"
  "vim-airline|https://github.com/vim-airline/vim-airline.git"
  "vim-better-whitespace|https://github.com/ntpeters/vim-better-whitespace.git"
  "vim-commentary|https://github.com/tpope/vim-commentary.git"
  "vim-easy-align|https://github.com/junegunn/vim-easy-align.git"
  "vim-easymotion|https://github.com/easymotion/vim-easymotion.git"
  "vim-fugitive|https://github.com/tpope/vim-fugitive.git"
  "vim-gitgutter|https://github.com/airblade/vim-gitgutter.git"
  "vim-go|https://github.com/fatih/vim-go.git"
  "vim-graphql|https://github.com/jparise/vim-graphql.git"
  "vim-javascript|https://github.com/pangloss/vim-javascript.git"
  "vim-jst|https://github.com/briancollins/vim-jst.git"
  "vim-multiple-cursors|https://github.com/terryma/vim-multiple-cursors.git"
  "vim-prettier|https://github.com/prettier/vim-prettier.git"
  "vim-repeat|https://github.com/tpope/vim-repeat.git"
  "vim-solidity|https://github.com/tomlion/vim-solidity.git"
  "vim-surround|https://github.com/tpope/vim-surround.git"
  "vim-terraform|https://github.com/hashivim/vim-terraform.git"
)

SKIP=(vimo)

url_for() {
  local want=$1 entry
  for entry in "${BUNDLES[@]}"; do
    if [ "${entry%%|*}" = "$want" ]; then
      printf '%s' "${entry#*|}"
      return 0
    fi
  done
  return 1
}

is_skipped() {
  local want=$1 s
  for s in "${SKIP[@]}"; do
    [ "$s" = "$want" ] && return 0
  done
  return 1
}

update_bundle() {
  local name=$1 url=$2
  local dest="$BUNDLE_DIR/$name"
  local stage="$BUNDLE_DIR/.$name.stage.$$"
  local backup="$BUNDLE_DIR/.$name.old.$$"

  rm -rf "$stage" "$backup"

  if ! git clone --depth=1 --quiet "$url" "$stage"; then
    rm -rf "$stage"
    return 1
  fi
  rm -rf "$stage/.git"

  if [ -d "$dest" ]; then
    mv "$dest" "$backup" || { rm -rf "$stage"; return 1; }
  fi
  if ! mv "$stage" "$dest"; then
    [ -d "$backup" ] && mv "$backup" "$dest"
    rm -rf "$stage"
    return 1
  fi
  rm -rf "$backup"
}

# Clean up staging/backup dirs from any previously interrupted run.
for leftover in "$BUNDLE_DIR"/.*.stage.* "$BUNDLE_DIR"/.*.old.*; do
  [ -e "$leftover" ] && rm -rf "$leftover"
done

# Build the target list: args if provided, else every known bundle.
if [ "$#" -gt 0 ]; then
  TARGETS=("$@")
else
  TARGETS=()
  for entry in "${BUNDLES[@]}"; do
    TARGETS+=("${entry%%|*}")
  done
fi

printf "Updating bundles in %s\n\n" "$BUNDLE_DIR"

ok=0; fail=0; skipped=0
for name in "${TARGETS[@]}"; do
  if is_skipped "$name"; then
    printf "  %-28s skipped (local bundle)\n" "$name"
    skipped=$((skipped + 1))
    continue
  fi
  if ! url=$(url_for "$name"); then
    printf "  %-28s unknown bundle (no upstream in script)\n" "$name"
    fail=$((fail + 1))
    continue
  fi
  printf "  %-28s " "$name"
  if update_bundle "$name" "$url"; then
    printf "updated\n"
    ok=$((ok + 1))
  else
    printf "FAILED (%s)\n" "$url"
    fail=$((fail + 1))
  fi
done

# Report any bundle dirs present on disk that the script doesn't know about.
if [ "$#" -eq 0 ]; then
  for dir in "$BUNDLE_DIR"/*/; do
    dname=$(basename "$dir")
    if ! url_for "$dname" >/dev/null && ! is_skipped "$dname"; then
      printf "  %-28s on disk but not in update list\n" "$dname"
    fi
  done
fi

printf "\nDone: %d updated, %d failed, %d skipped.\n" "$ok" "$fail" "$skipped"
[ "$fail" -eq 0 ]
