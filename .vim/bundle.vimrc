syntax on
set nocompatible
filetype off
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'ruby.vim'
NeoBundle 'haruyama/scheme.vim'
NeoBundle 'jnwhiteh/vim-golang'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'othree/html5.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'ToQoz/vim-javascript-syntax'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'tpope/vim-haml'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'nginx.vim'
NeoBundle 'xmledit'

NeoBundle 'Shougo/neocomplcache'
NeoBundleLazy 'Shougo/neocomplcache-rsense', {
      \ 'depends': 'Shougo/neocomplcache',
      \ 'autoload': { 'filetypes': [ 'ruby' ] }
      \ }
let s:bundle = neobundle#get('neocomplcache-rsense')
function! s:bundle.hooks.on_source(bundle)
  if !exists('g:neocomplcache_force_omni_patterns')
    let g:neocomplcache_force_omni_patterns = {}
  endif
  let g:neocomplcache_force_omni_patterns['ruby'] = '[^. *\t]\.\w*\|\h\w*::'

  if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
  endif
  let g:neocomplcache_omni_patterns['ruby'] = '[^. *\t]\.\w*\|\h\w*::'

  if !exists('g:neocomplcache_omni_functions')
      let g:neocomplcache_omni_functions = {}
  endif
  let g:neocomplcache_omni_functions['ruby'] = 'RSenseCompleteFunction'

  if !exists('g:neocomplcache_source_completion_length')
    let g:neocomplcache_source_completion_length = {}
  endif
  let g:neocomplcache_source_completion_length['rsense'] = 0
endfunction
NeoBundleLazy 'ujihisa/neco-ruby', {
      \ 'depends': 'Shougo/neocomplcache',
      \ 'autoload': { 'filetypes': [ 'ruby' ] }
      \ }
NeoBundle 'Shougo/neosnippet'
" Perform all your vim insert mode completions with Tab
NeoBundle 'ervandew/supertab'

NeoBundleLazy 'Shougo/unite.vim' , {
      \   'autoload' : { 'commands' : [ 'Unite' ] }
      \ }
let s:bundle = neobundle#get('unite.vim')
function! s:bundle.hooks.on_source(bundle)
  " http://mugijiru.seesaa.net/article/200968763.html
  let g:unite_enable_split_vertically=1
  let g:unite_enable_start_insert = 1
endfunction

NeoBundle 'tsukkee/unite-tag'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'Shougo/unite-ssh'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'Shougo/unite-session'
NeoBundleLazy 'basyura/unite-rails', {
      \ 'depends': 'Shougo/unite.vim',
      \ 'autoload' : { 'filetypes': [ 'ruby', 'eruby', 'haml', 'slim' ] }
      \ }

NeoBundle 'rhysd/unite-ruby-require.vim', {
      \ 'depends': 'Shougo/unite.vim',
      \ 'autoload': { 'filetypes': [ 'ruby' ] }
      \ }

NeoBundleLazy 'Shougo/vimshell', {
\   'autoload' : { 'commands' : [ 'VimShellBufferDir' ] },
\   'depends': [ 'Shougo/vimproc' ],
\ }
let s:bundle = neobundle#get('vimshell')
function! s:bundle.hooks.on_source(bundle)
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
endfunction

NeoBundle 'ujihisa/vimshell-ssh'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \     'unix': 'make -f make_unix.mak'
      \    },
      \ }
NeoBundle 'sjl/clam.vim'
NeoBundle 'thinca/vim-quickrun'

" Vim plugin: Operators to edit surrounding text
NeoBundle 'tpope/vim-surround'
NeoBundle 'kana/vim-textobj-user'
" Text object to select a range of words for humans.
NeoBundle 'h1mesuke/textobj-wiw'
" text filtering and alignment
NeoBundle 'h1mesuke/vim-alignta'
" NeoBundle 'kana/vim-smartchr'
NeoBundle 'tomtom/tcomment_vim'
NeoBundleLazy 'rhysd/vim-textobj-ruby', {
      \ 'autoload': { 'filetypes': [ 'ruby' ] }
      \ }
" FIXME
" runtime macros/matchit.vim
NeoBundleLazy 'nelstrom/vim-textobj-rubyblock', {
      \ 'autoload': { 'filetypes': [ 'ruby' ] }
      \ }

NeoBundle 'Shougo/vimfiler', {
      \   'autoload' : { 'commands' : [ 'VimFilerBufferDir' ] },
      \   'depends': [ 'Shougo/unite.vim' ],
      \ }
let s:bundle = neobundle#get('vimfiler')
function! s:bundle.hooks.on_source(bundle)
  command! Vf :VimFiler
  " let g:vimfiler_as_default_explorer = 1
  let g:vimfiler_safe_mode_by_default = 0
  let g:vimfiler_pedit_command = 'vnew'
endfunction
NeoBundle 'kien/ctrlp.vim'
" Use one tab page per project
NeoBundle 'kana/vim-tabpagecd'

NeoBundle 'thinca/vim-visualstar'

" Move {if .. end} {def .. end} by pressing % in ruby
NeoBundleLazy 'ruby-matchit', {
      \ 'autoload' : { 'filetypes': [ 'ruby', 'eruby', 'haml', 'slim' ] }
      \ }
" Expand if<CR> to if [condition] end
NeoBundleLazy 'tpope/vim-endwise', {
      \ 'autoload' : { 'filetypes': [ 'ruby', 'eruby', 'haml', 'slim' ] }
      \ }
" Syntax highlight for rspec
NeoBundleLazy 'taq/vim-rspec', {
      \ 'autoload' : { 'filetypes': [ 'ruby' ] }
      \ }
NeoBundleLazy 'tpope/vim-rails', {
      \ 'autoload' : { 'filetypes': [ 'ruby', 'eruby', 'haml', 'slim' ] }
      \ }
NeoBundleLazy 'tpope/vim-cucumber', {
      \ 'autoload': { 'filetypes': [ 'ruby' ] }
      \ }
NeoBundleLazy 'ecomba/vim-ruby-refactoring', {
      \ 'autoload': { 'filetypes': [ 'ruby' ] }
      \ }
" Vim plugin: Support for user-defined text objects A custom text object for selecting ruby blocks.
NeoBundle 'rorymckinley/vim-symbols-strings', {
      \ 'autoload': { 'filetypes': [ 'ruby' ] }
      \ }

NeoBundle 'teramako/jscomplete-vim'

" extended % matching for HTML, LaTeX, and many other languages
NeoBundle 'matchit.zip'
NeoBundle 'scrooloose/syntastic'

NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'aereal/vim-magica-colors'
NeoBundle 'sickill/vim-monokai'
NeoBundle 'molokai'

NeoBundle 'grep.vim'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'thinca/vim-qfreplace'
" Perl/Ruby style regexp notation for Vim
NeoBundle 'othree/eregex.vim'

" move by Camel/snake case ward
" set script_31337_path_and_name_without_extension_11=%~dpn0
" ,w moves to ([x] is cursor position): [s]et, [s]cript, [3]1337, [p]ath, [a]nd, [n]ame, [w]ithout, [e]xtension, [1]1, [d]pn0, dpn[0], [s]et
" ,b moves to: [d]pn0, [1]1, [e]xtension, [w]ithout, ...
" ,e moves to: se[t], scrip[t], 3133[7], pat[h], an[d], nam[e], withou[t], extensio[n], 1[1], dpn[0]
NeoBundle 'camelcasemotion'
NeoBundle 'smartword'
" <leader> w/f (interface like selecting link on vimp)
NeoBundle 'EasyMotion'
" Seek makes navigating long lines effortless, acting like f but taking two characters.
NeoBundle 'goldfeld/vim-seek'

NeoBundle 'vim-scripts/sudo.vim'
NeoBundle 'vim-scripts/AnsiEsc.vim'
NeoBundle 'tyru/open-browser.vim'

NeoBundle 'tpope/vim-fugitive'

" Visualize your Vim undo tree.
NeoBundle 'sjl/gundo.vim'
NeoBundle 'adie/BlockDiff'

NeoBundle 'thinca/vim-ref'
NeoBundle 'vim-jp/vimdoc-ja'

filetype plugin indent on
