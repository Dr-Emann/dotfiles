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
set incsearch
set hlsearch
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

inoremap jj <Esc>
nnoremap JJJJ <Nop>

map N Nzz
map n nzz
nmap <silent> <F5> :set list!<CR>

vnoremap <expr>y "my\"" . v:register . "y`y"

function! ToggleMovement(firstOp, thenOp)
  let pos = getpos('.')
  execute "normal! " . a:firstOp
  if pos == getpos('.')
    execute "normal! " . a:thenOp
  endif
endfunction

" The original carat 0 swap
nnoremap <silent> 0 :call ToggleMovement('^', '0')<CR>

" How about ; and ,
nnoremap <silent> ; :call ToggleMovement(';', ',')<CR>
nnoremap <silent> , :call ToggleMovement(',', ';')<CR>

" How about H and L
nnoremap <silent> H :call ToggleMovement('H', 'L')<CR>
nnoremap <silent> L :call ToggleMovement('L', 'H')<CR>

" How about G and gg
nnoremap <silent> G :call ToggleMovement('G', 'gg')<CR>
nnoremap <silent> gg :call ToggleMovement('gg', 'G')<CR>

let g:vim_json_syntax_conceal = 0

filetype plugin indent on

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
