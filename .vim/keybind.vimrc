let mapleader=","
imap <C-G> <Esc>
vmap <C-G> <Esc>
" Reload vimrc
noremap <leader>s :source ~/.vimrc<CR>
autocmd bufwritepost .vimrc call Pl#Load()

" Back tag stack
nmap <C-b> :po<CR>

" Yank to $
nmap Y y$
" Select last pasted
nnoremap <expr> gp  '`[' . strpart(getregtype(), 0, 1) . '`]'
" Yank/Paste into clipboard {{{
nnoremap <leader>p "*p
vnoremap <leader>p "*p
noremap <leader>y "*y
vnoremap <leader>y "*y
" }}}

" Use emacs keybind in comand line mode {{{
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <C-P> <UP>
cnoremap <C-N> <Down>
cnoremap <C-k> <C-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>
" }}}

" Moving tab {{{
nnoremap <Tab> gt
nnoremap <S-Tab> gT
" }}}

" Strip space at eof before save
autocmd BufWritePre * :%s/\s\+$//gce

" Rename file
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))

" Adjust splitted-window {{{
" width http://vim-users.jp/2009/07/hack42/
nnoremap <C-w>h <C-w>h:call <SID>good_width_and_height()<CR>
nnoremap <C-w>j <C-w>j:call <SID>good_width_and_height()<CR>
nnoremap <C-w>k <C-w>k:call <SID>good_width_and_height()<CR>
nnoremap <C-w>l <C-w>l:call <SID>good_width_and_height()<CR>

function! s:good_width_and_height()
  let current_buf_ft = &filetype
  if  current_buf_ft != 'taglist' && current_buf_ft != 'unite'
    if winwidth(0) < 80
      vertical resize 80
    endif
  endif
endfunction
" }}}

" Put out search highlight {{{
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif
" }}}
