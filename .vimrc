"""
" ===Vundle Setting===
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" original repos on github
Bundle 'vim-scripts/sudo.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimfiler'
Bundle 'thinca/vim-quickrun'
Bundle 'thinca/vim-ref'
Bundle 'Shougo/vimshell'
" Bundle 'cake.vim'
Bundle 'kana/vim-metarw'
Bundle 'kana/vim-metarw-git'
" Bundle 'Pydiction'
Bundle 'ruby.vim'
Bundle 'tpope/rails.vim'
Bundle 'matchit.zip'
Bundle 'surround.vim'
Bundle 'vim-scripts/Better-Javascript-Indentation'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'derekwyatt/vim-scala'
Bundle 'vim-fakeclip'
Bundle 'python_fold'
Bundle 'digitaltoad/vim-jade'
Bundle 'altercation/vim-colors-solarized'
Bundle 'haruyama/scheme.vim'
Bundle 'othree/html5.vim'

Bundle 'hail2u/vim-css3-syntax'
Bundle 'digitaltoad/vim-jade'
" jasmine snipet set
Bundle 'snipMate'
Bundle 'Jasmine-snippets-for-snipMate'
Bundle 'gerardc/vim-padrino'

Bundle 'gmarik/vundle'


" vim-scripts repos
" Bundle 'rails.vim'

" non github repos
" Bundle 'git://git.wincent.com/command-t.git'

"""

" Window
set laststatus=2
set lazyredraw
set title
set showcmd

syntax on
set background=dark
" let g:solarized_termcolors=16
" colorscheme solarized
colorscheme desert

filetype plugin indent on

set encoding=utf-8
set number
set ruler
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

set wrap
set showmatch
set cursorline

highlight SpecialKey term=underline ctermfg=darkgray guifg=#666666

" Command
set wildmenu
set wildmode=list:longest
set completeopt=menu,preview,menuone

noremap ,s :so<Space>~/.vimrc<CR>
" noremap n :tabnew<Space>

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
" clipboard use in OS
" set clipboard+=unnamed
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
augroup FileTypeGroup
    autocmd! FileTypeGroup
    autocmd BufNewFile,BufRead *.wsgi set filetype=python
    autocmd BufNewFile,BufRead *.ctp set filetype=php
    autocmd BufNewFile,BufRead *.vimrc set filetype=vim
    autocmd BufNewFile,BufRead *.vimperatorrc set filetype=vim
    autocmd BufNewFile,BufRead *.vrapperrc set filetype=vim
    autocmd BufNewFile,BufRead *.go set filetype=go
    autocmd FileType scheme :let is_gauche=1
augroup END

" Enable omni completion.
augroup OmniCompletionGroup
    autocmd! OmniCompletionGroup
    autocmd FileType eruby,html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType html,javascript,coffee setl expandtab tabstop=2 shiftwidth=2 softtabstop=2
    autocmd FileType xml setl omnifunc=xmlcomplete#CompleteTags
    autocmd FileType css setl omnifunc=csscomplete#CompleteCSS
    autocmd FileType css setl expandtab tabstop=2 shiftwidth=2 softtabstop=2
    autocmd FileType javascript setl omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
    autocmd FileType python setl omnifunc=pythoncomplete#Complete
    autocmd FileType ruby setl expandtab tabstop=2 shiftwidth=2 softtabstop=2
augroup END
" URL http://d.hatena.ne.jp/babie/20110130/1296347719
"augroup MyXML
"  autocmd!
"  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
"  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
"  autocmd Filetype eruby inoremap <buffer> </ </<C-x><C-o>
"augroup END
"

""
" JavaScript
"
" fold
function! JavaScriptFold()
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen

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
let php_folding = 1

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
\ 'scala' : $HOME.'/.vim/dict/scala.dict',
\ 'cpp' : $HOME.'/.vim/dict/cpp.dict',
\ 'c' : $HOME.'/.vim/dict/c.dict',
\ 'lua' : $HOME.'/.vim/dict/lua.dict',
\ 'javascript' : $HOME.'/.vim/dict/javascript.dict',
\ 'ocaml' : $HOME.'/.vim/dict/ocaml.dict',
\ 'perl' : $HOME.'/.vim/dict/perl.dict',
\ 'php' : $HOME.'/.vim/dict/php.dict',
\ 'scheme' : $HOME.'/.vim/dict/scheme.dict',
\ 'vm' : $HOME.'/.vim/dict/vim.dict'
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
" http://mugijiru.seesaa.net/article/200968763.html
" Uniteを開く時、垂直分割で開く
let g:unite_enable_split_vertically=1
" 色々乗せたのだけとりあえず設定
noremap <C-_> :Unite -buffer-name=files buffer file_mru bookmark file<CR>
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>


" ファイルを開く時、ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')

nnoremap [unite]   <Nop>
nmap f [unite]

nnoremap [unite]u  :<C-u>Unite<Space>
nnoremap <silent> [unite]a  :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]f  :<C-u>Unite -buffer-name=files file<CR>
nnoremap <silent> [unite]b  :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]m  :<C-u>Unite file_mru<CR>

" -------------------------------------------------------------
" endtagcomment.vim
"  - https://gist.github.com/734448
"  - created by @hokaccha
"  - folked by @kosei27
"  
" -------------------------------------------------------------
" update: 2010-12-08 @kosei27
" -------------------------------------------------------------
"
" こういうHTMLがあったときに
"
"       <div id="hoge" class="fuga">
"       ...
"       </div>
"
" 実行するとこうなる
"
"       <div id="hoge" class="fuga">
"       ...
"       <!-- /div#hoge.fuga --></div>
"
" -------------------------------------------------------------
" ,ti でidのみを出力
" ,tc でclassのみを出力(",tt" ",t" も同様)
" ,ta でidとclassを出力
" ,t<Space> でコメント内のテキストの前後の空白をトグル
" <!--/hoge-->  <->  <!-- /hoge -->
" -------------------------------------------------------------

nnoremap ,ti :<C-u>call Endtagcomment('id')<CR>
nnoremap ,tc :<C-u>call Endtagcomment('class')<CR>
nnoremap ,ta :<C-u>call Endtagcomment('id_class')<CR>
nnoremap ,tg :<C-u>call Endtagcomment('tag_id_class')<CR>
nmap     ,tt :<C-u>normal ,tc<CR>
nnoremap <silent> ,t.  :<C-u>call Endtagcomment_firstclass_symbol_toggle()<CR>
nnoremap <silent> ,t<Space>  :<C-u>call Endtagcomment_space_toggle()<CR>


function! Endtagcomment(type)
    let reg_save = @@

    try
        silent normal vaty
    catch
        execute "normal \<Esc>"
        echohl ErrorMsg
        echo 'no match html tags'
        echohl None
        return
    endtry

    let html = @@

    let start_tag = matchstr(html, '\v(\<.{-}\>)')
    let tag_name  = matchstr(start_tag, '\v([a-zA-Z]+)')

    let comment_type = a:type
    let comment_space = g:endtagcomment_space
    let firstclass_symbol = g:endtagcomment_firstclass_symbol

    let id = ''
    let id_match = matchlist(start_tag, '\vid\=["'']([^"'']+)["'']')
    if exists('id_match[1]')
        let id = '#' . id_match[1]
    endif

    let class = ''
    let class_match = matchlist(start_tag, '\vclass\=["'']([^"'']+)["'']')
    if exists('class_match[1]')
        "let class = '.' . join(split(class_match[1], '\v\s+'), '.')
        let class = join(split(class_match[1], '\v\s+'), '.')
    endif

    execute "normal `>va<\<Esc>`<"

    if l:comment_type == 'id'
        let g:endtagcommentFormat = '<!--%comment_space/%id%comment_space-->'
    elseif l:comment_type == 'class'
        let g:endtagcommentFormat = '<!--%comment_space/%firstclass_symbol%class%comment_space-->'
    elseif l:comment_type == 'id_class'
        let g:endtagcommentFormat = '<!--%comment_space/%id.%class%comment_space-->'
    elseif l:comment_type == 'tag_id_class'
        let g:endtagcommentFormat = '<!--%comment_space/%tag_name%id.%class%comment_space-->'
    endif

    let comment = g:endtagcommentFormat
    let comment = substitute(comment, '%comment_space', comment_space, 'g')
    let comment = substitute(comment, '%firstclass_symbol', firstclass_symbol, 'g')
    let comment = substitute(comment, '%tag_name', tag_name, 'g')
    let comment = substitute(comment, '%id', id, 'g')
    let comment = substitute(comment, '%class', class, 'g')

    let @@ = comment

    normal ""P

    let @@ = reg_save
endfunction

"let g:endtagcommentFormat = '<!-- /%tag_name%id%class -->'


" コメント内のテキストの前後の空白
let g:endtagcomment_space = ''
"" 有無をトグル
function! Endtagcomment_space_toggle()
  let comment_space = g:endtagcomment_space
  if l:comment_space == ''
    let g:endtagcomment_space = ' '
  else
    let g:endtagcomment_space = ''
  endif
endfunction


" コメント内のテキストの最初のclass名の「.」
let g:endtagcomment_firstclass_symbol = ''
"" 有無をトグル（id+classの場合は固定で「.」がつきます）
function! Endtagcomment_firstclass_symbol_toggle()
  let firstclass_symbol = g:endtagcomment_firstclass_symbol
  if l:firstclass_symbol == ''
    let g:endtagcomment_firstclass_symbol = '.'
  else
    let g:endtagcomment_firstclass_symbol = ''
  endif
endfunction
