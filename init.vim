set nocompatible
filetype off

call plug#begin('~/.local/share/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'Raimondi/delimitMate'
Plug 'morhetz/gruvbox'
Plug 'sgur/vim-editorconfig'
Plug 'scrooloose/nerdtree'
Plug 'ervandew/supertab'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'ryanoasis/vim-devicons'
Plug 'neovim/nvim-lspconfig'
Plug 'simrat39/rust-tools.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/vim-vsnip'
call plug#end()

syntax enable
filetype plugin indent on

set hidden
set backspace=indent,eol,start
set backupcopy=yes
set laststatus=2
set ruler
set hlsearch
set ignorecase
set incsearch
set number
set display=lastline
set splitright
set splitbelow
set background=dark
set nowrap
set cursorline
set cursorcolumn
set listchars=tab:>-,trail:-
set list
set undofile
set backupdir=~/.config/nvim/tmp,.
set directory=~/.config/nvim/tmp,.
set undodir=~/.config/nvim/tmp,.

set mouse=a

"set tabstop=2
set shiftwidth=2
set softtabstop=2
"set smarttab
set expandtab

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

let g:javascript_enable_domhtmlcss=1
let g:jsx_ext_required=0

set termguicolors
set guifont=FantasqueSansMono\ Nerd\ Font\ 11
colorscheme gruvbox
let g:airline_powerline_fonts=1
let g:airline_theme='gruvbox'
set encoding=utf-8

let delimitMate_expand_cr = 2
let delimitMate_matchpairs = "(:),[:],{:},<:>"

let g:autofmt_autosave = 1

set completeopt=menuone,noinsert,noselect
set shortmess+=c
set signcolumn=yes
set updatetime=300
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })

lua require'rust-tools'.setup({})
lua require'lspconfig'.tsserver.setup({})

lua <<EOF
local nvim_lsp = require'lspconfig'
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- Installed sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
})
EOF
