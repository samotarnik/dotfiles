
set nocompatible    " use iMproved

" vim-plug config
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'jnurmine/Zenburn'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ap/vim-buftabline'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'davidhalter/jedi-vim'

" the next command automatically executes
" - filetype plugin indent on (filetype specific indents)
" - syntax enable
call plug#end()

" colors
set t_Co=256
set background=dark
colorscheme zenburn

" basics
set expandtab           " tabs are spaces
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set shiftwidth=4        " number of space characters inserted for indentation
set linespace=4         " space between lines, must be an int

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

" inoremap <C-S> <ESC>:w<CR>i
nnoremap <C-W> :bdelete<CR>

" buffers
set hidden
nnoremap <C-N> :bprev<CR>
nnoremap <C-M> :bnext<CR>

" ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|target|pkg|build|node_modules)$',
  \ 'file': '\v\.(class|so|pyc)$',
  \ }

" easymotion minimal config
"
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)




let g:go_fmt_command = "goimports"
let g:go_fmt_options = "-w"
