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

" load zshrc
set shellcmdflag=-ic  

""" Load plugins
call plug#begin('~/.vim/plugged/')
  Plug 'tpope/vim-sensible'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'alvan/vim-closetag'
  Plug 'scrooloose/nerdcommenter'
  Plug 'chrisbra/Colorizer'
  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'MaxMEllon/vim-jsx-pretty'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  Plug 'jparise/vim-graphql'
  Plug 'mattn/emmet-vim'
  Plug 'arcticicestudio/nord-vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'vim-scripts/loremipsum'
  "Keep this one last as per project readme
  Plug 'ryanoasis/vim-devicons'
call plug#end()

""" Appearance

colorscheme nord  " Set colorscheme 

" let base16colorspace=256
syntax enable		            " Enable syntax hightlighting
filetype plugin indent on   " Enable filtype detection and indent plugin

set cursorline              " Highlight currentline
set autoread                " Autoreload this file in vim if it was changed outof vim

highlight Comment ctermfg=cyan gui=italic cterm=italic
highlight htmlArg gui=italic cterm=italic

""" File Explorer settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" Open explorer on start up
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END


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
" set autochdir       " Set pwd to the current buffers directory


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
let g:airline_powerline_fonts=1 	         " Enable powerline fonts
let g:prettier#autoformat_require_pragma = 0 " Enable autoformatter

let g:airline_theme='nord'  		         " enable airline theme

let g:airline#extensions#tabline#enabled=1 " enable airline tabline extention
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

let g:colorizer_auto_filetype='css,html,scss,javascript,typescript'

" Fuzzy Finder settings.
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
let $FZF_DEFAULT_COMMAND = 'rg --files --ignore-case --hidden -g "!{.git,node_modules,vendor}/*"'
command! -bang -nargs=? -complete=dir Files
     \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --theme=Nord --color=always --style=header,grid --line-range :300 {}'"


"coc config
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

" move vertically by visual line (dont skip wrapped lines)
nmap j gj
nmap k gk

" Easier navigation between splits
nnoremap <C-Down> <C-W><C-J>
nnoremap <C-Up> <C-W><C-K>
nnoremap <C-Right> <C-W><C-L>
nnoremap <C-Left> <C-W><C-H>

" leader q to close buffer and nerdtreee together 
nnoremap <leader>q :bp<cr>:bd #<cr>

" Use Ctrl+C to copy to global clipboard
map <C-c> "+y<CR>

" Autoformat on save
let g:prettier#autoformat = 0
autocmd BufWritePre *.ts,*.tsx,*.jsx,*.js,*.css,*.scss,*.less,*.graphql Prettier

" COC Related keybindings 
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Fuzzy Finder commands
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>pf :Files<CR>

" Map ESC to save on Normal Mode
map <Esc> :w<CR> 
map <leader>s :w<CR> 

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

" Use tab for coc completion 
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Sweet Sweet FuGITive
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gs :G<CR>
nmap <leader>ga :G add -A<CR>
nmap <leader>gp :G push<CR>

" Toggle File Explorer with Ctrl+n
let g:NetrwIsOpen=1

function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction

" Add your own mapping. For example:
noremap <silent> <C-n> :call ToggleNetrw()<CR>
