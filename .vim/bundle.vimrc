"==========================
" Vundle
"==========================
  syntax on
  set nocompatible
  filetype off
  set rtp+=~/.vim/bundle/vundle
  call vundle#rc()

  "==========================
  " Completion
  "==========================
  Bundle 'Shougo/neocomplcache'
  " Perform all your vim insert mode completions with Tab
  Bundle 'ervandew/supertab'

  "==========================
  " Ref
  "==========================
  Bundle 'thinca/vim-ref'

  "==========================
  " Unite
  "==========================
  Bundle 'Shougo/unite.vim'
  Bundle 'tsukkee/unite-tag'
  " outline source for unite.vim
  Bundle 'h1mesuke/unite-outline'
  " Perl/Ruby style regexp notation for Vim
  Bundle 'othree/eregex.vim'

  "==========================
  " Shell
  "==========================
  " A tree explorer plugin for vim
  Bundle 'scrooloose/nerdtree'
  Bundle 'thinca/vim-quickrun'
  Bundle 'Shougo/vimshell'
  Bundle 'Shougo/vimproc'
  "Bundle 'rson/vim-conque'

  "==========================
  " Buffer/File
  "==========================
  " Visualize your Vim undo tree.
  Bundle 'sjl/gundo.vim'
  " With bufexplorer, you can quickly and easily switch between buffers.
  Bundle 'c9s/bufexplorer'
  Bundle 'Shougo/vimfiler'
  Bundle 'kien/ctrlp.vim'
  " A front for the Perl module App::Ack.
  Bundle 'mileszs/ack.vim'

  "==========================
  " Diff
  "==========================
  Bundle 'adie/BlockDiff'

  "==========================
  " Search
  "==========================
  Bundle 'thinca/vim-visualstar'
  Bundle 'smartword'

  "==========================
  " Git Plugin
  "==========================
  " Bundle 'kana/vim-metarw'
  "Bundle 'kana/vim-metarw-git'
  Bundle 'tpope/vim-fugitive'

  "==========================
  " Ruby Plugin
  "==========================
  Bundle 'ruby.vim'
  " Move {if .. end} {def .. end} by pressing % in ruby
  Bundle 'ruby-matchit'
  " Expand if<CR> to if [condition] end
  Bundle 'tpope/vim-endwise'
  " Wise completion
  Bundle 'git://gist.github.com/3903798.git'
  " Syntax highlight for rspec
  Bundle 'taq/vim-rspec'
  Bundle 'tpope/vim-rails'
  " tpope's rails.vim modified to work with padrino projects
  " Bundle 'spllr/vim-padrino'
  Bundle 'ujihisa/neco-ruby'
  Bundle 'tyru/open-browser.vim'
  " display ruby, rake, and rspec output colorized in ConqueTerm
  "Bundle 'skwp/vim-ruby-conque'

  "==========================
  " Text Plugin
  "==========================
  " Vim plugin: Operators to edit surrounding text
  Bundle 'tpope/vim-surround'
  Bundle 'Align'
  " text filtering and alignment
  Bundle 'godlygeek/tabular'
  Bundle 'h1mesuke/vim-alignta'
  " Vim plugin: Provide pseudo clipboard register for non-GUI version of Vim
  Bundle 'matchit.zip'
  Bundle 'kana/vim-smartchr'
  Bundle 'tomtom/tcomment_vim'

  "==========================
  " Appearance Plugin
  "==========================
  " A Vim plugin for visually displaying indent levels in code
  Bundle 'nathanaelkane/vim-indent-guides'
  Bundle 'kien/rainbow_parentheses.vim'
  Bundle 'Lokaltog/vim-powerline'

  "==========================
  " JavaScript Plugin
  "==========================
  " Vastly improved javascript indentation
  " Bundle 'vim-scripts/Better-Javascript-Indentation'
  " Bundle 'pangloss/vim-javascript'
  " vim omnifunc for JavaScript
  Bundle 'teramako/jscomplete-vim'
  " CoffeeScript support for vim
  " Vim plugin for Titanium Desktop/Mobile
  " Bundle 'pekepeke/titanium-vim'
  Bundle 'kchmck/vim-coffee-script'
  " Vim Jade template engine syntax highlighting and indention
  " Enhanced javascript syntax file for Vim
  Bundle 'jelera/vim-javascript-syntax'
  " jasmine snipet set
  Bundle 'snipMate'
  Bundle 'Jasmine-snippets-for-snipMate'
  Bundle 'jQuery'

  "==========================
  " HTML Plugin
  "==========================
  " Vim Jade template engine syntax highlighting and indention
  Bundle 'digitaltoad/vim-jade'
  " Vim runtime files for Haml, Sass, and SCSS
  Bundle 'tpope/vim-haml'
  " HTML5 omnicomplete and syntax
  Bundle 'othree/html5.vim'
  Bundle 'tpope/vim-markdown'

  "==========================
  " CSS Plugin
  "==========================
  " Add CSS3 syntax support to vim's built-in `syntax/css.vim`
  Bundle 'hail2u/vim-css3-syntax'

  "==========================
  " Scheme Plugin
  "==========================
  " guache syntax
  Bundle 'haruyama/scheme.vim'

  "==========================
  " Other lang Plugin
  "==========================
  " nginx.vim highlights configuration files for nginx
  Bundle 'nginx.vim'
  Bundle 'xmledit'
  Bundle 'jnwhiteh/vim-golang'
  Bundle 'scrooloose/syntastic'

  "==========================
  " ColorScheme Plugin
  "==========================
  Bundle 'desert256.vim'
  Bundle 'mrkn256.vim'
  Bundle 'altercation/vim-colors-solarized'
  Bundle 'yuroyoro/yuroyoro256.vim'
  Bundle 'jelera/vim-nazca-colorscheme'
  Bundle 'aereal/vim-magica-colors'
  Bundle 'tpope/vim-vividchalk'
  Bundle 'nanotech/jellybeans.vim'
  Bundle 'sickill/vim-monokai'
  Bundle 'molokai'

  "==========================
  " Others
  "==========================
  Bundle 'thinca/vim-scouter'
  Bundle 'vim-scripts/sudo.vim'
  Bundle 'gmarik/vundle'
  Bundle 'vim-scripts/AnsiEsc.vim'

  filetype plugin indent on
