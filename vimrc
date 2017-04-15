set nocompatible " be iMproved, required

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'jiangmiao/auto-pairs'
Plug 'skywind3000/asyncrun.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

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
set relativenumber

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

" Find file from list of files under git control
nmap <silent> <leader>ff :GFiles<CR>
" Find file from list of all files
nmap <silent> <leader>fg :Files<CR>
nmap <silent> <leader>fb :Buffers<CR>
nmap <silent> <leader>fh :History<CR>

" Ag for file under cursor
nmap <silent> <leader>ag :Ag<CR>
" Ag for last search term
nmap <silent> <leader>ah :Ag histget("search")<CR>
" Ag for user input
nmap <silent> <leader>af :Ag!<SPACE>

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

" F5 builds the default set of targets
nnoremap <F5> :wa<CR>:AsyncRun chmake<CR>
" F7 runs the tests for a make project
nnoremap <F7> :wa<CR>:AsyncRun chmake test<CR>
" F8 builds all of Blackbear
nnoremap <F8> :wa<CR>:AsyncRun bb make<CR>
" F9 builds just the target that depends on the current file.
nnoremap <F9> :wa<CR>:AsyncRun chmake $(build_object %)<CR>
" Mappings for insert mode
imap <F5> <ESC><F5>
imap <F7> <ESC><F7>
imap <F8> <ESC><F8>

" SORTING
" Do a unique sort on the inner paragraph
nmap <leader>su vip:sort u<CR>
" Do a unique sort on the selection
vmap <leader>su :sort u<CR>
