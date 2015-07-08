" Insert the date and time
nnoremap <leader>id "=strftime("[%F %H:%M] ")<CR>Pi
inoremap <leader>id <C-R>=strftime("[%F %H:%M] ")<CR>

nnoremap <F5> :VimwikiAll2HTML<CR>
nnoremap <C-F5> :Vimwiki2HTML<CR>
