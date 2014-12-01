setlocal nowrap

" Find all instances of the last searched for text and put it in a new buffer
" with filetype set to "analysis" for highlighting and make the buffer
" unmodified so that it doesn't prompt to save the buffer when it's closed.
nnoremap <silent> <leader>fr :redir @z<CR>:g//<CR>:redir END<CR>:botright 15new<CR>:set filetype=analysis<CR>:put! z<CR>:set nomodified<CR>
