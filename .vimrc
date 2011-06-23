"""
" ===Vundle Setting===
set nocompatible
filetype off

set rtp+=~/.vim/vundle.git/
call vundle#rc()

" original repos on github
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'thinca/vim-quickrun'
Bundle 'thinca/vim-ref'
Bundle 'Shougo/vimshell'
Bundle 'vim-ruby/vim-ruby'
Bundle 'violetyk/cake.vim'

" vim-scripts repos
" Bundle 'rails.vim'

" non github repos
" Bundle 'git://git.wincent.com/command-t.git'

"""

colorscheme desert
syntax on
filetype plugin indent on

set encoding=utf-8
set number
set ruler
set title
set background=dark
set nobackup
set noswapfile
" show invisible character
set list
set listchars=eol:$,tab:>\ ,extends:<
" beep
set visualbell
" add multibyte in text option
set formatoptions=lmoq 
" enable delete former line by backspace
set backspace=2
" not to stop line top and end
set whichwrap=b,s,h,l,<,>,[,]

"" status line
" show current vim mode
set showmode

"" show encoding and EOF
if winwidth(0) >= 120
    set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\%F%=[%{GetB()}]\ %l,%c%V%8P
else
    set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\%f%=[%{GetB()}]\ %l,%c%V%8P
endif

function! GetB()
    let c = matchstr(getline('.'), '.', col('.') - 1)
    let c = iconv(c, &enc, &fenc)
    return String2Hex(c)
endfunction
" help eval-examples
" The function Nr2Hex() returns the Hex string of a number.
func! Nr2Hex(nr)
    let n = a:nr
    let r = ""
    while n
        let r = '0123456789ABCDEF'[n % 16] . r
        let n = n / 16
    endwhile
    return r
endfunc
" The function String2Hex() converts each character in a string to a two
" character Hex string.
func! String2Hex(str)
    let out = ''
    let ix = 0
    while ix < strlen(a:str)
        let out = out . Nr2Hex(char2nr(a:str[ix]))
        let ix = ix + 1
    endwhile
    return out
endfunc

"" search
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
" hide highlight seachword
" nmap <esc><esc> ;nohlsearch<CR><esc>

" split right or below
set splitright
set splitbelow
" tab setting
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set laststatus=2
" clipboard use in OS
set clipboard+=unnamed
" esc key map
imap <C-g> <esc>
vmap <C-g> <esc>
" omit t when you use ( or )
" don't move. because of original command live
" URL http://vim-users.jp/2011/04/hack214/
" onoremap ) t)
" onoremap ( t(
" vnoremap ) t)
" vnoremap ( t(

" highlight space
"highlight ZenkakuSpace cterm=underline ctermbg=red guibg=red
"match ZenkakuSpace /　/

" set filetype
autocmd BufNewFile,BufRead *.wsgi set filetype=python
autocmd BufNewFile,BufRead *.ctp set filetype=php
autocmd BufNewFile,BufRead *.vimrc set filetype=vim
autocmd BufNewFile,BufRead *.vimperatorrc set filetype=vim
autocmd BufNewFile,BufRead *.vrapperrc set filetype=vim
autocmd BufNewFile,BufRead *.go set filetype=go

" Enable omni completion.
autocmd FileType eruby,html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType html,javascript setl expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType xml setl omnifunc=xmlcomplete#CompleteTags
autocmd FileType css setl omnifunc=csscomplete#CompleteCSS
autocmd FileType css setl expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType javascript setl omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl omnifunc=pythoncomplete#Complete
autocmd FileType ruby setl expandtab tabstop=2 shiftwidth=2 softtabstop=2
" URL http://d.hatena.ne.jp/babie/20110130/1296347719
"augroup MyXML
"  autocmd!
"  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
"  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
"  autocmd Filetype eruby inoremap <buffer> </ </<C-x><C-o>
"augroup END

""
" Ruby
" extra space
let ruby_space_errors=1

""
" PHP
" sql syntax in string
let php_sql_query=1
" html syntax in string
let php_htmlInStrings=1
" ban short tag
let php_noShortTags=1

"""
" plugins

""
" neocomplecache
"
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use auto select
"let g:neocomplcache_enable_auto_select = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
" Set manual completion length.
let g:neocomplcache_manual_completion_start_length = 0

" " Define dictionary.
 let g:neocomplcache_dictionary_filetype_lists = {
\'default' : '',
\ 'java' : $HOME.'/.vim/dict/java.dict',
\ 'cpp' : $HOME.'/.vim/dict/cpp.dict',
\ 'javascript' : $HOME.'/.vim/dict/javascript.dict',
\ 'css' : $HOME.'/.vim/dict/css.dict',
\ 'ocaml' : $HOME.'/.vim/dict/ocaml.dict',
\ 'perl' : $HOME.'/.vim/dict/perl.dict',
\ 'php' : $HOME.'/.vim/dict/php.dict',
\ 'ruby' : $HOME.'/.vim/dict/ruby.dict',
\ 'python' : $HOME.'/.vim/dict/python.dict',
\ 'vim' : $HOME.'/.vim/dict/vim.dict'
\ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
   let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
"
"let g:neocomplcache_snippets_dir = $HOME.'/snippets'


"" 
" unite.vim

nnoremap    [unite]   <Nop>
nmap    f [unite]

nnoremap [unite]u  :<C-u>Unite<Space>
nnoremap <silent> [unite]a  :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]f  :<C-u>Unite -buffer-name=files file<CR>
nnoremap <silent> [unite]b  :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]m  :<C-u>Unite file_mru<CR>
