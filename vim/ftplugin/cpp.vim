setlocal nowrap
setlocal colorcolumn=100
setlocal cursorcolumn
setlocal cursorline

setlocal expandtab
setlocal nu

" Switch between header and source files.
nmap <leader>o :e %:p:s,.h$,.X123X,:s,.cc$,.h,:s,.X123X$,.cc,<CR>

" Include a file based on the word under the cursor
nmap <leader>i :call InsertInclude(expand("<cword>") . ".h")<CR>

" Do a unique sort on the inner paragraph
nmap <leader>su vip:sort u<CR>
" Do a unique sort on the selection
vmap <leader>su :sort u<CR>

" Set makeprg to use build in the chroot
let g:chroot='wily'
let g:buildcmd='schroot -c ' . g:chroot . ' -- make'

" This function will build the provided target using a build command
" and populate the quickfix window with the build output.
" Call this function with a target and optional options.
" This funcitons relies on g:buildcmd to be set.
" This function relies on ~/.scripts/makeargs.py existing.
function! Make(target, options)
	" See http://github.com/vshih/vim-make for the basis of this function.

	" Compile arguments.
	let l:options = strlen(a:options) ? ' ' . a:options : ''
	let l:target = ' ' . system('python ~/.scripts/makeargs.py ' . a:target)
	let l:title = g:buildcmd . l:options . l:target

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

" F6 runs the tests
nnoremap <F6> :wa<CR>:call Make('test', '-j9')<CR>:redraw!<CR>
" F5 builds the default set of targets
nnoremap <F5> :wa<CR>:call Make('default', '-j9')<CR>:redraw!<CR>
" Ctrl+F5 builds the compilation unit associated with the path of the file in the current buffer
nnoremap <C-F5> :wa<CR>:call Make(expand('%'), '-j1')<CR>:redraw!<CR>
" Mappings for insert mode
imap <F5> <ESC><F5>
imap <C-F5> <ESC><C-F5>
imap <F6> <ESC><F6>

" Gtags mappings
:nmap <leader>gg :Gtags<SPACE>
:nmap <leader>gf :Gtags -f %<CR>
:nmap <leader>gc :GtagsCursor<CR>
