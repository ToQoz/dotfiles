" Unite {{{
noremap <C-_> :Unite -buffer-name=files buffer file_mru bookmark file<CR>
" quit when press esc twice
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
" open with split when open file
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')

nnoremap [unite] <Nop>
nmap <C-x> [unite]
nnoremap [unite]x  :<C-u>Unite<Space>
nnoremap [unite]/ :<C-u>Unite line -buffer-name=search -start-insert<CR>
nnoremap [unite]* :<C-u>UniteWithCursorWord line -buffer-name=search<CR>
nnoremap [unite]n :<C-u>UniteResume search -no-start-insert<CR>
nnoremap [unite]r  :<C-u>Unite<Space>rails/
nnoremap [unite]rm  :<C-u>Unite<Space>rails/model<CR>
nnoremap [unite]rv  :<C-u>Unite<Space>rails/view<CR>
nnoremap [unite]rc  :<C-u>Unite<Space>rails/controller<CR>
nnoremap [unite]rg  :<C-u>Unite<Space>rails/config<CR>
nnoremap <silent> [unite]a  :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]f  :<C-u>Unite -buffer-name=files file<CR>
nnoremap <silent> [unite]b  :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]m  :<C-u>Unite file_mru<CR>
" show register list
nnoremap <silent> [unite]y :Unite -buffer-name=register register<CR>
" }}}

" Unite session {{{
nnoremap [unite]s :UniteSessionSave<Space>
" }}}
" Unite outline {{{
nnoremap <silent> [unite]o :Unite outline<CR>
" }}}

" neocomplecache {{{
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use auto select
"let g:neocomplcache_enable_auto_select = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
" Set manual completion length.
let g:neocomplcache_manual_completion_start_length = 0

" Delimiter
if !exists('g:neocomplcache_delimiter_patterns')
  let g:neocomplcache_delimiter_patterns = {}
endif

let g:neocomplcache_delimiter_patterns.vim = ['#']
let g:neocomplcache_delimiter_patterns.ruby = ['::']

" " Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
      \'default' : '',
      \ 'scala' : $HOME.'/.vim/dict/scala.dict',
      \ 'cpp' : $HOME.'/.vim/dict/cpp.dict',
      \ 'c' : $HOME.'/.vim/dict/c.dict',
      \ 'javascript' : $HOME.'/.vim/dict/javascript.dict',
      \ 'perl' : $HOME.'/.vim/dict/perl.dict',
      \ 'php' : $HOME.'/.vim/dict/php.dict',
      \ 'scheme' : $HOME.'/.vim/dict/scheme.dict',
      \ 'vim' : $HOME.'/.vim/dict/vim.dict'
      \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

function! s:my_crinsert()
  return pumvisible() ? neocomplcache#close_popup() : "\<Cr>"
endfunction
inoremap <silent> <CR> <C-R>=<SID>my_crinsert()<CR>
" }}}

" neosnippet {{{
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

let g:neosnippet#snippets_directory='~/.vim/snippets'
" }}}

" vim-indent-guides {{{
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

if has("gui_running")
  let g:indent_guides_color_change_percent = 20
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=grey ctermbg=3
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=4
else
  hi IndentGuidesOdd  ctermbg=gray
  hi IndentGuidesEven ctermbg=darkgrey
endif
" }}}

" jscomplete-vim {{{
autocmd FileType javascript
  \ :setl omnifunc=jscomplete#CompleteJS
let g:jscomplete_use = ['dom', 'moz']
" }}}

"------------------------------------
" CtrlP
"------------------------------------
let g:ctrlp_map = '<leader>f'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ 'link': 'some_bad_symbolic_links',
      \ }

"------------------------------------
" eregex.vim
"------------------------------------
" nnoremap / :M/
" nnoremap ? :M?
" nnoremap ,/ /
" nnoremap ,? ?

"------------------------------------
" Gundo
"------------------------------------
nnoremap <leader>g :GundoToggle<CR>

"------------------------------------
" SuperTab
"------------------------------------
function! CleverTab()
  if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
    return "\<Tab>"
  else
    return "\<C-N>"
  endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>

"------------------------------------
" vim-powerline
"------------------------------------
let g:Powerline_symbols = 'fancy'

" QuickRun {{{
" https://gist.github.com/1628362
augroup QrunRSpec
  autocmd!
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END

let g:quickrun_config = {}

let g:quickrun_config._ = {'runner' : 'vimproc'}
let g:quickrun_config['ruby.rspec'] = {
      \ 'type' : 'ruby.rspec',
      \ 'command': 'rspec',
      \ 'exec': 'bundle exec %c %s'
      \}

function! RSpecQuickrun()
  let b:quickrun_config = {'type' : 'ruby.rspec'}
  " nnoremap <silent><buffer><Leader>lr :QuickRun ruby.rspec line('.')<CR>
endfunction
au BufReadPost *_spec.rb call RSpecQuickrun()
" }}}

" Syntastic {{{
" show error line by sign
let g:syntastic_enable_signs = 1
let g:syntastic_enable_highlighting = 1
let g:syntastic_ruby_exec = expand('~/.rbenv/shims/ruby')
nnoremap <leader>sc :<C-u>SyntasticCheck<CR>
" }}}

" clam.vim {{{
nnoremap ! :Clam<space>
vnoremap ! :ClamVisual<space>
" }}}

" EasyMotion {{{
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
let g:EasyMotion_leader_key="'"
let g:EasyMotion_grouping=1
" }}}

" Refe
noremap <leader>rr :Ref refe<Space>

" unite-ruby-require.vim {{{
let g:unite_source_ruby_require_ruby_command = '$HOME/.rbenv/shims/ruby'
noremap <leader>rq :Unite ruby/require <CR>
" }}}

" vim-surround
let g:surround_no_insert_mappings = 1
