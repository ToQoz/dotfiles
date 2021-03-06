set scrolloff=5

" Key Binding
noremap <leader>s :source<Space>~/.vimrc<CR>:source<Space>~/.gvimrc<CR>
highlight SpecialKey term=underline ctermfg=darkgray guifg=#666666

let g:hybrid_use_Xresources = 1
colorscheme hybrid

" Color
" GUI Options
"" c: use console dialog instead of popup dialog for simple selection
set guioptions=c
" Font
set guifont=Ricty:h16
