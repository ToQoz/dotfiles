" set nocompatible
filetype off

if has('vim_starting')
  execute 'set runtimepath+=' . expand('~/.vim/bundle/neobundle.vim')
  syntax enable
endif

call neobundle#rc(expand('~/.vim/bundle'))

" -----------------------------------------------------------------------------
"  Plugins
" -----------------------------------------------------------------------------

" Neocomplete
NeoBundle 'Shougo/neocomplete.vim'

" Snippet
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'mattn/sonictemplate-vim'

" Unite {{{
NeoBundle 'Shougo/unite.vim'
" http://mugijiru.seesaa.net/article/200968763.html
let g:unite_enable_split_vertically = 1
let g:unite_enable_start_insert = 1
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'Shougo/unite-session'
NeoBundle 'Shougo/neomru.vim'
" }}}

NeoBundle 'Shougo/vimproc', {
      \   'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \     'unix': 'make -f make_unix.mak'
      \   },
      \ }

" TextObj {{{
" Vim plugin: Operators to edit surrounding text
NeoBundle 'tpope/vim-surround'
NeoBundle 'kana/vim-textobj-user'
" Text object to select a range of words for humans.
" NeoBundle 'h1mesuke/textobj-wiw'
" }}}

" Use one tab page per project
NeoBundle 'kana/vim-tabpagecd'

" Ruby {{{
" Move {if .. end} {def .. end} by pressing % in ruby
NeoBundle 'ruby.vim'
NeoBundle 'supermomonga/neocomplete-rsense.vim'
NeoBundleLazy 'ruby-matchit', {
      \ 'autoload' : { 'filetypes': [ 'ruby', 'eruby', 'haml', 'slim' ] }
      \ }
" Expand if<CR> to if [condition] end
NeoBundleLazy 'tpope/vim-endwise', {
      \ 'autoload' : { 'filetypes': [ 'ruby' ] }
      \ }
NeoBundle 'tpope/vim-rails'
" }}}

" Golang {{{
NeoBundle 'dgryski/vim-godef'
NeoBundle 'Blackrush/vim-gocode'
NeoBundle 'soh335/unite-outline-go'
" }}}

" extended % matching for HTML, LaTeX, and many other languages
NeoBundle 'matchit.zip'

NeoBundle 'scrooloose/syntastic'
let g:syntastic_go_checkers = ['go', 'gofmt', 'golint', 'govet']


" statusline
NeoBundle 'bling/vim-airline'

" Colorscheme {{{
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'aereal/vim-magica-colors'
NeoBundle 'sickill/vim-monokai'
NeoBundle 'molokai'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'w0ng/vim-hybrid'
" }}}

" Moving {{{
" <leader> w/f (interface like selecting link on vimp)
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'rhysd/clever-f.vim'
let g:clever_f_use_migemo = 1
let g:clever_f_across_no_line = 1
let g:clever_f_fix_key_direction = 1
" Seek makes navigating long lines effortless, acting like f but taking two characters.
NeoBundle 'goldfeld/vim-seek'
NeoBundle 'smartword'
" }}}

" toggle comment
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'vim-scripts/sudo.vim'
NeoBundle 'vim-scripts/AnsiEsc.vim'
NeoBundle 'tyru/open-browser.vim'
" Git
NeoBundle 'tpope/vim-fugitive'
" Perl/Ruby style regexp notation for Vim
NeoBundle 'othree/eregex.vim'
NeoBundle 'thinca/vim-qfreplace'
NeoBundle 'sjl/gundo.vim'
" 現在の検索位置を画面に表示するためのプラグイン
NeoBundle 'osyo-manga/vim-anzu'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'tyru/vim-altercmd'
NeoBundle 'ToQoz/gentle_quitman.vim'
" search in OSX Dictionary
NeoBundle 'modsound/macdict-vim.git', {
      \   'build': {
      \     'mac': 'cd autoload && make'
      \    },
      \ }
nmap <leader>di :MacDict<Space>
NeoBundle 'vim-jp/vimdoc-ja'
" http://qiita.com/yahihi/items/5e83f918a141b665cbba
" :helptags ~/.vim/bundle/vimdoc-ja/doc

" -----------------------------------------------------------------------------
"  Settings
" -----------------------------------------------------------------------------

augroup MdFile
  autocmd!
  au BufRead,BufNewFile *.md setl noexpandtab shiftwidth=4 tabstop=4 softtabstop=4
augroup END

" Golang {{{

if $GOROOT != ''
  set rtp+=$GOROOT/misc/vim
endif

if $GOPATH != ''
  set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
endif

augroup GoFile
  autocmd!
  au FileType go setl noexpandtab shiftwidth=8 tabstop=8 softtabstop=8
  au FileType go nnoremap <leader>f :Import fmt<CR>
  au FileType go nnoremap <leader>F :Drop fmt<CR>
augroup END
" }}}
"

" http://www.kaoriya.net/blog/2014/03/30/
set undofile
set undodir=~/.vim/undo

" Encoding {{{
set fileencodings=utf-8,iso-2022-jp,euc-jp,cp932,ucs-bom,default,latin1
set encoding=utf-8
set termencoding=utf-8
" }}}

set relativenumber

" Backup & Swap {{{
" http://d.hatena.ne.jp/yuyarin/20100225/1267084794 for editing crontab on OSX
set backupskip=/tmp/*,/private/tmp/*
set nobackup
set swapfile
set directory=~/.vim/swp
" }}}

" not turning line
set textwidth=0
" keep blank when scroll {{{
set scrolloff=1
set sidescrolloff=5
" }}}

" " auto load when edit buffer in other
" set autoread

if $TMUX  ==  '' || $TMUX_USE_CLIPBOARD != ''
  set clipboard=unnamed
endif

" tty {{{
set mouse=a
set ttymouse=xterm2
set ttyfast
" }}}

set lazyredraw
set fileformats=unix,dos,mac
set formatoptions-=ro

" Tab {{{
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
" }}}

" Create directory automatically {{{
augroup VimrcAutoMkdir
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)
    if !isdirectory(a:dir) && (a:force ||
          \ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction
augroup END
" }}}

set nowrap

set bg=dark

if &t_Co == 8 && $TERM !~# '^linux'
  set t_Co=16
endif

if &term =~ '256color'
  set t_Co=256
  " colorscheme solarized
  " set bg=light
  let g:hybrid_use_iTerm_colors = 1
  colorscheme hybrid
  set t_Sf=[3%dm
  set t_Sb=[4%dm
else
  colorscheme desert
endif

" set relativenumber
set number
" beep
set visualbell
" add multibyte in text option
set formatoptions=lmoq
" highlight cursor line
set cursorline
" draw box only current window
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END

set laststatus=2
set lazyredraw
set title
set showcmd
" split right or below
set splitright
set splitbelow

" highlight { }
set showmatch

"==========================
" Special Keys
"==========================
" show invisible character
highlight SpecialKey term=underline ctermfg=darkgray guifg=#666666
set ambiwidth=double
set list
set listchars=tab:>.,precedes:<,extends:>,eol:↵
" highlight space at eof before save
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
" highlight space
highlight ZenkakuSpace cterm=underline ctermbg=red guibg=red
match ZenkakuSpace /　/

set wildmenu
set wildmode=list:longest
set completeopt=menu,preview,menuone
set complete-=i

" Don't insert the first word on completion
" http://d.hatena.ne.jp/osyo-manga/20131011/1381501432
inoremap <C-x><C-f> <C-x><C-f><C-p>
inoremap <C-x><C-o> <C-x><C-o><C-p>

set ruler
" show current vim mode
set showmode

" let mapleader=","

" C-g to ESC
imap <C-G> <ESC>
vmap <C-G> <ESC>

" Reload vimrc
noremap <leader>s :source ~/.vimrc<CR>

" Back tag stack
nmap <C-B> :po<CR>

" Yank to $
nmap Y y$
" Select last pasted
nnoremap <expr> gp  '`[' . strpart(getregtype(), 0, 1) . '`]'
" Yank/Paste into clipboard {{{
nnoremap <leader>p "*p
vnoremap <leader>p "*p
noremap <leader>y "*y
vnoremap <leader>y "*y
noremap <leader>Y "*Y
vnoremap <leader>Y "*Y
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
" autocmd BufWritePre * :%s/\s\+$//ge

" Rename file
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))
" }}}

"==========================
" FileType
"==========================
" set filetype
augroup MyInit
  autocmd!
  autocmd FileType c               set expandtab tabstop=4 shiftwidth=4 softtabstop=4
  autocmd FileType gitconfig       setl noexpandtab shiftwidth=4 tabstop=4 softtabstop=4
  autocmd FileType ruby            nnoremap <leader>r :execute '!spring rspec ' . @% . ':' . line('.')<CR>
  autocmd FileType ruby            let ruby_space_errors = 1
  autocmd BufRead,BufNewFile *.erb set filetype=eruby.html
augroup END

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
" }}}

" Disable automatically inserting comment on newline
autocmd FileType * setlocal formatoptions-=ro

" quit help by `q`
autocmd FileType help nnoremap <buffer> q <C-w>c

" ++
" moving
" ++

" enable delete former line by backspace
set backspace=2
" not to stop line top and end
set whichwrap=b,s,h,l,<,>,[,]
"==========================
" Search
"==========================
" when use small letter ignore case
set ignorecase
set smartcase
" indent setting
set smartindent
" highlight searchword
set hlsearch
" when search end return top
set wrapscan
" inc search
set incsearch
" clear search highlight {{{
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif
" }}}

" http://qiita.com/kentaro/items/42159874a0637d57ae1a
nnoremap go :<C-u>call append('.', '')<CR>
nnoremap gO :normal! O<ESC>j

set runtimepath+=~/.vim
runtime! conf.d/*.vim

filetype plugin indent on
syntax on

NeoBundleCheck
