" Auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Begin Plugins List
call plug#begin('~/.config/nvim/plugged/')

  Plug 'tpope/vim-sensible'
  Plug 'vimwiki/vimwiki'
  Plug 'alvan/vim-closetag'
  Plug 'scrooloose/nerdcommenter'
  Plug 'mattn/emmet-vim'

  if exists('g:vscode')
    " Easy motion for VSCode
    " Plug 'asvetliakov/vim-easymotion'
    Plug 'ChristianChiarulli/vscode-easymotion'
    Plug 'machakann/vim-highlightedyank'
  else
  Plug 'norcalli/nvim-colorizer.lua'
  "Plug 'apisandipas/pimento.vim', { 'branch': 'main' }
  Plug 'easymotion/vim-easymotion'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'tpope/vim-fugitive'
  Plug 'mhinz/vim-startify'
  Plug 'airblade/vim-gitgutter'
  Plug 'voldikss/vim-floaterm'
  Plug 'airblade/vim-rooter'
  Plug 'vim-airline/vim-airline'
  "Plug 'vim-airline/vim-airline-themes'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release', 'do': ':UpdateRemotePlugins' }
  Plug 'editorconfig/editorconfig-vim'
  Plug 'iamcco/markdown-preview.nvim'
  Plug 'sheerun/vim-polyglot'
  Plug 'jxnblk/vim-mdx-js'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  Plug 'jiangmiao/auto-pairs'
  Plug 'vim-scripts/loremipsum'
  Plug 'junegunn/goyo.vim'
  Plug 'liuchengxu/vim-which-key'
  Plug 'vim-pandoc/vim-pandoc'
  Plug 'vim-pandoc/vim-pandoc-syntax'
  Plug 'ryanoasis/vim-devicons'
  Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

  endif
call plug#end()

" Automatically install missing plugins on startup

autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
