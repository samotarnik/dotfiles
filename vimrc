
set nocompatible    " use iMproved

" vim-plug config
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'jnurmine/Zenburn'
Plug 'ctrlpvim/ctrlp.vim'

" the next command automatically executes
" - filetype plugin indent on (filetype specific indents)
" - syntax enable
call plug#end()

" colors
set t_Co=256
colorscheme zenburn

" basics
set expandtab           " tabs are spaces
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set shiftwidth=4        " number of space characters inserted for indentation

set nu                  " first, line numbers
set rnu                 " then relative line numbers
set cursorline          " highlight current line
set colorcolumn=120     " marker at column 120
set showmatch           " highlight matching [{()}]
set autoindent          " automatic indentation of next line

set lazyredraw          " do not redraw screen during macros (smoother)

set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase          " ignore case in lowercase search queries
set smartcase           " switch to case sensitive when uppercase is used

set backspace=indent,eol,start  " make backspace behave 'normally'

set wrap
set linebreak

set directory=$HOME/.vim/swapfiles//

set encoding=utf-8

" strip trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" airline
"set laststatus=2        " airline appears all the time
"let g:airline#extensions#tabline#enabled = 1

" https://github.com/vim-airline/vim-airline/issues/124
"set ttimeoutlen=0




set autoread
set history=1000


" hard mode
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>



" remap :x
:cnoreabbrev x w<bar>bd


let g:go_fmt_command = "goimports"
let g:go_fmt_options = "-w"
