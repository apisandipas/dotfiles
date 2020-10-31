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
  Plug 'apisandipas/pimento.vim', { 'branch': 'main' }
  Plug 'vimwiki/vimwiki'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-fugitive'
  Plug 'mhinz/vim-startify'
  Plug 'airblade/vim-rooter'
  Plug 'vim-airline/vim-airline'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'alvan/vim-closetag'
  Plug 'scrooloose/nerdcommenter'
  Plug 'chrisbra/Colorizer'
  Plug 'sheerun/vim-polyglot'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  Plug 'mattn/emmet-vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'vim-scripts/loremipsum'
  Plug 'junegunn/goyo.vim'
  Plug 'liuchengxu/vim-which-key'
  Plug 'vim-pandoc/vim-pandoc'
  Plug 'vim-pandoc/vim-pandoc-syntax'
  Plug 'ryanoasis/vim-devicons'
call plug#end()

""" ---------------------------------------------------------------- Appearance

colorscheme pimento         " Set colorscheme
syntax enable               " Enable syntax highlighting
filetype plugin indent on   " Enable filtype detection and indent plugin

set cursorline              " Highlight currentline
set autoread                " Autoreload this file in vim if it was changed out of vim
set splitright splitbelow   " open new split panes to right and below
set list                    " Display unprintable characters
set listchars=tab:•\ ,trail:•,extends:»,precedes:« " Show trailing whitespace chars
set fillchars+=vert:\       " remove buffer divider lines

" Tweak theme colors

"highlight Comment cterm=italic
"highlight htmlArg gui=italic cterm=italic
"highlight htmlArg cterm=italic
"highlight StatusLineNC ctermbg=NONE
"highlight clear VertSplit
"highlight ColorColumn ctermbg=7

" ---------------------------------------------------O------------- Basic Behavior

set number	 	      " show line numbers
set relativenumber	" show reltive line numbers
set wrap 		        " wrap lines
set encoding=utf-8  " set encoding to UTF-8
set mouse=a		      " enable mouse support
set wildmenu		    " visual autocomplete for commend menu
set lazyredraw		  " redraw screen only when we need to
set showmatch		    " highlight matching parens and brackets
set noswapfile		  " disable swap-fils
set noerrorbells	  " disable the goddamn bell
set visualbell		  " blink the curror instead of beeping
set hidden		      " allow buffers to be switched w/o saving first
set autochdir       " Set pwd to the current buffers directory
set noshowmode
set noruler
set laststatus=0
set showtabline=2

" Enable persistent undo so that undo history persists across vim sessions
set undofile
set undodir=~/.vim/.undodir
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

""" ---------------------------------------------------------------- Key Map UI
let g:which_key_map =  {}
let g:which_key_map.c = {
      \'name': '+comment',
      \' ':'toggle-comment',
      \'$':'comment-to-EOL'
      \}

let g:which_key_map.k = 'kill-buffer'
let g:which_key_map.w = 'save-buffer'
let g:which_key_map.sp = 'toggle-spellcheck'

let g:which_key_map.g = {
  \ 'name': '+git',
  \ 'a': 'git-add-all'
  \}

call which_key#register('\', 'g:which_key_map')
nnoremap <silent> <leader> :WhichKey '\'<CR>
vnoremap <silent> <leader> :WhichKeyVisual '\'<CR>

""" ---------------------------------------------------------------- Plugin Specific settings
let g:airline_theme='pimento'
let g:user_emmet_leader_key='<C-z>'
let g:vimwiki_list = [
  \ {'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'},
  \ {'path': '~/Notes/', 'syntax': 'markdown', 'ext': '.md'}]
let g:closetag_filenames = '*.html,*.js,*.jsx,*.ts,*.tsx,*.mdx'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:colorizer_auto_filetype='css,html,scss,javascript,typescript'
let g:startify_custom_header=[]
let g:airline#extensions#tabline#enabled = 1
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

" Map to Spellcheck
map <leader>sp :setlocal spell! spelllang=en_us<CR>

" Map F5 to list buffers. Just enter buffer # and hit enter
map <F5> :buffers<CR>:buffer<Space>

" Switch to Buffer to the Left
nmap <silent><S-left> :bp<CR>
vmap <silent><S-left> <Esc>:bp<CR>i
imap <silent><S-left> <Esc>:bp<CR>i

"Switch to Buffer to the Right
nmap <silent><S-right> :bn<CR>
vmap <silent><S-right> <Esc>:bn<CR>i
imap <silent><S-right> <Esc>:bn<CR>i

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

" leader k to 'kill' the buffer and explorer together
nnoremap <leader>k :bp<cr>:bd #<cr>

" Use Ctrl+C to copy to global clipboard
map <c-c> "+y<CR>

" Use Ctrk+A to Yank entire buffer
map <c-C> :% y+<CR>


" Autoformat on save
command! -nargs=0 Prettier :CocCommand prettier.formatFile
command! -nargs=0 ESLintFix :CocCommand eslint.executeAutofix
augroup FormatOnSave
  autocmd!
  autocmd BufWritePre *.ts,*.tsx,*.jsx,*.js,*.css,*.scss,*.less,*.graphql,*.md,*.mdx Prettier
  autocmd BufWritePre *.ts,*.tsx,*.jsx,*.js ESLintFix
augroup END

" Fuzzy Finder commands
nnoremap <Leader>ps :Rg<Space>
nnoremap <Leader>pf :Files<CR>
nnoremap <C-p> :GFiles<CR>

" Quick Save keybindings:
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

" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" Normal mode indent with only one keypress
nmap > >>
nmap < <<

" Move visual block
vnoremap K :m '<-3<CR>gv=gv
vnoremap J :m '>+0<CR>gv=gv

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

nmap <C-n> :CocCommand explorer --toggle<CR>
nmap <a-c-n> :CocCommand explorer --toggle --preset floating<CR>

""" ---------------------------------------------------------------- COC-specific config:

" COC Related keybindings

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <leader>rr <Plug>(coc-rename)
map <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>

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
  autocmd BufWritePost $DOTS_DIR/vimrc silent! source $MYVIMRC | redraw
augroup END


let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ ]

function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
  "Limelight
  " ...
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=5
  "Limelight!
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

finish


