set nocompatible
filetype off

syntax enable 
filetype plugin indent on

set hidden
set backspace=indent,eol,start
set backupcopy=yes
set laststatus=2
set ruler
set number
set display=lastline
set splitright
set splitbelow
set background=dark
set nowrap
set cursorline
set cursorcolumn

set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab

let g:javascript_enable_domhtmlcss=1
let g:jsx_ext_required=0

set guifont=Fantasque_Sans_Mono:h15:cANSI
colorscheme gruvbox
let g:airline_powerline_fonts=1
let g:airline_theme='gruvbox'
set encoding=utf-8

let delimitMate_expand_cr = 2
let delimitMate_matchpairs = "(:),[:],{:},<:>"

autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
