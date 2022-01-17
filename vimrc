""" Global settings

" turn on syntax highlight
syntax on

" trun on true color
set termguicolors

" highlight search
set hlsearch

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
set termencoding=utf-8

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

let g:ale_linters = { 'javascript': ['eslint', 'flow'], }

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
nnoremap <leader>a :Ag<SPACE>
nnoremap <leader>k :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>

" rebuild ctags
nnoremap <leader>r :!ctags -R --exclude=.git --exclude=node_modules --exclude=_book .<CR>

" moving between windows
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif

  let g:ctrlp_regexp = 1
endif

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
colorscheme afterglow

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
