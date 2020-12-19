 "██████   █████                              ███
"░░██████ ░░███                              ░░░
 "░███░███ ░███   ██████  ██████  █████ █████████ █████████████
 "░███░░███░███  ███░░██████░░███░░███ ░░███░░███░░███░░███░░███
 "░███ ░░██████ ░███████░███ ░███ ░███  ░███ ░███ ░███ ░███ ░███
 "░███  ░░█████ ░███░░░ ░███ ░███ ░░███ ███  ░███ ░███ ░███ ░███
 "█████  ░░█████░░██████░░██████   ░░█████   ██████████░███ █████
"░░░░░    ░░░░░  ░░░░░░  ░░░░░░     ░░░░░   ░░░░░░░░░░ ░░░ ░░░░░


 "neo-vscodium configs
if !exists('g:vscode')
  source $HOME/.config/nvim/plug-config/polyglot.vim
endif

" general configs
source $HOME/.config/nvim/general/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/functions.vim

" keymappings
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/keys/which-key.vim

" plugin configs
source $HOME/.config/nvim/plug-config/airline.vim
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/emmet.vim
source $HOME/.config/nvim/plug-config/fzf.vim
source $HOME/.config/nvim/plug-config/startify.vim
source $HOME/.config/nvim/plug-config/vimwiki.vim
luafile $HOME/.config/nvim/lua/plug-colorizer.lua

if exists('g:vscode')
  " VS Code extension
  source $HOME/.config/nvim/vscode/settings.vim
  "source $HOME/.config/nvim/plug-config/easymotion.vim
  "source $HOME/.config/nvim/plug-config/highlightyank.vim
else

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
"command! -nargs=0 ESLintFix :CocCommand eslint.executeAutofix
augroup FormatOnSave
  autocmd!
  autocmd BufWritePre *.ts,*.tsx,*.jsx,*.js,*.mjs,*.css,*.scss,*.less,*.html Prettier
  "autocmd BufWritePre *.ts,*.tsx,*.jsx,*.js ESLintFix
augroup END

" Theme tweaks
hi Normal guibg=NONE ctermbg=NONE
hi Comment cterm=italic

finish


