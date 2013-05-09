filetype indent on
filetype plugin indent on
syntax on
set t_Co=256
colorscheme Tomorrow-Night
set encoding=utf-8
set nocompatible
set modelines=0
set showmode
set showcmd
set backup
set backupdir=/private/tmp
set dir=/private/tmp
set undodir=~/.vim/vimundo
set number
set expandtab
set shiftwidth=2
set softtabstop=2
set incsearch
set ofu=syntaxcomplete#Complete
set omnifunc=csscomplete#CompleteCSS
set ft=scss.css
set noundofile
execute pathogen#infect()
autocmd vimenter * if !argc() | NERDTree | endif
nnoremap <silent> <F8> :TlistToggle<CR>
nnoremap <silent> <C-n> :NERDTreeToggle<CR>
let g:trailertrash_blacklist = ['__Calendar', '^http:']
