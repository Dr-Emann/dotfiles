execute pathogen#infect()
set nocompatible
set backspace=indent,eol,start
set backup
set history=50
set ruler

" Colors
colorscheme solarized
set background=dark
let g:solarized_visibility = "normal"

set showcmd
set incsearch
syntax on
set hlsearch
set autoindent

" Backups
set backup
set backupdir=~/.vim/backup

" Tab stuff:
set smarttab
set noexpandtab
set shiftwidth=3
set tabstop=3
set softtabstop=3

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
