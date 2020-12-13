 "██████   █████                              ███                
"░░██████ ░░███                              ░░░                 
 "░███░███ ░███   ██████  ██████  █████ █████████ █████████████  
 "░███░░███░███  ███░░██████░░███░░███ ░░███░░███░░███░░███░░███ 
 "░███ ░░██████ ░███████░███ ░███ ░███  ░███ ░███ ░███ ░███ ░███ 
 "░███  ░░█████ ░███░░░ ░███ ░███ ░░███ ███  ░███ ░███ ░███ ░███ 
 "█████  ░░█████░░██████░░██████   ░░█████   ██████████░███ █████
"░░░░░    ░░░░░  ░░░░░░  ░░░░░░     ░░░░░   ░░░░░░░░░░ ░░░ ░░░░░ 

if !exists('g:vscode')
  source $HOME/.config/nvim/plug-config/polyglot.vim
endif
set ttyfast

source $HOME/.config/nvim/general/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/functions.vim
source $HOME/.config/nvim/keys/mappings.vim

" Plugins
source $HOME/.config/nvim/keys/which-key.vim


if exists('g:vscode')
  " VS Code extension
  source $HOME/.config/nvim/vscode/settings.vim
  "source $HOME/.config/nvim/plug-config/easymotion.vim
  "source $HOME/.config/nvim/plug-config/highlightyank.vim
else
""" ---------------------------------------------------------------- Plugin Specific settings
if &term =~ '256color'
  " disable Background Color Erase (BCE)
  set t_ut=
endif

let g:user_emmet_leader_key = '<C-z>'

let g:vimwiki_list = [
  \ {'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'},
  \ {'path': '~/Notes/', 'syntax': 'markdown', 'ext': '.md'}
\]
let g:vimwiki_global_ext = 0

let g:closetag_filenames = '*.html,*.js,*.jsx,*.ts,*.tsx,*.mdx'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:colorizer_auto_filetype = 'css,html,scss,javascript,typescript,yaml,markdown,vimwiki'

let g:startify_custom_header = []
let g:startify_lists = [
   \ { 'type': 'files', 'header': ['   MRU']            },
   \ { 'type': 'dir',   'header': ['   MRU '. getcwd()] },
\ ]

let g:line_theme = 'base16_google_dark'
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
  \ 'coc-prettier',
  \ 'coc-vimlsp',
  \ 'coc-svg',
  \ 'coc-sh',
  \ 'coc-json',
  \ 'coc-html',
  \ 'coc-highlight',
  \ 'coc-fzf-preview',
  \ 'coc-floaterm',
  \ 'coc-css',
  \ 'coc-emoji'
\ ]

let g:coc_explorer_global_presets = {
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow'
\   }
\ }

" Fuzzy Finder settings
let g:fzf_layout = { 
\ 'window': { 'width': 0.9, 'height': 0.9 }
\ }

let $FZF_DEFAULT_COMMAND = 'rg --files --ignore-case --hidden -g "!{.git,node_modules,vendor}/*"'
let $FZF_DEFAULT_OPTS = "--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --theme=Nord --color=always --style=header,grid --line-range :300 {}'"
command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

""" ---------------------------------------------------------------- Keybindings
set termguicolors
lua require'colorizer'.setup()

"Turin off search highlighting with <CR>
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

" Use Ctrk+A to Yank entire buffer
map <c-C> :%y+<CR>

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
augrou ProjectDrawer
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
"augroup ReloadVIMRC
  "autocmd!
  "autocmd BufWritePost $MYVIMRC silent! source $MYVIMRC | redraw
"augroup END

" Autoformat on save
command! -nargs=0 Prettier :CocCommand prettier.formatFile
command! -nargs=0 ESLintFix :CocCommand eslint.executeAutofix
augroup FormatOnSave
  autocmd!
  autocmd BufWritePre *.ts,*.tsx,*.jsx,*.js,*.mjs,*.css,*.scss,*.less,*.md,*.mdx,*.html Prettier
  autocmd BufWritePre *.ts,*.tsx,*.jsx,*.js ESLintFix
augroup END

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


" Theme tweaks 
hi Normal guibg=NONE ctermbg=NONE

finish


