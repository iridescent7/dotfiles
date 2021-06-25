set encoding=utf8
set fileformats=unix,dos,mac
set termguicolors

set number
set relativenumber
set cursorline
set linebreak
set showbreak=+++
set showmatch
set showtabline=2

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

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufWinEnter * silent NERDTreeMirror

autocmd InsertEnter * :set nornu
autocmd InsertLeave * :set rnu

filetype plugin on
filetype indent on

syntax enable

call plug#begin(stdpath('data') . '/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-ragtag'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'sainnhe/sonokai'
call plug#end()

let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1

colorscheme sonokai

let mapleader = ";"

nnoremap <leader>w :w<cr>
nnoremap <c-_> :let @/ = ""<cr>

nnoremap <c-n> :bn<cr>
nnoremap <c-p> :bp<cr>

nnoremap <leader>n :NERDTreeFocus<cr>
nnoremap <leader>t :NERDTreeToggle<cr>

nnoremap <cr> o<esc>

inoremap {<cr> {<cr>}<esc>O
inoremap {;<cr> {<cr>};<esc>O
