set nocompatible " be iMproved, required
filetype off " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim' " let Vundle manage Vundle, required

Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'bling/vim-airline'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'kana/vim-scratch'
Plugin 'oplatek/Conque-Shell'

call vundle#end() " required
filetype plugin indent on " required

set t_Co=256
color xoria256

syntax on

set hlsearch
set tabstop=4
set shiftwidth=4
set noexpandtab
set backspace=2

set ignorecase
set smartcase
set incsearch

set nobackup
set nowritebackup
set noswapfile

set wildmenu

" Setup custom filetype
autocmd BufNewFile,BufRead *.analysis set filetype=analysis
autocmd BufNewFile,BufRead *.config set filetype=config
autocmd BufNewFile,BufRead *.xml set filetype=xml
autocmd BufNewFile,BufRead *.msc set filetype=msc syntax=xmath

" Airline configuration
set laststatus=2
let g:airline_left_sep=''
let g:airline_right_sep=''

" UltiSnips configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

" vim-scratch settings
let g:scratch_show_command="botright vsplit | hide buffer"
nnoremap <F12> :ScratchOpen<CR>
nnoremap <C-F12> :ScratchClose<CR>

" Conque-Shell
nnoremap <S-F12> :ConqueTermTab bash<CR>

" Mapping for forcing a redraw.
nnoremap <leader>r :redraw!<CR>

" Quickfix mappings.
nmap <F7> :cprevious<CR>
nmap <F8> :cnext<CR>
nmap <F10> :botright copen<CR>
nmap <C-F10> :cclose<CR>

" Toggle NERDTree on the F9 key
noremap <F9> :NERDTreeToggle<CR>
nmap <silent> <leader>st :NERDTreeFind<CR>
let NERDTreeDirArrows=0
let NERDTreeWinSize=50

nmap <leader>ev :tabedit ~/.vim/ftplugin<CR>:vsplit $MYVIMRC<CR>

" Toggle list
nmap <leader>sl :set invlist<CR>
" Toggle scrollbind
nmap <leader>sb :set scrollbind!<CR>: set scrollbind?<CR>

" CtrlP settings
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:30,results:30'
" CltrP for files below the current working directory
nmap <silent> <leader>ff :let g:ctrlp_default_input=''<CR>:CtrlP<CR>
" CtrlP for all open buffers
nmap <silent> <leader>fb :let g:ctrlp_default_input=''<CR>:CtrlPBuffer<CR>
" CtrlP in directory mode
nmap <silent> <leader>fd :let g:ctrlp_default_input=''<CR>:CtrlPDir<CR>
" CtrlP in MRU mode
nmap <silent> <leader>fm :let g:ctrlp_default_input=''<CR>:CtrlPMRUFile<CR>
" CtrlP using the word under the cursor
nmap <silent> <leader>fg :let g:ctrlp_default_input=expand('<cword>')<CR>:CtrlP<CR>

" Ag for file under cursor
nmap <silent> <leader>ag :Ag! <cword><CR>
" Ag for last search term
nmap <silent> <leader>ah :Ag! histget("search")<CR>
" Ag for user input
nmap <silent> <leader>af :Ag! 
" Ag for file under cursor in cpp files
nmap <silent> <leader>agc :Ag! --cpp <cword><CR>
" Ag for last search term in cpp files
nmap <silent> <leader>ahc :Ag! --cpp histget("search")<CR>
" Ag for user input in cpp
nmap <silent> <leader>afc :Ag! --cpp 

" Convenient shortcuts for navigating between windows
nmap <C-Left> <C-W><Left>
nmap <C-Right> <C-W><Right>
nmap <C-Up> <C-W><Up>
nmap <C-Down> <C-W><Down>
nmap <C-S-Left> <C-W>R
nmap <C-S-Right> <C-W>r

" Delete whitespace at the end of all lines in the current buffer.
nmap <leader>dw :%s/\v\s+$<CR>
