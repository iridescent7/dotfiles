set encoding=utf8
set fileformats=unix,dos,mac
set termguicolors

set number
set linebreak
set showbreak=+++
set showmatch

set hlsearch
set smartcase
set ignorecase
set incsearch

set autoindent
set expandtab
set shiftwidth=4
set smartindent
set smarttab
set tabstop=4
set softtabstop=4

set confirm
set ruler
set wildmenu
set lazyredraw
set magic

set mouse=a
set clipboard=unnamedplus
set scrolloff=7
set cmdheight=1
set laststatus=2

set undolevels=1000
set history=500
set hidden

set backspace=indent,eol,start
set whichwrap+=<,>,h,l

filetype plugin on
filetype indent on

syntax enable

call plug#begin(stdpath('data') . '/plugged')
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'sainnhe/sonokai'
call plug#end()

let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1

colorscheme sonokai

let mapleader = ","

nnoremap <leader>w :w<cr>
nnoremap <c-_> :let @/ = ""<cr>

nnoremap <leader>n :NERDTreeFocus<cr>
nnoremap <leader>t :NERDTreeToggle<cr>
