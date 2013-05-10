" Encoding {{{
set fileencodings=utf-8,iso-2022-jp,euc-jp,cp932,ucs-bom,default,latin1
set encoding=utf-8
set termencoding=utf-8
" }}}

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
" auto load when edit buffer in other
set autoread

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

" Cursor {{{
let &t_ti.="\e[2 q"
let &t_SI.="\e[6 q"
let &t_EI.="\e[2 q"
let &t_te.="\e[0 q"
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
