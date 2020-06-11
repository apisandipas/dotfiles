""""""""""""""""""""""""""""""""""""""
"        .__                         "
"  ___  _|__| ____________   ____    "
"  \  \/ /  |/     \_  __ \_/ ___\   "
"   \   /|  |  Y Y  \  | \/\  \___   "
" /\ \_/ |__|__|_|  /__|    \___  >  "
" \/              \/            \/   "
"                                    "
""""""""""""""""""""""""""""""""""""""

" zsh
let &shell='/bin/zsh -i'

""" Load plugins
call plug#begin('~/.vim/plugged/')
  Plug 'tpope/vim-sensible'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'alvan/vim-closetag'
  Plug 'scrooloose/nerdtree'
  Plug 'scrooloose/nerdcommenter'
  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'MaxMEllon/vim-jsx-pretty'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  Plug 'mattn/emmet-vim'
  Plug 'mhinz/vim-startify'
  Plug 'arcticicestudio/nord-vim'
  Plug 'jiangmiao/auto-pairs'
  "Keep this one last as per project readme
  Plug 'ryanoasis/vim-devicons'
call plug#end()

""" Appearance

colorscheme nord  " Set colorscheme on Linux

" let base16colorspace=256
syntax enable		            " Enable syntax hightlighting
filetype plugin indent on   " Enable filtype detection and indent plugin

" set cursorline              " Highlight currentline
set autoread                " Autoreload this file in vim if it was changed outof vim

highlight clear cursorline
highlight StatusLine ctermbg=black
highlight LineNr ctermfg=blue ctermbg=black
highlight CursorLineNr ctermfg=red ctermbg=black
highlight Comment gui=italic cterm=italic
highlight htmlArg gui=italic cterm=italic

""" Basic Behavior

set number	 	      " show line numbers
set relativenumber	" show reltive line numbers
set wrap 		        " wrap lines
set encoding=utf-8	" set encoding to UTF-8
set mouse=a		      " enablel mouse support
set wildmenu		    " visual autocomplete for commend menu
set lazyredraw		  " redraw screen only when we need to
set showmatch		    " hightlight matching parens and brackets
set laststatus=2	  " always show statusline
set ruler		        " show line and col number of the cursor
set noswapfile		  " disable swap-files
set noerrorbells	  " disable the goddamn bell
set visualbell		  " blink the curror instead of beeping
set hidden		      " allow buffers to be switched w/o saving first

""" Tab Settings

set tabstop=2		    " width of a <TAB> character displays as
set expandtab		    " convert <TAB> key-presses to spaces
set shiftwidth=2	  " number of spaces to use for each step of auto indent
set softtabstop=2	  " backspace after pressing <TAB> will remove up this many spaces
set autoindent      " copy indent from the current line when starting a new line
set smartindent     " end better autoindent

""" Search settings

set incsearch       " Search as characters are entered
set hlsearch        " Hightlight matches

" Turn off search highlighting with <CR>
nnoremap <CR> :nohlsearch<CR><CR>

""" Plugin Specific settings
let g:closetag_filenames = '*.html,*.js,*.jsx,*.ts,*.tsx'
let NERDTreeShowHidden=1  		             " Show hidden files in NERDTree
let g:airline_powerline_fonts=1 	         " Enable powerline fonts
let g:prettier#autoformat_require_pragma = 0 " Enable autoformatter

let g:airline_theme='nord'  		         " enable airline theme

let g:airline#extensions#tabline#enabled=1 " enable airline tabline extention
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',  
  \ 'coc-json', 
  \ ]
""" Keybindings

" Map F5 to list buffers. Just enter buffer # and hit enter
map <F5> :buffers<CR>:buffer<Space>

" Map F6 to Spellcheck
map <F6> :setlocal spell! spelllang=en_us<CR>

" Switch to Previous Buffer
nmap <F7> :bp<CR>
vmap <F7> <Esc>:bp<CR>i
imap <F7> <Esc>:bp<CR>i

"Switch to Next Buffer
nmap <F8> :bn<CR>
vmap <F8> <Esc>:bn<CR>i
imap <F8> <Esc>:bn<CR>i

" Ctrl+N to toggle file view
map <C-n> :NERDTreeToggle<CR>

" move vertically by visual line (dont skip wrapped lines)
nmap j gj
nmap k gk

" Easier navigation between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Autoformat on save
let g:prettier#autoformat = 0
autocmd BufWritePre *.ts,*.tsx,*.jsx,*.js,*.css,*.scss,*.less,*.graphql Prettier

" COC Related keybindings 
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

