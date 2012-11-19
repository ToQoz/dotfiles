"==========================
" Vundle
"==========================
  syntax on
  set nocompatible
  filetype off
  if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#rc(expand('~/.vim/bundle/'))
  endif

  "==========================
  " Completion
  "==========================
  NeoBundle 'Shougo/neocomplcache'
  NeoBundle 'Shougo/neosnippet'
  " Perform all your vim insert mode completions with Tab
  NeoBundle 'ervandew/supertab'

  "==========================
  " Ref
  "==========================
  NeoBundle 'thinca/vim-ref'

  "==========================
  " Unite
  "==========================
  NeoBundle 'Shougo/unite.vim'
  NeoBundle 'tsukkee/unite-tag'
  " outline source for unite.vim
  NeoBundle 'h1mesuke/unite-outline'
  NeoBundle 'Shougo/unite-ssh'
  " NeoBundle 'ujihisa/unite-font'
  NeoBundle 'ujihisa/unite-colorscheme'
  NeoBundle 'Shougo/unite-session'

  "==========================
  " Shell
  "==========================
  " A tree explorer plugin for vim
  NeoBundle 'scrooloose/nerdtree'
  NeoBundle 'thinca/vim-quickrun'
  NeoBundle 'Shougo/vimshell'
  NeoBundle 'ujihisa/vimshell-ssh'
  NeoBundle 'Shougo/vimproc'
  NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \     'unix': 'make -f make_unix.mak'
      \    },
      \ }
  NeoBundle 'sjl/clam.vim'
  "NeoBundle 'rson/vim-conque'

  "==========================
  " Buffer/File/Tab
  "==========================
  " Visualize your Vim undo tree.
  NeoBundle 'sjl/gundo.vim'
  " With bufexplorer, you can quickly and easily switch between buffers.
  NeoBundle 'c9s/bufexplorer'
  NeoBundle 'Shougo/vimfiler'
  NeoBundle 'kien/ctrlp.vim'
  " A front for the Perl module App::Ack.
  NeoBundle 'mileszs/ack.vim'
  NeoBundle 'thinca/vim-qfreplace'
  NeoBundle 'kana/vim-tabpagecd'

  "==========================
  " Diff
  "==========================
  NeoBundle 'adie/BlockDiff'

  "==========================
  " Search
  "==========================
  NeoBundle 'thinca/vim-visualstar'
  NeoBundle 'smartword'

  "==========================
  " Git Plugin
  "==========================
  " NeoBundle 'kana/vim-metarw'
  " NeoBundle 'kana/vim-metarw-git'
  NeoBundle 'tpope/vim-fugitive'

  "==========================
  " Ruby Plugin
  "==========================
  NeoBundle 'ruby.vim'
  " Move {if .. end} {def .. end} by pressing % in ruby
  NeoBundle 'ruby-matchit'
  " Expand if<CR> to if [condition] end
  NeoBundle 'tpope/vim-endwise'
  " Syntax highlight for rspec
  NeoBundle 'taq/vim-rspec'
  NeoBundle 'tpope/vim-rails'
  " tpope's rails.vim modified to work with padrino projects
  " NeoBundle 'spllr/vim-padrino'
  NeoBundle 'ujihisa/neco-ruby'
  NeoBundle 'tyru/open-browser.vim'
  " Wise completion
  " NeoBundle 'Shougo/neocomplcache-rsense'
  NeoBundle 'taichouchou2/vim-rsense'
  " NeoBundle 'git://gist.github.com/3903798.git'

  " display ruby, rake, and rspec output colorized in ConqueTerm
  "NeoBundle 'skwp/vim-ruby-conque'

  "==========================
  " Text Plugin
  "==========================
  " Vim plugin: Operators to edit surrounding text
  NeoBundle 'tpope/vim-surround'
  " Vim plugin: Support for user-defined text objects
  NeoBundle 'kana/vim-textobj-user'
  " A custom text object for selecting ruby blocks.
  NeoBundle 'nelstrom/vim-textobj-rubyblock'
  NeoBundle 'rorymckinley/vim-symbols-strings'
  NeoBundle 'Align'
  " text filtering and alignment
  NeoBundle 'godlygeek/tabular'
  NeoBundle 'h1mesuke/vim-alignta'
  " Vim plugin: Provide pseudo clipboard register for non-GUI version of Vim
  NeoBundle 'matchit.zip'
  " NeoBundle 'kana/vim-smartchr'
  NeoBundle 'tomtom/tcomment_vim'

  "==========================
  " Appearance Plugin
  "==========================
  " A Vim plugin for visually displaying indent levels in code
  NeoBundle 'nathanaelkane/vim-indent-guides'
  NeoBundle 'kien/rainbow_parentheses.vim'
  NeoBundle 'Lokaltog/vim-powerline'

  "==========================
  " JavaScript Plugin
  "==========================
  " Vastly improved javascript indentation
  " NeoBundle 'vim-scripts/Better-Javascript-Indentation'
  " NeoBundle 'pangloss/vim-javascript'
  " vim omnifunc for JavaScript
  NeoBundle 'teramako/jscomplete-vim'
  " CoffeeScript support for vim
  " Vim plugin for Titanium Desktop/Mobile
  " NeoBundle 'pekepeke/titanium-vim'
  NeoBundle 'kchmck/vim-coffee-script'
  " Vim Jade template engine syntax highlighting and indention
  " Enhanced javascript syntax file for Vim
  NeoBundle 'ToQoz/vim-javascript-syntax'
  " jasmine snipet set
  NeoBundle 'snipMate'
  NeoBundle 'Jasmine-snippets-for-snipMate'
  NeoBundle 'jQuery'

  "==========================
  " HTML Plugin
  "==========================
  " Vim Jade template engine syntax highlighting and indention
  NeoBundle 'digitaltoad/vim-jade'
  " Vim runtime files for Haml, Sass, and SCSS
  NeoBundle 'tpope/vim-haml'
  " HTML5 omnicomplete and syntax
  NeoBundle 'othree/html5.vim'
  NeoBundle 'tpope/vim-markdown'

  "==========================
  " CSS Plugin
  "==========================
  " Add CSS3 syntax support to vim's built-in `syntax/css.vim`
  NeoBundle 'hail2u/vim-css3-syntax'

  "==========================
  " Scheme Plugin
  "==========================
  " guache syntax
  NeoBundle 'haruyama/scheme.vim'

  "==========================
  " Other lang Plugin
  "==========================
  " nginx.vim highlights configuration files for nginx
  NeoBundle 'nginx.vim'
  NeoBundle 'xmledit'
  NeoBundle 'jnwhiteh/vim-golang'
  NeoBundle 'scrooloose/syntastic'

  "==========================
  " ColorScheme Plugin
  "==========================
  NeoBundle 'desert256.vim'
  NeoBundle 'mrkn256.vim'
  NeoBundle 'altercation/vim-colors-solarized'
  NeoBundle 'yuroyoro/yuroyoro256.vim'
  NeoBundle 'jelera/vim-nazca-colorscheme'
  NeoBundle 'aereal/vim-magica-colors'
  NeoBundle 'tpope/vim-vividchalk'
  NeoBundle 'nanotech/jellybeans.vim'
  NeoBundle 'sickill/vim-monokai'
  NeoBundle 'molokai'

  "==========================
  " Others
  "==========================
  " NeoBundle 'tyru/vim-altercmd'
  NeoBundle 'grep.vim'
  NeoBundle 'thinca/vim-scouter'
  NeoBundle 'vim-scripts/sudo.vim'
  NeoBundle 'gmarik/vundle'
  NeoBundle 'vim-scripts/AnsiEsc.vim'
  NeoBundle 'rhysd/accelerated-jk'
  " move column like w command.
  NeoBundle 'deris/columnjump'
  " NeoBundle 'Smooth-Scroll'
  NeoBundle 'smartword'
  " move by Camel/snake case ward
  " set script_31337_path_and_name_without_extension_11=%~dpn0
  " ,w moves to ([x] is cursor position): [s]et, [s]cript, [3]1337, [p]ath, [a]nd, [n]ame, [w]ithout, [e]xtension, [1]1, [d]pn0, dpn[0], [s]et
  " ,b moves to: [d]pn0, [1]1, [e]xtension, [w]ithout, ...
  " ,e moves to: se[t], scrip[t], 3133[7], pat[h], an[d], nam[e], withou[t], extensio[n], 1[1], dpn[0]
  NeoBundle 'camelcasemotion'
  " <leader> w/f (interface like selecting link on vimp)
  NeoBundle 'EasyMotion'
  " NeoBundle 'git@github.com:ToQoz/Smooth-Scroll.git'
  " Perl/Ruby style regexp notation for Vim
  NeoBundle 'othree/eregex.vim'
  NeoBundle 'TwitVim'
  NeoBundle 'restart.vim'
  NeoBundle 'vim-jp/vimdoc-ja'

  filetype plugin indent on
