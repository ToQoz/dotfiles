" Unite {{{
let g:unite_source_rec_max_cache_files = 5000
let g:unite_force_overwrite_statusline = 0

call unite#custom#source('file_rec/async,file_rec', 'ignore_pattern', join([
      \ '\.pdf$',
      \ '\.key$',
      \ '\.crt$',
      \ '\.csv$',
      \ '\.sqlite*$',
      \ '\.psd$',
      \ '\.png$',
      \ '\.gif$',
      \ '\.jpeg$',
      \ '\.jpg$',
      \ 'log',
      \ 'cache',
      \ '\.idea',
      \ '\.git/',
      \ '\.o',
      \ '_build',
      \ 'dist',
      \ '*.tar.gz',
      \ '*.zip',
      \ 'node_modules',
      \ 'vendor/gems',
      \ '\.sass-cache/',
      \ ], '\|'))

nmap <C-x> [unite]
nnoremap [unite]x  :<C-u>Unite<Space>

" Keybind for Unite source {{{
nnoremap [unite]/ :<C-u>Unite line -buffer-name=search -start-insert<CR>
nnoremap [unite]* :<C-u>UniteWithCursorWord line -buffer-name=search<CR>
nnoremap [unite]n :<C-u>UniteResume search -no-start-insert<CR>
" files
nnoremap <silent> [unite]p :<C-u>Unite file_rec:!<CR>
nnoremap <silent> [unite]P :<C-u>Unite file_rec/async:!<CR>
" buffer
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
" mru
nnoremap <silent> [unite]m :<C-u>UniteWithCurrentDir file_mru -no-split -buffer-name=files<CR>
nnoremap <silent> [unite]M :<C-u>UniteWithBufferDir file_mru -no-split -buffer-name=files<CR>
" Full-Stack
nnoremap <silent> [unite]a :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
" Unite session {{{
nnoremap [unite]s :UniteSessionSave<Space>
" }}}
" Unite outline {{{
nnoremap <silent> [unite]o :Unite outline<CR>
" }}}

" show register list
nnoremap <silent> [unite]y :Unite -buffer-name=register register<CR>
" }}}

if executable('ag')
  let g:unite_source_grep_command        = 'ag'
  let g:unite_source_grep_default_opts   = '--nocolor --nogroup'
  let g:unite_source_grep_recursive_opt  = ''
  let g:unite_source_grep_max_candidates = 200
endif

nnoremap <silent> <leader><leader> :<C-u>Unite menu:shortcut<CR>
let g:unite_source_menu_menus = {
      \   "shortcut" : {
      \       "description" : "sample unite-menu",
      \       "command_candidates" : [
      \           ["edit vimrc", "edit $MYVIMRC"],
      \           ["edit gvimrc", "edit $MYGVIMRC"],
      \           ["Unite#file_mru", "Unite file_mru"],
      \           ["Unite#output:message", "Unite output:message"],
      \       ],
      \   },
      \}

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  " 入力モードのときctrl+wでバックスラッシュも削除
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  " ctrl+jで縦に分割して開く
  nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  " ctrl+jで横に分割して開く
  nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  " ctrl+oでその場所に開く
  nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
  inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
  " quit when press esc twice
  nmap <buffer> q i_<Plug>(unite_exit)
  nmap <buffer> <C-g> <Plug>(unite_insert_leave)
  imap <buffer> <C-g> <Plug>(unite_insert_leave)
endfunction
" }}}

" neocomplecache {{{
let g:acp_enableAtStartup                           = 0
let g:neocomplete#enable_at_startup                 = 1
let g:neocomplete#enable_ignore_case                = 0
let g:neocomplete#enable_smart_case                 = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#enable_camel_case_completion      = 1
let g:neocomplete#enable_underbar_completion        = 1
let g:neocomplete#manual_completion_start_length    = 0

let g:neocomplete#keyword_patterns                  = {}
let g:neocomplete#keyword_patterns.default          = '\h\w*'

let g:neocomplete#delimiter_patterns                = {}
let g:neocomplete#delimiter_patterns.vim            = ['#']
let g:neocomplete#delimiter_patterns.ruby           = ['::']

let g:neocomplete#force_overwrite_completefunc = 1
let g:neocomplete#sources#buffer#disabled_pattern = '\.log\|\.log\.\|\.jax\|Log.txt'

" neosnippet {{{
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" vim-indent-guides {{{
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

if has("gui_running")
  " let g:indent_guides_color_change_percent = 20
  " autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=grey ctermbg=3
  " autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=4
  hi IndentGuidesOdd  ctermbg=gray
  hi IndentGuidesEven ctermbg=darkgrey
else
  hi IndentGuidesOdd  ctermbg=gray
  hi IndentGuidesEven ctermbg=darkgrey
endif
" }}}

" https://github.com/othree/eregex.vim/blob/master/README.markdown
let g:eregex_default_enable = 1
nnoremap <leader>/ :call eregex#toggle()<CR>

" Syntastic {{{
" show error line by sign
let g:syntastic_enable_signs = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_mode_map = { 'mode': 'active',
  \ 'active_filetypes': [],
  \ 'passive_filetypes': ['html'] }
let g:syntastic_enable_highlighting = 1
let g:syntastic_ruby_exec = expand('~/.rbenv/shims/ruby')
let g:syntastic_html_validator_parser = 'html5'
nnoremap <leader>sc :<C-u>SyntasticCheck<CR>
" }}}

" EasyMotion {{{
let g:EasyMotion_keys = 'hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
let g:EasyMotion_leader_key = "'"
let g:EasyMotion_grouping = 1
" }}}

" vim-surround
let g:surround_no_insert_mappings = 1

" gentleman
call altercmd#load()
AlterCommand q GQ
AlterCommand GQ q
AlterCommand wq GWQ
AlterCommand GWQ wq
