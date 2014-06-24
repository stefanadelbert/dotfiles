set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'mileszs/ack.vim'
Bundle 'chriskempson/base16-vim'
Bundle 'lambdalisue/nose.vim'

filetype plugin indent on

colorscheme desert
set background=dark

set encoding=utf-8
set showmode
set showcmd
set hidden
set ttyfast
set laststatus=2
set history=1000
set undofile
set undoreload=10000
set listchars=tab:᚛\·,eol:¬,extends:»,precedes:«
set showbreak=‣
set splitbelow
set splitright
set fillchars=diff:⣿,vert:│
set title
set backupskip=/tmp/*,/private/tmp/*"
set cursorline
set cursorcolumn

set tabstop=4
set shiftwidth=4
set hlsearch
set incsearch
set expandtab

syntax on

" Filetype settings
au BufRead,BufNewFile makefile.rules set filetype=make
au BufRead,BufNewFile *.qml set filetype=qml

" Buffer navigation
nmap <C-Left> <C-w><Left>
nmap <C-Right> <C-w><Right>
nmap <C-Up> <C-w><Up>
nmap <C-Down> <C-w><Down>

" History navigation
nmap <M-Left> <C-o>
nmap <M-Right> <C-i>

" NERDTree settings
let g:NERDTreeDirArrows=0
let g:NERDTreeChDirMode=2
nmap <leader>nf :NERDTreeFind<CR>
map  <F9> :NERDTreeToggle<CR>

" Unique sort of lines in a paragraph - useful for sorting include directives
nmap <leader>su Vip:sort u<CR>

nmap <leader>ev :tabedit $MYVIMRC<CR>

" Quickfix
nmap <leader>me :copen 20<CR>
nmap <leader>mw :cclose<CR>
nmap <F7> :cprevious<CR>
nmap <F8> :cnext<CR>

" CtrlP: Fuzzy file finding
nmap <leader>ff :CtrlP<CR>
nmap <leader>fb :CtrlPBuffer<CR>
