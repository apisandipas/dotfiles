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
  Plug 'junegunn/goyo.vim'
  "Keep this one last as per project readme
  Plug 'ryanoasis/vim-devicons'
call plug#end()


""" ---------------------------------------------------------------- Appearance

colorscheme nord            " Set colorscheme 
syntax enable		            " Enable syntax hightlighting
filetype plugin indent on   " Enable filtype detection and indent plugin

"set cursorline              " Highlight currentline
set autoread                " Autoreload this file in vim if it was changed outof vim

" Tweak theme colors 
highlight Comment ctermfg=Yellow gui=italic cterm=italic
highlight htmlArg gui=italic cterm=italic

""" ---------------------------------------------------------------- Basic Behavior

set number	 	      " show line numbers
set relativenumber	" show reltive line numbers
set wrap 		        " wrap lines
set encoding=utf-8	" set encoding to UTF-8
set mouse=a		      " enable mouse support
set wildmenu		    " visual autocomplete for commend menu
set lazyredraw		  " redraw screen only when we need to
set showmatch		    " hightlight matching parens and brackets
set laststatus=2	  " always show last command in statusline
"set ruler		        " show line and col number of the cursor
set noswapfile		  " disable swap-files
set noerrorbells	  " disable the goddamn bell
set visualbell		  " blink the curror instead of beeping
set hidden		      " allow buffers to be switched w/o saving first
set autochdir       " Set pwd to the current buffers directory

" Use global clipboard as yank register
set clipboard+=unnamedplus 

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

" Turn off search highlighting with <CR>
nnoremap <CR> :nohlsearch<CR><CR>

""" ---------------------------------------------------------------- Plugin Specific settings

let g:user_emmet_leader_key='<C-z>'
let g:rooter_patterns = ['.git', 'node_modules']
let g:closetag_filenames = '*.html,*.js,*.jsx,*.ts,*.tsx'
let g:airline_powerline_fonts=1 	         
let g:airline_theme='nord'  		         
let g:airline#extensions#tabline#enabled=1
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:prettier#autoformat_require_pragma = 0
let g:prettier#autoformat = 0
let g:colorizer_auto_filetype='css,html,scss,javascript,typescript'
let g:coc_snippet_next = '<tab>'
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',  
  \ 'coc-json',
  \ 'coc-explorer',
  \ 'coc-marketplace'
  \ ]
  " TODO - add coc-prettier and drom vim-prettier

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

" Map F5 to list buffers. Just enter buffer # and hit enter
map <F5> :buffers<CR>:buffer<Space>

" Map to Spellcheck
map <leader>sp :setlocal spell! spelllang=en_us<CR>

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

" leader q to close buffer and explorer together 
nnoremap <leader>q :bp<cr>:bd #<cr>

" Use Ctrl+C to copy to global clipboard
map <C-c> "+y<CR>

" Use Ctrk+A to Yank entire buffer
map <C-a> :% y+<CR>

" Autoformat on save
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

"""  --------------------------------------------------------------- In-vim terminal 

" allow for eazy split resizing
nnoremap <silent> <a-Up> :exec "resize +5"<CR>
nnoremap <silent> <a-Down> :exec "resize -5"<CR>
nnoremap <silent> <a-Left> :exec "vertical:resize +5"<CR>
nnoremap <silent> <a-Right> :exec "vertical:resize -5"<CR>

" open new split panes to right and below
set splitright
set splitbelow

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


function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]


"augroup LazyGit
  "autocmd!
  "autocmd VimEnter * :exec ":FloatermNew  --title=LazyGit --height=0.9 --width=0.9 --wintype=floating --name=lazygit lazygit"
"augroup END



finish


"function! EnvelopeToggle()
  "if (expand("%") == '.env')
    "redir => currentShVarColor
      "hi shVar
    "redir end
    "echo substitute(currentShVarColor, 'shVar          xxx', '', 'ig')
    "highlight shVariable ctermfg=yellow ctermbg=yellow
    "highlight shVar ctermfg=yellow ctermbg=yellow
  "else
    "highlight shVariable ctermbg=none ctermfg=red
    "highlight shVar ctermbg=none ctermfg=green
  "endif
"endfunction
"
"nnoremap <leader>y :call EnvelopeToggle()<cr>

" Set Plugin defaults
"if !exists('s:envelope_open')
  "let s:envelope_open = 1 
"endif

"function! EnvelopeToggleFn()
  "if expand("%:t") =~  ".env"
    "if s:envelope_open
      "let s:envelope_open = 0
      "highlight String ctermfg=black  ctermbg=black
      "highlight shVar ctermfg=black  ctermbg=black
    "else
      "let s:envelope_open = 1
      "highlight String ctermfg=white  ctermbg=none
      "highlight shVar ctermfg=white  ctermbg=none
    "endif
"endif
"endfunction

"command -nargs=0 EnvelopeToggle call EnvelopeToggleFn()
"nnoremap <silent> <leader>e :EnvelopeToggle<CR>

"augroup Envelope
  "autocmd!
  "autocmd BufEnter,BufLeave * :EnvelopeToggle 
"augroup END:

""call `:exec SynGroup()` to show the highlight group under the cursor
"function! SynGroup()
  "let l:s = synID(line('.'), col('.'), 1)
  "echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
"endfun
