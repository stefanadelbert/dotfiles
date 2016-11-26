set nocompatible " be iMproved, required
filetype off " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim' " let Vundle manage Vundle, required

Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'vimwiki/vimwiki'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-vinegar'
Plugin 'jiangmiao/auto-pairs'

call vundle#end() " required
filetype plugin indent on " required

set t_Co=256
let base16colorspace=256
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

set undofile
set undodir=~/.vim/undodir

" Disable the arrow keys in normal, insert and visual modes.
"noremap <Up> <NOP>
"noremap <Down> <NOP>
"noremap <Left> <NOP>
"noremap <Right> <NOP>
"inoremap <Up> <NOP>
"inoremap <Down> <NOP>
"inoremap <Left> <NOP>
"inoremap <Right> <NOP>
"vnoremap <Up> <NOP>
"vnoremap <Down> <NOP>
"vnoremap <Left> <NOP>
"vnoremap <Right> <NOP>

" This reduces the delay between hitting ESC and switching to normal mode
set timeoutlen=1000 ttimeoutlen=0

" Setup custom filetype
autocmd BufNewFile,BufRead *.analysis set filetype=analysis
autocmd BufNewFile,BufRead *.config set filetype=config
autocmd BufNewFile,BufRead *.xml set filetype=xml
autocmd BufNewFile,BufRead *.msc set filetype=msc syntax=xmath

" Spelling settings
set spellfile=$HOME/.vim/spell/en.utf-8.add

" Airline configuration
set laststatus=2
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_inactive_collapse=1
"let g:airline_theme='kalisi'

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

" Mapping for forcing a redraw.
nnoremap <leader>r :redraw!<CR>

" Quickfix mappings.
nmap <F10> :botright copen<CR>
nmap <C-F10> :cclose<CR>

" VIMRC and FTPLUGIN
nmap <leader>ev :tabedit ~/.vim/ftplugin<CR>:vsplit $MYVIMRC<CR>

" Toggle scrollbind
nmap <leader>sb :set scrollbind!<CR>:set scrollbind?<CR>

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
nmap <silent> <leader>ah :AgFromSearch<CR>
" Ag for user input
nmap <silent> <leader>af :Ag!<SPACE>
" Ag for file under cursor in cpp files
nmap <silent> <leader>agc :Ag! --cpp <cword><CR>
" Ag for last search term in cpp files
nmap <silent> <leader>ahc :Ag! --cpp histget("search")<CR>
" Ag for user input in cpp
nmap <silent> <leader>afc :Ag! --cpp<SPACE>

" Convenient shortcuts for navigating between windows
nmap <C-Left> <C-W><Left>
nmap <C-Right> <C-W><Right>
nmap <C-Up> <C-W><Up>
nmap <C-Down> <C-W><Down>
" Change window size
nmap <C-S-Left> <C-W><
nmap <C-S-Right> <C-W>>

" Delete whitespace at the end of all lines in the current buffer.
nmap <leader>dw :%s/\v\s+$<CR>

" vimwiki settings
let personal_wiki = {'maxhi': 0, 'css_name': 'style.css', 'auto_export': 0, 'diary_index': 'diary', 'template_default': 'wiki', 'nested_syntaxes': {}, 'diary_sort': 'desc', 'path': '/home/stefan/wiki/personalwiki/', 'diary_link_fmt': '%Y-%m-%d', 'template_ext': '.html', 'syntax': 'default', 'custom_wiki2html': '', 'index': 'index', 'diary_header': 'Journal', 'ext': '.wiki', 'path_html': '/home/stefan/wiki/personalwiki_html/', 'temp': 0, 'template_path': '/home/stefan/wiki/templates/', 'list_margin': -1, 'diary_rel_path': 'diary/'}
let work_wiki = {'maxhi': 0, 'css_name': 'style.css', 'auto_export': 0, 'diary_index': 'diary', 'template_default': 'wiki', 'nested_syntaxes': {}, 'diary_sort': 'desc', 'path': '/home/stefan/wiki/workwiki/', 'diary_link_fmt': '%Y-%m-%d', 'template_ext': '.html', 'syntax': 'default', 'custom_wiki2html': '', 'index': 'index', 'diary_header': 'Journal', 'ext': '.wiki', 'path_html': '/home/stefan/wiki/workwiki_html/', 'temp': 0, 'template_path': '/home/stefan/wiki/templates/', 'list_margin': -1, 'diary_rel_path': 'diary/'}
let g:vimwiki_list = [personal_wiki, work_wiki]

" vim-fugitive mappings abd config
nmap <leader>gs :Gstatus<CR><C-W>T
nmap <leader>gd :Gdiff<CR>
command! Greview :Git! diff --staged
nnoremap <leader>gr :Greview<CR>
autocmd User fugitive if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' | nnoremap <buffer> .. :edit %:h<CR> | endif
autocmd BufReadPost fugitive://* set bufhidden=delete

" BUILD
let g:buildcmdprefix='bb schroot'
" This function will build the provided target using a build command
" and populate the quickfix window with the build output.
" Call this function with a build_system, target and optional options.
" This function relies on g:buildcmdprefix to be set.
" This function relies on ~/.scripts/makeargs.py existing.
if !exists("*Build")
	function! Build(build_system, options, target)
		" See http://github.com/vshih/vim-make for the basis of this function.

		let l:buildcmd = g:buildcmdprefix . ' ' . a:build_system

		" Compile arguments.
		let l:options = strlen(a:options) ? ' ' . a:options : ''
		let l:target = strlen(a:target) ? ' ' . a:target : ''
		let l:title = l:buildcmd . l:options . l:target

		" Set up the quickfixlist
		botright copen
		call setqflist([])
		let w:quickfix_title = 'Building... ' . l:title
		redraw!

		" Do the build
		silent cexpr system(l:buildcmd . l:options . l:target)

		" Set quickfix title now that the build is complete
		botright copen
		let w:quickfix_title = 'Built ' . l:title
		redraw!
	endfunction
endif
" F5 builds the default set of targets
nnoremap <F5> :wa<CR>:call Build('make', '-j9', '')<CR>:redraw!<CR>
" F6 runs bjam
nnoremap <F6> :wa<CR>:call Build('bjam', $BJAM_FLAGS, '')<CR>:redraw!<CR>
" F7 runs the tests for a make project
nnoremap <F7> :wa<CR>:call Build('make', '', 'test')<CR>:redraw!<CR>
" Mappings for insert mode
imap <F5> <ESC><F5>
imap <C-F5> <ESC><C-F5>
imap <F6> <ESC><F6>

" SORTING
" Do a unique sort on the inner paragraph
nmap <leader>su vip:sort u<CR>
" Do a unique sort on the selection
vmap <leader>su :sort u<CR>
