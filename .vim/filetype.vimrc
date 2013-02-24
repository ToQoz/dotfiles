"==========================
" FileType
"==========================
" set filetype
augroup MyInit
  autocmd!
  " Nginx {{{
    autocmd BufEnter */nginx/*.conf set ft=nginx
    autocmd BufEnter */*.nginx.conf set ft=nginx
  " }}}
augroup END

" Ruby
" extra space
let ruby_space_errors=1

" Command-line window {{{
" http://vim-users.jp/2010/07/hack161/
function! s:init_cmdwin()
  nnoremap <buffer> q :<C-u>quit<CR>
  nnoremap <buffer> <TAB> :<C-u>quit<CR>
  inoremap <buffer><expr><CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
  inoremap <buffer><expr><C-h> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
  inoremap <buffer><expr><BS> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"

  " Completion.
  inoremap <buffer><expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  startinsert!
endfunction

autocmd CmdwinEnter * call s:init_cmdwin()
autocmd FileType * setlocal formatoptions-=ro
" }}}

" quit help by `q`
autocmd FileType help nnoremap <buffer> q <C-w>c
