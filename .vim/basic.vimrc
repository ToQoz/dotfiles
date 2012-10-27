" Encoding
set encoding=utf-8
" Backup
set nobackup
set noswapfile
" not turning line
set textwidth=0
" keep blank when scroll
set scrolloff=5
" auto load when edit buffer in other
set autoread

if $TMUX  ==  '' || $TMUX_USE_CLIPBOARD != ''
  set clipboard+=unnamed
endif

"==========================
" Tab
"==========================
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
