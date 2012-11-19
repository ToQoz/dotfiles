"==========================
" Rainbow
"==========================
autocmd FileType scheme :RainbowParenthesesToggle
let g:rbpt_max = 7
let g:rbpt_loadcmd_toggle = 0

"==========================
" neocomplecache
"==========================
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

" " Define dictionary.
"  let g:neocomplcache_dictionary_filetype_lists = {
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

""------------------------------------
" neosnippet
"------------------------------------
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

"==========================
" Unite.vim
"==========================
" http://mugijiru.seesaa.net/article/200968763.html
let g:unite_enable_split_vertically=1
noremap <C-_> :Unite -buffer-name=files buffer file_mru bookmark file<CR>
" quit when press esc twice
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>


" open with split when open file
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')

nnoremap [unite] <Nop>
nmap <leader>u [unite]

nnoremap [unite]u  :<C-u>Unite<Space>
nnoremap <silent> [unite]a  :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]f  :<C-u>Unite -buffer-name=files file<CR>
nnoremap <silent> [unite]b  :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]m  :<C-u>Unite file_mru<CR>
" show register list
nnoremap <silent> [unite]y :Unite -buffer-name=register register<CR>

  "==========================
  " Unite outline
  "==========================
  nnoremap <silent> [unite]o :Unite outline<CR>

  "==========================
  " UniteSession
  "==========================
  nnoremap [unite]s :UniteSessionSave<Space>

"==========================
" NEARD_tree
"==========================
nmap <Leader>n :NERDTreeToggle<CR>

" create directory automatically
augroup vimrc-auto-mkdir
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)
    if !isdirectory(a:dir) && (a:force ||
          \ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction
augroup END

"------------------------------------
" vim-indent-guides
"------------------------------------
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

"------------------------------------
" jscomplete-vim
"------------------------------------
autocmd FileType javascript
  \ :setl omnifunc=jscomplete#CompleteJS
:let g:jscomplete_use = ['dom', 'moz']

"------------------------------------
" vim-rsense
"------------------------------------
let g:rsenseUseOmniFunc = 1
let g:rsenseHome = expand("$RSENSE_HOME")

function! SetUpRubySetting()
  setlocal completefunc=RSenseCompleteFunction
  nmap <buffer>tj :RSenseJumpToDefinition<CR>
  nmap <buffer>tk :RSenseWhereIs<CR>
  nmap <buffer>td :RSenseTypeHelp<CR>
endfunction

autocmd FileType ruby,eruby,ruby.rspec call SetUpRubySetting()

if !exists('g:neocomplcache_omni_functions')
  let g:neocomplcache_omni_functions = {}
endif
let g:neocomplcache_omni_functions.ruby = 'RSenseCompleteFunction'

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

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
" BufferExplorer
"------------------------------------
nnoremap <leader><leader>l :BufExplorer<CR>

"------------------------------------
" eregex.vim
"------------------------------------
nnoremap / :M/
nnoremap ? :M?
nnoremap ,/ /
nnoremap ,? ?

"------------------------------------
" VimShell
"------------------------------------
hi vimshellPrompt ctermfg=yellow guifg=#FF00FF

" https://github.com/yuroyoro/dotfiles/blob/master/.vimrc.plugins_setting
" let g:vimshell_right_prompt = 'vimshell#vcs#info("(%s)-[%b]", "(%s)-[%b|%a]")'
let g:vimshell_enable_smart_case = 1

let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
if has('win32') || has('win64')
  " Display user name on Windows.
  let g:vimshell_prompt = "✘╹◡╹✘ ". $USERNAME. ' % '
else
  " Display user name on Linux.
  let g:vimshell_prompt = "✘╹◡╹✘ ". $USER . ' % '

  call vimshell#set_execute_file('bmp,jpg,png,gif', 'gexe eog')
  call vimshell#set_execute_file('mp3,m4a,ogg', 'gexe amarok')
  let g:vimshell_execute_file_list['zip'] = 'zipinfo'
  call vimshell#set_execute_file('tgz,gz', 'gzcat')
  call vimshell#set_execute_file('tbz,bz2', 'bzcat')
endif

autocmd FileType vimshell
\ call vimshell#altercmd#define('g', 'git')
\| call vimshell#altercmd#define('i', 'iexe')
\| call vimshell#altercmd#define('l', 'll')
\| call vimshell#altercmd#define('ll', 'ls -l')
command! Vs :VimShell

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

"------------------------------------
" VimFiler
"------------------------------------
command! Vf :VimFiler
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_pedit_command = 'vnew'

"------------------------------------
" QuickRun
"------------------------------------
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

"------------------------------------
" Syntastic
"------------------------------------
" show error line by sign
let g:syntastic_enable_signs = 1
let g:syntastic_enable_highlighting = 1
let g:syntastic_ruby_exec = expand('~/.rbenv/shims/ruby')
nnoremap <leader>sc :<C-u>SyntasticCheck<CR>

"------------------------------------
" columnjump
"------------------------------------
map <c-k> <Plug>(columnjump-backward)
map <c-j> <Plug>(columnjump-forward)

"------------------------------------
" clam.vim
"------------------------------------
nnoremap ! :Clam<space>
vnoremap ! :ClamVisual<space>

"------------------------------------
" EasyMotion
"------------------------------------
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
let g:EasyMotion_leader_key="'"
let g:EasyMotion_grouping=1

"------------------------------------
" vim-textobj-rubyblock
"------------------------------------
runtime macros/matchit.vim
" Refe
"------------------------------------
noremap <leader><leader>r :Ref refe<Space>
