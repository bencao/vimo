""" Global settings

" turn on syntax highlight
syntax on

" trun on true color
set termguicolors

" highlight search
set hlsearch

" disable mouse reporting
set mouse=

" filetype based indentation
filetype plugin indent on
" fallback to autoindent
" which does nothing more than copy the indentation from the previous line
" when starting a new line
set autoindent

" expand tab using space characters, each tab equals to 2 spaces
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2

" a special column at the 80 character warns lines that are too long
set colorcolumn=80

" encoding settings
set encoding=utf-8

" more natural split opening
set splitbelow
set splitright

" please take care here of potential to lose some changes
" due to we map the current host user into the container,
" when saving to container's directories there will be permission errors
" so right now we simply don't save swapfile
set noswapfile
set viminfo=

" read .vimrc from project folder
set exrc

" disable safe write
set backupcopy=yes

" automatically read file changes
set autoread

" do not generate files ending with ~
" set nowritebackup

" Display extra whitespace
" set list listchars=tab:,trail:·,nbsp:·

""" Improved defaults

" line numbers (relative + absolute current line)
set number
set relativenumber

" smart search: case-insensitive unless uppercase is typed
set ignorecase
set smartcase
set incsearch

" allow switching buffers without saving
set hidden

" command-line completion
set wildmenu
set wildmode=longest:full,full

" keep context lines visible when scrolling
set scrolloff=8
set sidescrolloff=8

" highlight current line
set cursorline

" always show the sign column (prevents gitgutter jitter)
set signcolumn=yes

" faster gitgutter + CursorHold events (default 4000ms is too slow)
set updatetime=250

" redundant with airline
set noshowmode

" persistent undo across sessions
set undofile
set undodir=~/.config/nvim/undodir

" system clipboard integration (macOS)
set clipboard=unnamedplus

" always show status line
set laststatus=2

""" Package manager settings

" pathogen - the runtime for Vim plugins
execute pathogen#infect()
Helptags

""" Shortcut settings

" set space as leader key
let mapleader=" "

"" Leader prefixed bindings

" double leader to switch between current and last edit file
nnoremap <leader><leader> <c-^>

" open vimo key binding help
nnoremap <leader>h :help vimo<CR>

" open new splits
nnoremap <leader>s :vsp<CR>
nnoremap <leader>S :sp<CR>

" write file
nnoremap <leader>w :w<CR>
nnoremap <leader>W :w!<CR>

" quit
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q!<CR>

" paste
" nnoremap <leader>p :set paste<CR>
" nnoremap <leader>P :set nopaste<CR>

" tree
function! ToggleNERDTreeFind()
  if g:NERDTree.IsOpen()
    NERDTreeClose
  else
    NERDTreeFind
  endif
endfunction

nnoremap <silent> <leader>t :call ToggleNERDTreeFind()<CR>
nnoremap <silent> <leader>T :NERDTreeToggle<CR>

" zoom
function! s:ZoomToggle() abort
  if exists('t:zoomed') && t:zoomed
    execute t:zoom_winrestcmd
    let t:zoomed = 0
  else
    let t:zoom_winrestcmd = winrestcmd()
    resize
    vertical resize
    let t:zoomed = 1
  endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <leader>o :ZoomToggle<CR>

" browse files/buffers
nnoremap <leader>b :CtrlPMixed<CR>

" search text patterns
nnoremap <leader>a :Rg<SPACE>
nnoremap <leader>k :Rg "\b<C-R><C-W>\b"<CR>:cw<CR>

" rebuild ctags
nnoremap <leader>r :!ctags --recurse=yes --exclude=.git --exclude=.next --exclude=node_modules --exclude=_book .<CR>

" moving between windows
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

if executable('rg')
  " Use ripgrep over grep
  set grepprg=rg\ --vimgrep\ --smart-case
  set grepformat=%f:%l:%c:%m

  " Use rg in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'rg --files --hidden --glob "!.git" %s'

  " rg is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
  let g:ctrlp_regexp = 1
endif

" search command using grepprg
command! -nargs=+ -complete=file -bar Rg silent! grep! <args> | cwindow | redraw!
nnoremap \ :Rg<SPACE>

""" EasyMotion settings

" configs
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1

" shortcuts
map <leader>f <Plug>(easymotion-bd-w)
map  / <Plug>(easymotion-sn)
omap  / <Plug>(easymotion-tn)

""" EasyAlign settings

" shortcuts
vmap <Enter> <Plug>(EasyAlign)
" Align GitHub-flavored Markdown tables
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

""" Color settings
let g:gruvbox_material_background = 'medium'
let g:gruvbox_material_foreground = 'material'
let g:gruvbox_material_better_performance = 1
colorscheme gruvbox-material

""" Prettier settings

" max line length that prettier will wrap on
" Prettier default: 80
let g:prettier#config#print_width = 80

" number of spaces per indentation level
" Prettier default: 2
let g:prettier#config#tab_width = 2

" use tabs over spaces
" Prettier default: false
let g:prettier#config#use_tabs = 'false'

" print semicolons
" Prettier default: true
let g:prettier#config#semi = 'true'

" single quotes over double quotes
" Prettier default: false
let g:prettier#config#single_quote = 'false'

" print spaces between brackets
" Prettier default: true
let g:prettier#config#bracket_spacing = 'true'

" put > on the last line instead of new line
" Prettier default: false
let g:prettier#config#jsx_bracket_same_line = 'false'

" none|es5|all
" Prettier default: none
let g:prettier#config#trailing_comma = 'none'

" flow|babylon|typescript|css|less|scss|json|graphql|markdown
" Prettier default: babylon
"let g:prettier#config#parser = 'babylon'

" cli-override|file-override|prefer-file
let g:prettier#config#config_precedence = 'prefer-file'

" always|never|preserve
let g:prettier#config#prose_wrap = 'preserve'
