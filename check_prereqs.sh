#!/usr/bin/env bash
# Report on the external tools the plugins shell out to.
#
# Nothing here is fatal: vimo loads without any of it, and each plugin that
# needs a missing tool degrades quietly. This just tells you what you are
# missing and how to get it, instead of leaving you to discover it when a
# key binding silently does nothing.
#
# Run directly, or via install_vim.sh / install_neovim.sh.

ok=0; missing=0

report() { # name, status(ok|missing|bad), detail, fix
  case "$2" in
    ok)      printf "  \033[32m*\033[0m %-18s %s\n" "$1" "$3"; ok=$((ok+1)) ;;
    *)       printf "  \033[33m!\033[0m %-18s %s\n" "$1" "$3"
             printf "    %-16s   -> %s\n" "" "$4"; missing=$((missing+1)) ;;
  esac
}

echo "Checking external tools vimo's plugins use:"
echo

# ripgrep: :Grep, \, <leader>a, <leader>k, and fzf's :Rg
if command -v rg >/dev/null 2>&1; then
  report ripgrep ok "$(rg --version | head -1)"
else
  report ripgrep missing "not found - :Grep and <leader>a/k will not work" \
    "brew install ripgrep"
fi

# fzf binary: <leader>b, <leader>B, <leader>l
if command -v fzf >/dev/null 2>&1; then
  report fzf ok "$(fzf --version | head -1)"
else
  report fzf missing "not found - <leader>b/B/l need the fzf binary" \
    "brew install fzf"
fi

# ctags: <leader>r and vim-gutentags both need Universal/Exuberant, not BSD.
# macOS and the Xcode command line tools ship a BSD ctags that rejects -R.
if command -v ctags >/dev/null 2>&1; then
  ctags_ver=$(ctags --version 2>&1 | head -1)
  case "$ctags_ver" in
    *"Universal Ctags"*|*"Exuberant Ctags"*)
      report ctags ok "$ctags_ver" ;;
    *)
      report ctags bad "$(command -v ctags) is BSD ctags; it rejects -R" \
        "brew install universal-ctags   (gutentags stays off until then)" ;;
  esac
else
  report ctags missing "not found - <leader>r and gutentags need it" \
    "brew install universal-ctags"
fi

# node: ALE's prettier fixer and most JS/TS linters
if command -v node >/dev/null 2>&1; then
  report node ok "$(node --version)"
else
  report node missing "not found - ALE's prettier fixer and JS linters need it" \
    "brew install node"
fi

echo
if [ "$missing" -eq 0 ]; then
  echo "All $ok tools present."
else
  echo "$ok present, $missing missing. vimo works either way; the lines above"
  echo "are the features you will not have until you install them."
fi
exit 0
