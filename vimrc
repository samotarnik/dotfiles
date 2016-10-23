
set nocompatible

execute pathogen#infect()

set t_Co=256
colorscheme zenburn

syntax enable           " enable syntax processing
filetype plugin indent on

set expandtab           " tabs are spaces
set tabstop=2           " number of visual spaces per TAB
set softtabstop=2       " number of spaces in tab when editing
set shiftwidth=2        " number of space characters inserted for indentation

" airline
set laststatus=2        " airline appears all the time
let g:airline#extensions#tabline#enabled = 1

set rnu                 " relative line numbers
set cursorline          " highlight current line
set colorcolumn=80      " marker at column 80      
set showmatch           " highlight matching [{()}]
set autoindent

" make backspace behave 'normally'
set backspace=indent,eol,start


set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase
set smartcase

set wrap
set linebreak

set directory=$HOME/.vim/swapfiles//

set encoding=utf-8

set autoread
set history=1000

" save in insert mode
inoremap <C-s> <ESC>:w<CR>i

" hard mode
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>





