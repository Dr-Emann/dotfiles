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
set incsearch
set hlsearch
set autoindent

" Backups
set backup
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
set writebackup

" Tab stuff:
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

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

inoremap jj <Esc>
nnoremap JJJJ <Nop>

map N Nzz
map n nzz
nmap <silent> <F5> :set list!<CR>

filetype plugin indent on
