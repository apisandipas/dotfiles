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

" general config
source $HOME/.config/nvim/general/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/functions.vim

" keymappings
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/keys/which-key.vim

" plugin confs
source $HOME/.config/nvim/plug-config/airline.vim
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/emmet.vim
source $HOME/.config/nvim/plug-config/fzf.vim
source $HOME/.config/nvim/plug-config/startify.vim
source $HOME/.config/nvim/plug-config/vimwiki.vim
luafile $HOME/.config/nvim/lua/plug-colorizer.lua


""" ---------------------------------------------------------------- Plugin Specific settings

let g:closetag_filenames = '*.html,*.js,*.jsx,*.ts,*.tsx,*.mdx'
"let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
"let g:colorizer_auto_filetype = 'css,html,scss,javascript,typescript,yaml,markdown,vimwiki'

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
  Limelight
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()


" Theme tweaks 
"hi Normal guibg=NONE ctermbg=NONE

finish


