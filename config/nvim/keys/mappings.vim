"Turin off search highlighting with <CR>
nnoremap <CR> :nohlsearch<CR><CR>

" Map to Spellcheck
"map <leader>sp :setlocal spell! spelllang=en_us<CR>

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
"nnoremap <leader>k :bp<cr>:bd #<cr>

" Use Ctrk+A to Yank entire buffer
map <c-C> :%y+<CR>

" Fuzzy Finder commands
"nnoremap <Leader>ps :Rg<Space>
"nnoremap <Leader>pf :Files<CR>
"nnoremap <C-p> :GFiles<CR>

" Quick Save keybindings:
map <Esc> :w<CR>
"map <leader>s :w<CR>

" Sweet Sweet GIT!
"nmap <leader>gj :diffget //3<CR>
"nmap <leader>gf :diffget //2<CR>
"nmap <leader>gs :G<CR>
"nmap <leader>ga :G add -A<CR>
"nmap <leader>gc :G commit<CR>
"nmap <leader>gp :G push<CR>
"nmap <leader>gy :!yolo<CR><CR>

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

" COC Related keybindings

" Use `[g` and `]g` to navigate diagnostics
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)
"nmap <leader>rr <Plug>(coc-rename)
"map <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>

" GoTo code navigation.
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gt<Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)

" Use <c-space> to trigger completion.
"inoremap <silent><expr> <c-space> coc#refresh()

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

