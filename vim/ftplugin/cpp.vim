setlocal nowrap
setlocal colorcolumn=100
setlocal cursorcolumn
setlocal cursorline

setlocal expandtab

" Switch between header and source files.
function! SwitchDecDef()
    let [rest, ext] = [expand('%:r'), expand('%:e')]
    if ext ==? 'h'
		if filereadable(rest . '.' . 'cpp')
			let ext = 'cpp'	
		elseif filereadable(rest . '.' . 'cc')
			let ext = 'cc'
		endif
    elseif ext ==? 'cc'
		let ext = 'h'
	elseif ext ==? 'cpp'
        let ext = 'h'
    endif
    return rest . '.' . ext
endfunction
noremap <buffer> <leader>o :execute 'edit ' . SwitchDecDef()<CR>

" Include a file based on the word under the cursor
if !exists("*InsertInclude")
	function! InsertInclude(fileName)
		let s:line = search("^#include", "bn")
		if s:line == 0
			return
		endif
		call append(s:line, "#include \"" . a:fileName . "\"")
	endfunction
endif
nmap <buffer> <leader>i :call InsertInclude(expand("<cword>") . ".h")<CR>
