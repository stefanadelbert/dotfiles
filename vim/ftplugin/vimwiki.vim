" Mapping overrides
nmap <Leader>wn <Plug>VimwikiNextLink
nmap <Leader>wn <Plug>VimwikiNextLink

" Insert the date and time
nnoremap <leader>idd "=strftime("%F ")<CR>Pi
inoremap <leader>idd <C-R>=strftime("%F ")<CR>
nnoremap <leader>idt "=strftime("[%F %H:%M] ")<CR>Pi
inoremap <leader>idt <C-R>=strftime("[%F %H:%M] ")<CR>

nnoremap <F5> :VimwikiAll2HTML<CR>
nnoremap <C-F5> :Vimwiki2HTML<CR>
