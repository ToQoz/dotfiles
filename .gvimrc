" Key Binding
noremap ,s :source<Space>~/.vimrc<CR>:source<Space>~/.gvimrc<CR>

highlight SpecialKey term=underline ctermfg=darkgray guifg=#666666

" Color
set t_Co=256
colorscheme desert

" GUI
" set guioptions-=T
set guioptions=aceimgtbpF
set columns=80
set lines=60

if has('gui_macvim')
    set transparency=5
endif

set guifont=Ricty:h15
