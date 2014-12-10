setlocal nowrap
setlocal colorcolumn=100
setlocal cursorcolumn
setlocal cursorline

setlocal expandtab
setlocal nu

" Switch between header and source files.
nmap <leader>o :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" Include a file based on the word under the cursor
nmap <leader>i :call InsertInclude(expand("<cword>") . ".h")<CR>

nmap <leader>su vip:sort u<CR>
vmap <leader>su :sort u<CR>

" Set makeprg to use build in the chroot
let g:buildcmd='schroot -c susedevel -- make'

" This function will build the provided target using a build command
" and populate the quickfix window with the build output.
" Call this function with a target and optional options.
" This funcitons relies on g:buildcmd to be set.
" This function relies on ~/.scripts/asap.makeargs.py existing.
function! Make(target, options)
	" See http://github.com/vshih/vim-make for the basis of this function.

	" Compile arguments.
	let l:options = strlen(a:options) ? ' ' . a:options : ''
	let l:target = ' ' . system('python ~/.scripts/asap.makeargs.py ' . a:target)
	let l:title = 'Building: ' . l:options . l:target

	botright copen
	call setqflist([])
	let w:quickfix_title = l:title
	redraw!

	" Make.
	silent cexpr system(g:buildcmd . l:options . l:target)

	" Set quickfix title now that the build is complete.
	let l:title = 'Built: ' . l:options . l:target
	let w:quickfix_title = l:title
	redraw!
endfunction

function! InsertInclude(fileName)
	let s:line = search("^#include", "bn")
	if s:line == 0
		return
	endif
	call append(s:line, "#include \"" . a:fileName . "\"")
endfunction

" F6 builds the whole project
nnoremap <F6> :wa<CR>:silent make -j9 -C ../.build<CR>:redraw!<CR>
" F5 builds the project associated with the path of the file in the current buffer
nnoremap <F5> :wa<CR>:call Make(expand('%:p:h'), '-j9')<CR>
imap <F5> <ESC><F5>
" Ctrl+F5 builds the compilation unit associated with the path of the file in the current buffer
nnoremap <C-F5> :wa<CR>:call Make(expand('%:p'), '-j1')<CR>
imap <C-F5> <ESC><C-F5>
