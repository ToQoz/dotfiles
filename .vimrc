set nocompatible
filetype off

if has('vim_starting')
  execute 'set runtimepath+=' . expand('~/.vim/bundle/neobundle.vim')
  syntax enable
endif

call neobundle#rc(expand('~/.vim/bundle'))

let s:gopath = $GOPATH
if s:gopath == ''
  let s:gopath = system('go env GOPATH')
endif
let s:gopath = split(s:gopath, ':')[0]

let s:goroot = $GOROOT
if s:goroot == ''
  let s:goroot = system('go env GOROOT')
endif
let s:goroot = split(s:goroot, ':')[0]

augroup MyAutoCmds
  autocmd!
augroup END

" Encoding
set fileencodings=utf-8,iso-2022-jp,euc-jp,cp932,ucs-bom,default,latin1
set encoding=utf-8
set termencoding=utf-8

" Backup, Swap, Undo
" for editing crontab on OSX http://d.hatena.ne.jp/yuyarin/20100225/1267084794
set backupskip=/tmp/*,/private/tmp/*
set nobackup
set swapfile
set directory=~/.vim/swp
" http://www.kaoriya.net/blog/2014/03/30/
set undofile
set undodir=~/.vim/undo

" not turning line
set textwidth=0
set scrolloff=20
set sidescrolloff=5

set noautoread
set noautowrite

if $TMUX  == '' || $TMUX_USE_CLIPBOARD != ''
  set clipboard=unnamed
endif

" tty
set mouse=a
set ttymouse=xterm2
set ttyfast

set lazyredraw
set fileformats=unix,dos,mac
set nowrap

" show current vim mode
set showmode
set ruler
set number
set relativenumber
set visualbell
set showtabline=2
set formatoptions& formatoptions+=mM
set formatoptions-=ro " Disable automatically inserting comment on newline
set cursorline
set laststatus=2
set lazyredraw
set title
set showcmd
set splitright
set splitbelow
set showmatch
set wildmenu
set wildmode=list:longest
set completeopt=menu,preview,menuone
set complete-=i

" Moving
" enable delete former line by backspace
set backspace=2
" not to stop line top and end
set whichwrap=b,s,h,l,<,>,[,]

" Search
set ignorecase
set smartcase " when use small letter ignore case
set smartindent
set hlsearch
set wrapscan " return top when reach end of search results
set incsearch

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Color
set bg=dark
let s:colorscheme = 'desert'

if &t_Co == 8 && $TERM !~# '^linux'
  set t_Co=16
endif

if &term =~ '256color'
  set t_Co=256
  let s:colorscheme = 'molokai'
endif

" Special Keys
" show invisible character
highlight SpecialKey term=underline ctermfg=darkgray guifg=#666666
set ambiwidth=double
set list
set listchars=tab:>.,precedes:<,extends:>,eol:↵
" highlight space at eof before save
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
" highlight zenkaku space
highlight ZenkakuSpace cterm=underline ctermbg=red guibg=red
match ZenkakuSpace /　/

" Mappings {{{
" let mapleader=","

" clear search highlight
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

noremap Q  <Nop>
noremap ZQ <Nop>
noremap ZZ <Nop>

" Reload vimrc
nnoremap <leader>s :source ~/.vimrc<CR>
" Back tag stack
nnoremap <C-B> :po<CR>

" Don't insert the first word on completion
" http://d.hatena.ne.jp/osyo-manga/20131011/1381501432
inoremap <C-x><C-f> <C-x><C-f><C-p>
inoremap <C-x><C-o> <C-x><C-o><C-p>

nmap Y y$
" Select last pasted
nnoremap <expr>  gp '`[' . strpart(getregtype(), 0, 1) . '`]'
nnoremap <leader>p  "*p
vnoremap <leader>p  "*p
nnoremap <leader>y  "*y
vnoremap <leader>y  "*y
nnoremap <leader>Y  "*Y
vnoremap <leader>Y  "*Y

" Use emacs keybind in comand line mode
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <C-P> <UP>
cnoremap <C-N> <Down>
cnoremap <C-k> <C-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>

" Moving tab
nnoremap <Tab> gt
nnoremap <S-Tab> gT
" }}}

autocmd MyAutoCmds FileType    *               call s:softTab(4)
autocmd MyAutoCmds FileType    gitconfig       call s:hardTab(8)
autocmd MyAutoCmds FileType    go              call s:hardTab(8) 
autocmd MyAutoCmds FileType    zsh             call s:softTab(2)
autocmd MyAutoCmds FileType    vim             call s:softTab(2)

autocmd MyAutoCmds FileType    help nnoremap <buffer> q <C-w>c " quit help by `q`
autocmd MyAutoCmds BufWritePre *    call s:autoMkdir(expand('<afile>:p:h'), v:cmdbang)
autocmd MyAutoCmds CmdwinEnter *    call s:cmdwinEnter()
autocmd MyAutoCmds FileType    ruby nnoremap <leader>r :execute '!spring rspec ' . @% . ':' . line('.')<CR>
autocmd MyAutoCmds FileType    go   call s:hiErr()

function! s:hiErr()
  call s:hardTab(8)
  " http://yuroyoro.hatenablog.com/entry/2014/08/12/144157
  highlight err cterm=bold ctermfg=214
  match err /\c[a-z0-9]*err /
endfunction

function! s:autoMkdir(dir, force)
  if !isdirectory(a:dir) && (a:force ||
        \ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction

" http://vim-users.jp/2010/07/hack161/
function! s:cmdwinEnter()
  nnoremap <buffer>            q :<C-u>quit<CR>
  nnoremap <buffer> <TAB>      :<C-u>quit<CR>
  inoremap <buffer><expr><CR>  pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
  inoremap <buffer><expr><C-h> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
  inoremap <buffer><expr><BS>  pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"

  " Completion.
  inoremap <buffer><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
  startinsert!
endfunction

function! s:softTab(width)
  setl expandtab
  call s:tabWidth(a:width)
endfunction

function! s:hardTab(width)
  setl noexpandtab
  call s:tabWidth(a:width)
endfunction

function! s:tabWidth(width)
  execute 'setl shiftwidth=' . a:width
  execute 'setl tabstop=' . a:width
  execute 'setl softtabstop=' . a:width
endfunction

NeoBundle 'Shougo/vimproc', {
      \   'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \     'unix': 'make -f make_unix.mak'
      \   },
      \ }

" Completion
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'supermomonga/neocomplete-rsense.vim'

" Snippet
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'mattn/sonictemplate-vim'

" Unite
NeoBundle 'Shougo/unite.vim'
" http://mugijiru.seesaa.net/article/200968763.html
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'Shougo/unite-outline' " fork from h1mesuke/unite-outline
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'Shougo/unite-session'
NeoBundle 'thinca/vim-unite-history'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'soh335/unite-outline-go'
NeoBundle 'ToQoz/unite-go-imports'
NeoBundle 'ToQoz/unite-go-doc'

" TextObj
" Vim plugin: Operators to edit surrounding text
NeoBundle 'tpope/vim-surround'
NeoBundle 'kana/vim-textobj-user'

" Ruby
NeoBundle 'ruby.vim'
NeoBundle 'ruby-matchit'
NeoBundle 'tpope/vim-endwise' " Expand if<CR> to if [condition] end
NeoBundle 'tpope/vim-rails'

" Golang
NeoBundle 'dgryski/vim-godef'
NeoBundle 'Blackrush/vim-gocode'
NeoBundle 'vim-jp/go-vim'
execute 'set rtp+=' . s:gopath . '/src/github.com/golang/lint/misc/vim'
execute 'set rtp+=' . s:gopath . '/src/github.com/ToQoz/goimps/misc/vim'
NeoBundle 'ToQoz/vim-go-drop-unused-imports'

" Moving
" <leader> w/f (interface like selecting link on vimp)
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'rhysd/clever-f.vim'
" Seek makes navigating long lines effortless, acting like f but taking two characters.
NeoBundle 'goldfeld/vim-seek'

NeoBundle 'bling/vim-airline'
NeoBundle "mkitt/tabline.vim"

NeoBundle 'thinca/vim-poslist'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'vim-jp/vimdoc-ja' 
NeoBundle 'nathanaelkane/vim-indent-guides'
" Use one tab page per project
NeoBundle 'kana/vim-tabpagecd'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'vim-scripts/sudo.vim'
NeoBundle 'tpope/vim-fugitive'
" Perl/Ruby style regexp notation for Vim
NeoBundle 'othree/eregex.vim'
NeoBundle 'vim-scripts/Rename'
NeoBundle 'thinca/vim-qfreplace'
NeoBundle 'sjl/gundo.vim'
" 現在の検索位置を画面に表示するためのプラグイン
NeoBundle 'osyo-manga/vim-anzu'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'tyru/vim-altercmd'
NeoBundle 'ToQoz/gentle_quitman.vim'
" OSX Dictionary interface
NeoBundle 'modsound/macdict-vim.git', {
      \   'build': {
      \     'mac': 'cd autoload && make'
      \    },
      \ }

" Colorschemes
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'aereal/vim-magica-colors'
NeoBundle 'sickill/vim-monokai'
NeoBundle 'molokai'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'w0ng/vim-hybrid'

if neobundle#tap("neocomplete.vim") " {{{
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
  let g:neocomplete#force_overwrite_completefunc      = 1
  let g:neocomplete#sources#buffer#disabled_pattern   = '\.log\|\.log\.\|\.jax\|Log.txt'
endif " }}}

if neobundle#tap("neosnippet") " {{{
  imap <C-k> <Plug>(neosnippet_expand_or_jump)
  smap <C-k> <Plug>(neosnippet_expand_or_jump) 
endif " }}}

if neobundle#tap("sonictemplate-vim") " {{{
  let g:sonictemplate_vim_template_dir = ['$HOME/.vim/template']
endif " }}}

if neobundle#tap("unite.vim") " {{{
  execute 'let g:unite_data_directory = "' . expand('~/.vim/.unite') . '"'
  " let g:unite_enable_split_vertically = 1
  let g:unite_enable_start_insert     = 1
  let g:unite_source_rec_max_cache_files = 5000
  let g:unite_force_overwrite_statusline = 0

  if !executable($GOPATH.'/bin/pt')
    let cmd = "go get -v github.com/monochromegane/the_platinum_searcher/cmd/pt"
    echo "start: " . cmd
    let out = system(cmd)
    if v:shell_error
      echoerr "failed: " . cmd . ": " . out
    endif
  endif
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_grep_encoding = 'utf-8'

  nmap <C-x> [unite]
  nnoremap [unite]<C-u> :<C-u>Unite<Space>

  nnoremap [unite]/ :<C-u>Unite line -buffer-name=search -start-insert<CR>
  nnoremap [unite]* :<C-u>UniteWithCursorWord line -buffer-name=search<CR>
  nnoremap [unite]n :<C-u>UniteResume search -no-start-insert<CR>
  nnoremap <silent> [unite]f :<C-u>Unite file_rec/async:!<CR>
  nnoremap <silent> [unite]F :<C-u>Unite file_rec:!<CR>
  nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
  nnoremap <silent> [unite]y :Unite -buffer-name=register register<CR>

  autocmd MyAutoCmds FileType unite call s:ftUnite()
  function! s:ftUnite()
    " quit when press esc twice
    nnoremap <buffer> q i_<Plug>(unite_exit)
    nnoremap <buffer> <C-g> <Plug>(unite_insert_leave)
    inoremap <buffer> <C-g> <Plug>(unite_insert_leave)
  endfunction

  if neobundle#is_installed("unite-outline")
    nnoremap <silent> [unite]o :Unite outline<CR>
  endif

  if neobundle#is_installed("unite-session")
    nnoremap <silent> [unite]s :UniteSessionSave<Space>
  endif

  if neobundle#is_installed("neomru.vim")
    nnoremap <silent> [unite]m :<C-u>UniteWithCurrentDir file_mru -buffer-name=files<CR>
    nnoremap <silent> [unite]M :<C-u>UniteWithBufferDir  file_mru -buffer-name=files<CR>
  endif

  if neobundle#is_installed("unite-go-imports")
    autocmd MyAutoCmds FileType go nnoremap <C-i>      :Unite go/import<CR>
    autocmd MyAutoCmds FileType go inoremap <C-i>      <ESC>:Unite go/import<CR>
    autocmd MyAutoCmds FileType go vnoremap <C-i>      <ESC>:Unite go/import<CR>
    autocmd MyAutoCmds FileType go nnoremap <leader>dd :Unite go/drop<CR>
  endif

  if neobundle#is_installed("unite-go-doc")
    autocmd MyAutoCmds FileType go nnoremap <C-?> :Unite go/doc<CR>
  endif

  if neobundle#is_installed("vim-poslist")
    nnoremap <silent> [unite]p :<C-u>Unite poslist<CR>
  endif
endif " }}}

if neobundle#tap('vim-go-drop-unused-imports') " {{{
  nnoremap <leader>du :DropUnused<CR>
endif " }}}

if neobundle#tap('vim-easymotion') " {{{
  let g:EasyMotion_keys       = 'hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
  let g:EasyMotion_leader_key = "'"
  let g:EasyMotion_grouping   = 1
endif " }}}

if neobundle#tap('clever-f.vim') " {{{
  let g:clever_f_use_migemo        = 1
  let g:clever_f_across_no_line    = 1
  let g:clever_f_fix_key_direction = 1
endif " }}}

if neobundle#tap('syntastic') " {{{
  let g:syntastic_enable_signs             = 1
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_mode_map                 = {
        \   'mode': 'active',
        \   'active_filetypes': [],
        \   'passive_filetypes': ['html']
        \ }
  let g:syntastic_enable_highlighting = 1
  let g:syntastic_ruby_exec           = expand('~/.rbenv/shims/ruby')
  let g:syntastic_go_checkers         = ['go', 'golint', 'govet']
endif " }}}

if neobundle#tap('vim-indent-guides') " {{{
  let g:indent_guides_enable_on_vim_startup = 0
  let g:indent_guides_auto_colors = 1
  let g:indent_guides_start_level = 2
  let g:indent_guides_guide_size  = 1
endif " }}}

if neobundle#tap('eregexp.vim') " {{{
  let g:eregex_default_enable = 1
  nnoremap <leader>/ :call eregex#toggle()<CR>
endif " }}}

if neobundle#tap('vim-altercmd') " {{{
  if neobundle#is_installed('gentle_quitman.vim')
    call altercmd#load()
    AlterCommand q GQ
    AlterCommand GQ q
    AlterCommand wq GWQ
    AlterCommand GWQ wq   
  endif
endif " }}}

if neobundle#tap('go-vim') " {{{
  let g:gofmt_command = "goimps fmt"
  nnoremap <leader>f  :Import fmt<CR>
  nnoremap <leader>F  :Drop fmt<CR>
endif " }}}

execute 'colorscheme ' . s:colorscheme

filetype plugin indent on
syntax on
NeoBundleCheck

" vim:set ft=vim et foldmethod=marker:
