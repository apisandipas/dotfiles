        "________ ++ ________
       "/VVVVVVVV\\++++ /VVVVVVVV\\
       "\VVVVVVVV/++++++\VVVVVVVVV/
        "|VVVVVV|++++++++/VVVVV/'
        "|VVVVVV|++++++/VVVVV/'
       "+|VVVVVV|++++/VVVVV/'+
     "+++|VVVVVV|++/VVVVV/'+++++
   "+++++|VVVVVV|/VVVVV/'+++++++++
     "+++|VVVVVVVVVVVV/'+++++++++
       "+|VVVVVVVVV/'+++++++++
        "|VVVVVVV/'+++++++++
        "|VVVVV/'+++++++++
        "|VVV/'+++++++++
        "'V/' ++++++
                 "++


" zsh
let &shell='/bin/zsh -i'

" load zshrc
set shellcmdflag=-ic  

""" ---------------------------------------------------------------- Load plugins
call plug#begin('~/.vim/plugged/')
  Plug 'voldikss/vim-floaterm'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-vinegar'
  Plug 'tpope/vim-fugitive'
  Plug 'mhinz/vim-startify'
  Plug 'airblade/vim-rooter'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'alvan/vim-closetag'
  Plug 'scrooloose/nerdcommenter'
  Plug 'chrisbra/Colorizer'
  "Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
  "Plug 'vim-airline/vim-airline'
  "Plug 'vim-airline/vim-airline-themes'
  Plug 'MaxMEllon/vim-jsx-pretty'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  Plug 'jparise/vim-graphql'
  Plug 'mattn/emmet-vim'
  Plug 'arcticicestudio/nord-vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'vim-scripts/loremipsum'
  Plug 'junegunn/goyo.vim'
  "Keep this one last as per project readme
  Plug 'ryanoasis/vim-devicons'
call plug#end()


""" ---------------------------------------------------------------- Appearance

"colorscheme nord            " Set colorscheme 
syntax enable		            " Enable syntax hightlighting
filetype plugin indent on   " Enable filtype detection and indent plugin

set colorcolumn=100         " Respect the limits!
set cursorline              " Highlight currentline
set autoread                " Autoreload this file in vim if it was changed outof vim

set splitright splitbelow   " open new split panes to right and below

" Tweak theme colors


hi Function ctermfg=4
hi Statement ctermfg=3
hi Type ctermfg=6
hi Comment ctermfg=4
hi Boolean ctermfg=2
hi PreProc ctermfg=4
hi Visual ctermbg=0
hi Special ctermfg=5
hi Underlined ctermfg=1 cterm=underline
hi StatusLine cterm=NONE,reverse
hi Identifier cterm=NONE

" search highlights
hi Search ctermbg=0 ctermfg=7 cterm=NONE

" popup menu
hi Pmenu ctermbg=0 ctermfg=7
hi PmenuSel ctermbg=14 ctermfg=0

" line numbers
hi LineNr ctermfg=4
hi CursorLine cterm=NONE ctermbg=0
hi CursorLineNr ctermbg=NONE ctermfg=5 cterm=NONE

highlight Comment ctermfg=Yellow ctermbg=None gui=italic cterm=italic
highlight htmlArg gui=italic cterm=italic
highlight htmlArg cterm=italic
highlight Type cterm=italic ctermfg=Green
highlight OverLength ctermbg=magenta ctermfg=black
match OverLength /\%101v.\+/  " Start OverLength highlight at line 101


"" ---------------------------------------------------------------- Basic Behavior

set number	 	      " show line numbers
set relativenumber	" show reltive line numbers
set wrap 		        " wrap lines
set encoding=utf-8	" set encoding to UTF-8
set mouse=a		      " enable mouse support
set wildmenu		    " visual autocomplete for commend menu
set lazyredraw		  " redraw screen only when we need to
set showmatch		    " hightlight matching parens and brackets
set noswapfile		  " disable swap-fils
set noerrorbells	  " disable the goddamn bell
set visualbell		  " blink the curror instead of beeping
set hidden		      " allow buffers to be switched w/o saving first
set autochdir       " Set pwd to the current buffers directory
set showmode 
set noruler
set laststatus=2
set showtabline=2

" Enable persistent undo so that undo history persists across vim sessions
set undofile
set undodir=~/.vim/.undodir
set formatoptions-=cro
set clipboard+=unnamedplus " Use global clipboard as yank register

" Dont auto-insert comments on new lines after comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


""" ---------------------------------------------------------------- Tab Settings

set tabstop=2		    " width of a <TAB> character displays as
set expandtab		    " convert <TAB> key-presses to spaces
set shiftwidth=2	  " number of spaces to use for each step of auto indent
set softtabstop=2	  " backspace after pressing <TAB> will remove up this many spaces
set autoindent      " copy indent from the current line when starting a new line
set smartindent     " end better autoindent

""" ---------------------------------------------------------------- Search settings

set incsearch       " Search as characters are entered
set hlsearch        " Hightlight matches


""" ---------------------------------------------------------------- Plugin Specific settings

let g:user_emmet_leader_key='<C-z>'
let g:rooter_patterns = ['.git', 'node_modules']
let g:closetag_filenames = '*.html,*.js,*.jsx,*.ts,*.tsx'
"let g:airline_powerline_fonts=1 	         
"let g:airline_theme='nord'  		         
"let g:airline#extensions#tabline#enabled=1
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
"let g:prettier#autoformat_require_pragma = 0
"let g:prettier#autoformat = 0
let g:colorizer_auto_filetype='css,html,scss,javascript,typescript'
let g:coc_snippet_next = '<tab>'
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',  
  \ 'coc-json',
  \ 'coc-explorer',
  \ 'coc-marketplace',
  \ 'coc-prettier'
  \ ]

let g:coc_explorer_global_presets = {
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow'
\   }
\ }

" Fuzzy Finder settings.
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
let $FZF_DEFAULT_COMMAND = 'rg --files --ignore-case --hidden -g "!{.git,node_modules,vendor}/*"'
command! -bang -nargs=? -complete=dir Files
     \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --theme=Nord --color=always --style=header,grid --line-range :300 {}'"

""" ---------------------------------------------------------------- Keybindings

" Turn off search highlighting with <CR>
nnoremap <CR> :nohlsearch<CR><CR>

" Map F5 to list buffers. Just enter buffer # and hit enter
map <F5> :buffers<CR>:buffer<Space>

" Map to Spellcheck
map <leader>sp :setlocal spell! spelllang=en_us<CR>

" Map F5 to list buffers. Just enter buffer # and hit enter
map <F5> :buffers<CR>:buffer<Space>

" Switch to Buffer to the Left
nmap <silent><S-left> :bp<CR>
vmap <silent><S-left> <Esc>:bp<CR>i
imap <silent><S-left> <Esc>:bp<CR>i

"Switch to Buffer to the Right
nmap <silent><S-right> :bp<CR>
vmap <silent><S-right> <Esc>:bp<CR>i
imap <silent><S-right> <Esc>:bp<CR>i

" Toggle previous Buffer
nnoremap <silent><S-Tab> :b#<CR>

" move vertically by visual line (dont skip wrapped lines)
nmap j gj
nmap k gk

" Easier navigation between splits
nnoremap <C-Down> <C-W><C-J>
nnoremap <C-Up> <C-W><C-K>
nnoremap <C-Right> <C-W><C-L>
nnoremap <C-Left> <C-W><C-H>

" Same as above but vimmier 
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" leader q to close buffer and explorer together 
nnoremap <leader>q :bp<cr>:bd #<cr>

" Use Ctrl+C to copy to global clipboard
map <c-c> "+y<CR>

" Use Ctrk+A to Yank entire buffer
map <c>-a> :% y+<CR>

" Autoformat on save
command! -nargs=0 Prettier :CocCommand prettier.formatFile
augroup FormatOnSave
  autocmd!
  autocmd BufWritePre *.ts,*.tsx,*.jsx,*.js,*.css,*.scss,*.less,*.graphql Prettier
augroup END

" Fuzzy Finder commands
nnoremap <Leader>ps :Rg<Space>
nnoremap <Leader>pf :Files<CR>
nnoremap <C-p> :GFiles<CR>

" Quick Save keybindings
map <Esc> :w<CR> 
map <leader>s :w<CR> 

" Sweet Sweet GIT!
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gs :G<CR>
nmap <leader>ga :G add -A<CR>
nmap <leader>gc :G commit<CR>
nmap <leader>gp :G push<CR>
nmap <leader>gy :!yolo<CR><CR>
nmap <label>g ::

" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" Normal mode indent with only one keypress
nmap > >>
nmap < <<

" Move visual block 
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

" Don't copy single letter deletes
nnoremap x "_x

" non-saving delete
noremap X "_d

" Repeat command for each line in selection
vnoremap . :normal .<CR>

" Search mappings: These will make it so that going to the next one in a 
" search will center on the line it's found in.
nnoremap n :<BS>nzzzv
nnoremap N :<BS>Nzzzv

"""  --------------------------------------------------------------- In-vim terminal 

" Toggle floating terminal 
tnoremap <leader>tt  <C-\><C-n>:FloatermToggle<CR>
tnoremap <Esc><Esc>  <C-\><C-n>:FloatermHide<CRe

" allow for eazy split resizing
nnoremap <silent> <a-Up> :exec "resize +5"<CR>
nnoremap <silent> <a-Down> :exec "resize -5"<CR>
nnoremap <silent> <a-Left> :exec "vertical:resize +5"<CR>
nnoremap <silent> <a-Right> :exec "vertical:resize -5"<CR>


" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" start terminal in insert mode
augroup AutoFocusTerminal
  autocmd!
  autocmd BufEnter * if (&buftype == 'terminal') |:startinsert | endif
augroup END

" open terminal on <leader>t
command! -nargs=0 ToggleTerminal :call ToggleTerminalFn()
nnoremap <Leader>t :ToggleTerminal<CR>

if !exists('s:bp_is_terminal_open')
  let s:is_terminal_open=0
endif

function! ToggleTerminalFn()
  if s:is_terminal_open == 1
    let s:is_terminal_open=0
    setlocal bufhidden=hide number relativenumber
    close
  else
    let s:is_terminal_open=1
    split term://zsh
    resize 10
    setlocal nonumber norelativenumber
  endif
endfunction


" use alt+hjkl to move between split/vsplit panels
tnoremap <c-a-Left> <C-\><C-n><C-w>h
tnoremap <c-a-Down> <C-\><C-n><C-w>j
tnoremap <c-a-Up> <C-\><C-n><C-w>k
tnoremap <c-a-Right> <C-\><C-n><C-w>l
nnoremap <c-a-Left> <C-w>h
nnoremap <c-a-Down> <C-w>j
nnoremap <c-a-Up> <C-w>k
nnoremap <c-a-Right> <C-w>l

" Fat-finger-proof commands
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
cnoreabbrev So so

""" ---------------------------------------------------------------- COC Explorer

" Open explorer on start up
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :exec ":CocCommand explorer --no-focus"
  autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
augroup END

nmap <C-n> :CocCommand explorer<CR>
nmap <a-c-n> :CocCommand explorer --preset floating<CR>

""" ---------------------------------------------------------------- COC-specific config:

" COC Related keybindings 

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>

" GoTo code navigation.
nmap <sirent> gd <Plug>(coc-definition)
nmap <silent> gt<Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<word>')
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

""" ---------------------------------------------------------------- Misc funtionality

" Auto reload .vimrc after saving
augroup ReloadVIMRC
  autocmd!
  autocmd BufWritePost $MYVIMRC silent! source $MYVIMRC | redraw
augroup END

"function! s:gitModified()
    "let files = systemlist('git ls-files -m 2>/dev/null')
    "return map(files, "{'line': v:val, 'path': v:val}")
"endfunction

"" same as above, but show untracked files, honouring .gitignore
"function! s:gitUntracked()
    "let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    "return map(files, "{'line': v:val, 'path': v:val}")
"endfunction

let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        "\ { 'type': 'sessions',  'header': ['   Sessions']       },
        "\ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        "\ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        "\ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        "\ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]


"augroup LazyGit
  "autocmd!
  "autocmd VimEnter * :exec ":FloatermNew  --title=LazyGit --height=0.9 --width=0.9 --wintype=floating --name=lazygit lazygit"
"augroup END

finish

