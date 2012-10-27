"==========================
" Command
"==========================
set wildmenu
set wildmode=list:longest
set completeopt=menu,preview,menuone

"==========================
" Key binding
"==========================
let mapleader=","
" Reload vimrc
noremap ,s :source ~/.vimrc<CR>
autocmd bufwritepost .vimrc call Pl#Load()
autocmd BufDelete  *  call Pl#Load()
" noremap n :tabnew<Space>
" clipboard use in OS
" set clipboard+=unnamed
" Esc key map
imap <C-g> <esc>
vmap <C-g> <esc>
" Select last pasted
nnoremap <expr> gp  '`[' . strpart(getregtype(), 0, 1) . '`]'
" short hand for yank/paste into clipboard
nnoremap <leader>p "*p
vnoremap <leader>p "*p
noremap <leader>y "*y
vnoremap <leader>y "*y

  "==========================
  " Use emacs keybind in comand line mode
  "==========================
  cnoremap <C-A> <Home>
  cnoremap <C-E> <End>
  cnoremap <C-F> <Right>
  cnoremap <C-B> <Left>
  cnoremap <C-P> <UP>
  cnoremap <C-N> <Down>
  cnoremap <C-k> <C-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>

" strip space at eof before save
autocmd BufWritePre * :%s/\s\+$//ge