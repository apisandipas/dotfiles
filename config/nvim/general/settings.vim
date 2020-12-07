""" ---------------------------------------------------------------- Shell
let &shell='/bin/zsh -i'    " point defauly shell to zsh
set shellcmdflag=-ic        " load zshrc 

""" ---------------------------------------------------------------- Appearance
colorscheme base16-google-dark " Set colorscheme
syntax enable               " Enable syntax highlighting
filetype plugin indent on   " Enable filtype detection and indent plugin

set cursorline              " Highlight currentline
set autoread                " Autoreload this file in vim if it was changed out of vim
set splitright splitbelow   " open new split panes to right and below
set list                    " Display unprintable characters
set listchars=tab:•\ ,trail:•,extends:»,precedes:« " Show trailing whitespace chars
set fillchars+=vert:\       " remove buffer divider lines

" ---------------------------------------------------O------------- Basic Behavior

set number          " show line numbers
set relativenumber  " show reltive line numbers
set wrap            " wrap lines
set encoding=utf-8  " set encoding to UTF-8
set mouse=a         " enable mouse support
set wildmenu        " visual autocomplete for commend menu
set lazyredraw      " redraw screen only when we need to
set showmatch       " highlight matching parens and brackets
set noswapfile      " disable swap-fils
set noerrorbells    " disable the goddamn bell
set visualbell      " blink the curror instead of beeping
set hidden          " allow buffers to be switched w/o saving first
set autochdir       " Set pwd to the current buffers directory
set noshowmode
set noruler
set laststatus=0
set showtabline=2

" Enable persistent undo so that undo history persists across vim sessions
set undofile
set undodir=~/.config/nvim/undodir
set formatoptions-=cro " Dont auto-insert comments on new lines after comments
set clipboard+=unnamedplus " Use global clipboard as yank register

""" ---------------------------------------------------------------- Tab Settings

set tabstop=2       " width of a <TAB> character displays as
set expandtab       " convert <TAB> key-presses to spaces
set shiftwidth=2    " number of spaces to use for each step of auto indent
set softtabstop=2   " backspace after pressing <TAB> will remove up this many spaces
set autoindent      " copy indent from the current line when starting a new line
set smartindent     " end better autoindent

""" ---------------------------------------------------------------- Search settings

set incsearch       " Search as characters are entered
set hlsearch        " Hightlight matches

