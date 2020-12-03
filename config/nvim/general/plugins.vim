" Auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Begin Plugins List
call plug#begin('~/.config/nvim/plugged/')
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
  Plug 'editorconfig/editorconfig-vim'
  "Plug 'alvan/vim-closetag'
  Plug 'scrooloose/nerdcommenter'
  Plug 'iamcco/markdown-preview.nvim'
  Plug 'chrisbra/Colorizer'
  Plug 'sheerun/vim-polyglot'
  Plug 'jxnblk/vim-mdx-js'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  Plug 'mattn/emmet-vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'vim-scripts/loremipsum'
  Plug 'junegunn/goyo.vim'
  Plug 'liuchengxu/vim-which-key'
  "Plug 'vim-pandoc/vim-pandoc'
  "Plug 'vim-pandoc/vim-pandoc-syntax'
  Plug 'ryanoasis/vim-devicons'
call plug#end()


" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
