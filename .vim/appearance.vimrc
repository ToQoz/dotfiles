"if !has("gui_running")
"     set term=xterm
"endif
set bg=dark
if &term =~ '256color'
  set t_Co=256
  colorscheme Monokai
  set t_Sf=[3%dm
  set t_Sb=[4%dm
else
  colorscheme desert
endif

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
set lazyredraw
set ttyfast
" highlight { }
set showmatch

"==========================
" Special Keys
"==========================
" show invisible character
highlight SpecialKey term=underline ctermfg=darkgray guifg=#666666
set list
set listchars=eol:$,tab:>\ ,extends:<
" highlight space at eof before save
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
" highlight space
highlight ZenkakuSpace cterm=underline ctermbg=red guibg=red
match ZenkakuSpace /　/
