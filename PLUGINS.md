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
| [ag.vim](https://github.com/rking/ag.vim) | Search text patterns in directories | Essential | [CtrlSF](https://github.com/dyng/ctrlsf.vim) (not utilizing the vim Quickfix List) |
| [Copilot](https://github.com/github/copilot.vim) | GitHub Copilot provides autocomplete-style suggestions from an AI pair programmer as you code. | High | |
| [CtrlP](https://github.com/kien/ctrlp.vim.git) | Quickly navigate to any files given a fuzzy matching pattern | Essential | [Unite](https://github.com/Shougo/unite.vim.git) (sometimes hung for big projects) |
| [elm.vim](https://github.com/lambdatoast/elm.vim) | Elm lang support: syntax highlighting and indent | Medium | N/A |
| [NerdTree](https://github.com/scrooloose/nerdtree.git) | Tree view of project files and handy create/delete/update file operations | Essential | [netrw](http://www.vim.org/scripts/script.php?script_id=1075) (shipped with VIM but missing features) |
| [rust.vim](https://github.com/rust-lang/rust.vim) | Rust lang support: syntax highlighting and indent | Medium | N/A |
| [SuperTab](https://github.com/ervandew/supertab.git) | Autocomplete by hitting tabs which help increasing productivity | High | [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) (better experience but too heavy) |
| [typescript-vim](https://github.com/leafgarland/typescript-vim) | Typescript support: syntax highlighting and indent | Medium | N/A |
| [VIM Afterglow](https://github.com/danilo-augusto/vim-afterglow) | Vim adaptation of the famous Afterglow theme from Sublime Text 2/3 | High | N/A |
| [VIM Airline](https://github.com/bling/vim-airline.git) | Beautiful status line | Medium | [Powerline](https://github.com/powerline/powerline) (too heavy) |
| [VIM better whitespace](https://github.com/ntpeters/vim-better-whitespace.git) | Showing trailing white space and auto strip when quit | Medium | [VIM trailing whitespace](https://github.com/bronson/vim-trailing-whitespace) (older) |
| [VIM Commentary](https://github.com/tpope/vim-commentary.git) | Toggle comment/uncomment for selected lines | Medium | [NerdCommenter](https://github.com/scrooloose/nerdcommenter) |
| [VIM Easy Align](https://github.com/junegunn/vim-easy-align.git) | Align code lines in a manner that ':' or '=' symbol in the same column | Medium | N/A |
| [VIM EasyMotion](https://github.com/easymotion/vim-easymotion.git) | Move to anywhere in screen in a few key strokes | High | N/A |
| [VIM GraphQL](https://github.com/jparise/vim-graphql.git) | GraphQL syntax highlight | Medium | N/A |
| [VIM Javascript](https://github.com/pangloss/vim-javascript.git) | JavaScript bundle for vim, this bundle provides syntax highlighting and improved indentation | Medium | N/A |
| [VIM Fugitive](https://github.com/tpope/vim-fugitive.git) | Git integration | Low | N/A |
| [VIM Gitgutter](https://github.com/airblade/vim-gitgutter.git) | Show file changes (diff to git HEAD) on the right | Low | [VIM Signify](https://github.com/mhinz/vim-signify) (support multiple VCS but we have only git install in container so it's not that useful) |
| [VIM Go](https://github.com/fatih/vim-go) | This plugin adds Go language support for Vim | Medium | N/A |
| [VIM Multiple Cursor](https://github.com/terryma/vim-multiple-cursors.git) | Select the same keyword in different lines, then change them together | High | N/A |
| [VIM Prettier](https://github.com/prettier/vim-prettier) | A vim plugin wrapper for prettier, pre-configured with custom default prettier settings. | Essential | N/A |
| [VIM Repeat](https://github.com/tpope/vim-repeat.git) | Wrap plugin operations as a "Change" so it can be repeated or undoed | Medium | N/A |
| [VIM Solidity](https://github.com/tomlion/vim-solidity) | Solidity syntax highlighting | Medium | N/A |
| [VIM Surround](https://github.com/tpope/vim-surround.git) | Surround parentheses, brackets, quotes, XML tags, and more | Medium | N/A |
| [VIM Terraform](https://github.com/hashivim/vim-terraform) | Terraform syntax highlighting | Medium | N/A |
