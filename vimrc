if &shell =~# 'fish$'
    if executable("zsh")
        set shell=zsh
    elseif executable("bash")
        set shell=bash
    else
        set shell=sh
    endif
endif

" Tab stuff:
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

execute pathogen#infect()

set nocompatible
set backspace=indent,eol,start
set history=50
set ruler

" Colors
set background=dark
colorscheme solarized
let g:solarized_visibility = "normal"
let g:solarized_termtrans = 1
syntax on

set showcmd
set autoindent

" Backups
set backup
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
set writebackup


" Spellcheck
if version >= 700
   set spl=en spell
   set nospell
endif

" Keep 8 lines of context when possible
set scrolloff=8

" searching
set showmatch
set ignorecase
set smartcase
set incsearch
set hlsearch

set ttyfast

set wildmenu
set wildmode=list:longest,full

set mouse=a
set number

nnoremap JJJJ <Nop>

map N Nzz
map n nzz
nnoremap <silent> <F5> :set list!<CR>

vnoremap <expr>y "my\"" . v:register . "y`y"

let g:vim_json_syntax_conceal = 0

filetype plugin indent on

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0

" My custom things
inoremap jk <Esc>
let mapleader = "\<space>"
nnoremap OO O<cr><up>
nnoremap <leader>ve :split $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>
nnoremap <leader>fw :w<cr>
nnoremap <leader>" viw<esc>a"<esc>hBi"<esc>lel
nnoremap <leader>$ viw<esc>a}<esc>hbi{<esc>lel
nnoremap <leader>w <c-w>
