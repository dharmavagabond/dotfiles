filetype indent on
filetype plugin indent on
colorscheme Tomorrow-Night
syntax enable
set t_Co=256
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
set scrolloff=3
set incsearch
set ofu=syntaxcomplete#Complete
set omnifunc=csscomplete#CompleteCSS
set ft=scss.css
set noundofile
set autoindent
execute pathogen#infect()
autocmd vimenter * if !argc() | NERDTree | endif
nnoremap <silent> <F8>  :TlistToggle<CR>
nnoremap <silent> <C-n> :NERDTreeToggle<CR>
nnoremap <silent> <C-t> :Trim<CR>
let g:trailertrash_blacklist = ['__Calendar', '^http:']
let g:airline_powerline_fonts = 1
" fdoc is yaml
autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
