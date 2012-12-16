"==========================
" FileType
"==========================
" set filetype
augroup FileTypeGroup
  autocmd! FileTypeGroup
  autocmd BufNewFile,BufRead *.wsgi set filetype=python
  autocmd BufNewFile,BufRead *.ctp set filetype=php
  autocmd BufNewFile,BufRead *.vimrc set filetype=vim
  autocmd BufNewFile,BufRead *.vimperatorrc set filetype=vim
  autocmd BufNewFile,BufRead *.vrapperrc set filetype=vim
  autocmd BufNewFile,BufRead *.go set filetype=go
  autocmd FileType scheme :let is_gauche=1
augroup END

" Enable omni completion.
augroup OmniCompletionGroup
  autocmd! OmniCompletionGroup
  autocmd FileType eruby,html setl omnifunc=htmlcomplete#CompleteTags
  autocmd FileType html,css,sass,haml,erb,javascript,coffee setl expandtab tabstop=2 shiftwidth=2 softtabstop=2
  autocmd FileType vim setl expandtab tabstop=2 shiftwidth=2 softtabstop=2
  autocmd FileType xml setl omnifunc=xmlcomplete#CompleteTags
  autocmd FileType css setl omnifunc=csscomplete#CompleteCSS
  autocmd FileType css setl expandtab tabstop=2 shiftwidth=2 softtabstop=2
  " autocmd FileType javascript setl omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
  autocmd FileType python setl omnifunc=pythoncomplete#Complete
  autocmd FileType ruby,cucumber,eruby,yaml,vim setl expandtab tabstop=2 shiftwidth=2 softtabstop=2
  autocmd FileType snippet setl noexpandtab
augroup END

"==========================
" Ruby
"==========================
" extra space
let ruby_space_errors=1

"==========================
" PHP
"==========================
" sql syntax in string
let php_sql_query=1
" html syntax in string
let php_htmlInStrings=1
" ban short tag
let php_noShortTags=1

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
