# List of Plugins

Principles

- Prefer light plugin with 80% feature other than heavy plugin with 100% feature
- Plugins that have more than 1 dependencies are unacceptable
- Get rid of low priority plugins if possible

Definition of Importance

- **Essential**: Unable to have experience without it
- **High**: Significantly decrease of experience
- **Medium**: Sensible decrease of experience
- **Low**: Totally nice to have

| Plugin        | Value           | Importance | Alternatives |
| :------------ | :-------------- | :--------: | :----------- |
| [ALE](https://github.com/dense-analysis/ale) | Linting, fixing and LSP in one plugin: diagnostics in the sign column, `<leader>p` to format, `<leader>g` to jump to a definition. Replaces vim-prettier. | Essential | [coc.nvim](https://github.com/neoclide/coc.nvim) (84M and needs a node build step), [vim-lsp](https://github.com/prabirshrestha/vim-lsp) (needs 2-3 companion plugins) |
| [fzf](https://github.com/junegunn/fzf) + [fzf.vim](https://github.com/junegunn/fzf.vim) | Fuzzy file, buffer and line finding. Replaces CtrlP; needs the `fzf` binary. | Essential | CtrlP (slower on large trees) |
| [gruvbox-material](https://github.com/sainnhe/gruvbox-material) | Warm dark colorscheme with material design palette, airline integration | High | [tokyonight](https://github.com/folke/tokyonight.nvim) (cool-toned), [catppuccin](https://github.com/catppuccin/nvim) (pastel) |
| [NerdTree](https://github.com/scrooloose/nerdtree.git) | Tree view of project files and handy create/delete/update file operations | Essential | [netrw](http://www.vim.org/scripts/script.php?script_id=1075) (shipped with VIM but missing features) |
| [SuperTab](https://github.com/ervandew/supertab.git) | Autocomplete by hitting tabs which help increasing productivity | High | [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) (better experience but too heavy) |
| [targets.vim](https://github.com/wellle/targets.vim) | Richer text objects: `ci(` from outside the parens, `ci,` for an argument. | Medium | N/A |
| [undotree](https://github.com/mbbill/undotree) | Visualise and navigate the persistent undo history (`<leader>u`). | High | N/A |
| [VIM Abolish](https://github.com/tpope/vim-abolish) | `crs`/`crc`/`crm` case coercion and `:S` case-preserving substitution. | Medium | N/A |
| [VIM Airline](https://github.com/bling/vim-airline.git) | Beautiful status line | Medium | [Powerline](https://github.com/powerline/powerline) (too heavy) |
| [VIM better whitespace](https://github.com/ntpeters/vim-better-whitespace.git) | Highlights trailing whitespace; strip it with `:StripWhitespace` (auto-strip on save is available via `g:strip_whitespace_on_save` but deliberately left off, to avoid unrelated diffs in shared repos) | Medium | [VIM trailing whitespace](https://github.com/bronson/vim-trailing-whitespace) (older) |
| [VIM Commentary](https://github.com/tpope/vim-commentary.git) | Toggle comment/uncomment for selected lines | Medium | [NerdCommenter](https://github.com/scrooloose/nerdcommenter) |
| [VIM Cool](https://github.com/romainl/vim-cool) | Clears search highlighting automatically once the cursor leaves the match. | Low | N/A |
| [VIM Easy Align](https://github.com/junegunn/vim-easy-align.git) | Align code lines in a manner that ':' or '=' symbol in the same column | Medium | N/A |
| [VIM EasyMotion](https://github.com/easymotion/vim-easymotion.git) | Move to anywhere in screen in a few key strokes | High | N/A |
| [VIM Eunuch](https://github.com/tpope/vim-eunuch) | `:Rename`, `:Delete`, `:Mkdir`, `:Chmod` on the current file. | Medium | NERDTree file operations (require leaving the buffer) |
| [VIM Fugitive](https://github.com/tpope/vim-fugitive.git) | Git integration | Low | N/A |
| [VIM Gitgutter](https://github.com/airblade/vim-gitgutter.git) | Show file changes (diff to git HEAD) on the right | Low | [VIM Signify](https://github.com/mhinz/vim-signify) (support multiple VCS but we have only git install in container so it's not that useful) |
| [VIM Go](https://github.com/fatih/vim-go) | This plugin adds Go language support for Vim | Medium | N/A |
| [VIM Gutentags](https://github.com/ludovicchabant/vim-gutentags) | Regenerates ctags in the background, so `<leader>r` is not needed. Requires Universal Ctags; stays disabled otherwise. | High | N/A |
| [VIM Matchup](https://github.com/andymass/vim-matchup) | `%` matches `if`/`end`, `def`/`end` and tags, not just brackets. | Medium | N/A |
| [VIM Polyglot](https://github.com/sheerun/vim-polyglot) | Syntax and filetype detection for the languages that used to need a plugin each (elm, rust, typescript, javascript, graphql, solidity, terraform, jst). Its `go` and `autoindent` packs are disabled: vim-go and vim-sleuth are kept instead. | High | one plugin per language (what this replaced) |
| [VIM Repeat](https://github.com/tpope/vim-repeat.git) | Wrap plugin operations as a "Change" so it can be repeated or undoed | Medium | N/A |
| [VIM Rhubarb](https://github.com/tpope/vim-rhubarb) | `:GBrowse` opens the current line on GitHub. Depends on vim-fugitive. | Low | N/A |
| [VIM Sleuth](https://github.com/tpope/vim-sleuth) | Auto-detect indentation settings (tabs/spaces, width) per file | Medium | N/A |
| [VIM Surround](https://github.com/tpope/vim-surround.git) | Surround parentheses, brackets, quotes, XML tags, and more | Medium | N/A |
| [VIM Test](https://github.com/vim-test/vim-test) | Run the nearest test or the whole file from the editor (`<leader>n`, `<leader>N`). | Medium | N/A |
| [VIM Unimpaired](https://github.com/tpope/vim-unimpaired) | Bracket mappings: `]q`/`[q` through the quickfix list, `]b`/`[b` through buffers, `yo` option toggles. | High | N/A |
| [VIM Visual Multi](https://github.com/mg979/vim-visual-multi) | Select the same keyword in different lines, then change them together | High | N/A |
| [VIM Which Key](https://github.com/liuchengxu/vim-which-key) | `<leader>?` shows the available leader bindings, read from the real mappings. | Medium | the hand-maintained list in `:help vimo` |
