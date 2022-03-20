" Alternate way to save
nnoremap <C-s> :w<CR>
inoremap <C-s> <C-o>:w<CR><esc>


" Window Resize
noremap <silent> <C-S-Left> :vertical resize +1<CR>
noremap <silent> <C-S-Right> :vertical resize -1<CR>

" NERDCommenter
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NerdCommenterToggle<CR>gv

" Tab navigation like Firefox. This is for tabline / switching tabs
nnoremap <C-Left> :bprevious<CR>
nnoremap <C-Right> :bnext<CR>

" NERDTree
let NERDTreeQuitOnOpen=1
nmap <F2> :NERDTreeToggle<CR>


"run scripts inside nvim
augroup exec_code
    autocmd!  

    " execute python code
    autocmd FileType python nnoremap <buffer> <leader>r
                \ :sp<CR> :term python3 %<CR> :startinsert<CR>

    " execute javascript code
    autocmd FileType javascript nnoremap <buffer> <leader>r
                \ :sp<CR> :term nodejs %<CR> :startinsert<CR>

    " execute bash code
    autocmd FileType bash,sh nnoremap <buffer> <leader>r
                \ :sp<CR> :term bash %<CR> :startinsert<CR>
augroup END

