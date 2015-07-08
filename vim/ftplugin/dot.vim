set nowrap
set nonu

nmap <C-F5> :w<CR> :!dot -Tpng -O %<CR>
