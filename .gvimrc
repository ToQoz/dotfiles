set scrolloff=5
" Key Binding
noremap ,s :source<Space>~/.vimrc<CR>:source<Space>~/.gvimrc<CR>

highlight SpecialKey term=underline ctermfg=darkgray guifg=#666666

" Color
colorscheme Monokai
" solarized {{{{
"  let g:solarized_termcolors=256
"  colorscheme solarized
" }}}

" GUI
" set guioptions-=T
set guioptions=aceimgtbpF
" set columns=120
" set lines=100

if has('gui_macvim')
    " set transparency=5
endif

set guifont=Menlo\ for\ Powerline:h11
