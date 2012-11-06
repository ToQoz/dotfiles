" code from https://gist.github.com/1518874#L336
function! s:has_plugin(name)
  return globpath(&runtimepath, 'plugin/' . a:name . '.vim') !=# ''
  \   || globpath(&runtimepath, 'autoload/' . a:name . '.vim') !=# ''
endfunction

function! GetBufname(bufnr, tail)
  let bufname = bufname(a:bufnr)
  if bufname =~# '^[[:alnum:].+-]\+:\\\\'
    let bufname = substitute(bufname, '\\', '/', 'g')
  endif
  let buftype = getbufvar(a:bufnr, '&buftype')
  if bufname ==# ''
    if buftype ==# ''
      return '[No Name]'
    elseif buftype ==# 'quickfix'
      return '[Quickfix List]'
    elseif buftype ==# 'nofile' || buftype ==# 'acwrite'
      return '[Scratch]'
    endif
  endif
  if buftype ==# 'nofile' || buftype ==# 'acwrite'
    return bufname
  endif
  if a:tail
    return fnamemodify(bufname, ':t')
  endif
  let fullpath = fnamemodify(bufname, ':p')
  if exists('b:lcd') && b:lcd !=# ''
    let bufname = matchstr(fullpath, '^\V\(' . escape(b:lcd, '\')
    \ . '\v)?[/\\]?\zs.*')
  endif
  return bufname
endfunction

function! s:tabpage_label(n)
  let n = a:n
  let bufnrs = tabpagebuflist(n)
  let curbufnr = bufnrs[tabpagewinnr(n) - 1]  " first window, first appears

  let hi = n is tabpagenr() ? 'TabLineSel' : 'TabLine'

  let label = ''
  if getbufvar(curbufnr, '&filetype') =~# '^lingr-'
    " lingr-vim
    let unread = lingr#unread_count()
    let status = lingr#status()

    let label .= '%#' . hi . '#'
    let label .= 'lingr - ' . status
    if unread != 0
      let label .= '(' . unread . ')'
    endif

  else
    let no = len(bufnrs)
    if no is 1
      let no = ''
    endif
    let mod = len(filter(bufnrs, 'getbufvar(v:val, "&modified")')) ? '+' : ''
    let sp = (no . mod) ==# '' ? '' : ' '
    let fname = GetBufname(curbufnr, 1)

    if no !=# ''
      let label .= '%#' . hi . 'Number#' . no
    endif
    let label .= '%#' . hi . '#'
    let label .= mod . sp . fname
  endif

  return '%' . a:n . 'T' . label . '%T%#TabLineFill#'
endfunction

function! MakeTabLine()
  let titles = map(range(1, tabpagenr('$')), 's:tabpage_label(v:val)')
  let sep = ' | '

  let tabs = join(titles, sep) . sep . '%#TabLineFill#%T'
  let info = '%#TabLine#'
  if exists('t:tabline_extra')
    let info .= t:tabline_extra . sep
  endif
  if s:has_plugin('cfi')
    let info .= cfi#format('%s()' . sep, '')
  endif
  if exists('*Uptime')
    let info .= Uptime(2) . sep
  endif
  let info .= fnamemodify(getcwd(), ":~") . ' '
  return tabs . '%=' . info
endfunction
set showtabline=2
set tabline=%!MakeTabLine()
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
