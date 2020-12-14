" Auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Begin Plugins List
call plug#begin('~/.config/nvim/plugged/')
<<<<<<< HEAD
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


=======

  " Common between `vim` and `code`
  Plug 'tpope/vim-sensible'
  Plug 'vimwiki/vimwiki'
  Plug 'alvan/vim-closetag'
  Plug 'scrooloose/nerdcommenter'
  Plug 'mattn/emmet-vim'
  Plug 'vim-scripts/loremipsum'

  if exists('g:vscode')
    " Easy motion for VSCode
    " Plug 'asvetliakov/vim-easymotion'
    Plug 'ChristianChiarulli/vscode-easymotion'
    Plug 'machakann/vim-highlightedyank'
  else

  " Themes
  Plug 'chriskempson/base16-vim'

  " Syntax Enhancements
  Plug 'sheerun/vim-polyglot'
  Plug 'suy/vim-context-commentstring'
  Plug 'jxnblk/vim-mdx-js'
  "Plug 'vim-pandoc/vim-pandoc-syntax'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

  " UI Enhancements
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'mhinz/vim-startify'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'airblade/vim-gitgutter'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'voldikss/vim-floaterm'
  Plug 'junegunn/goyo.vim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'liuchengxu/vim-which-key'
  " Plug 'wfxr/minimap.vim'

  " Functionality Enhancements
  Plug 'moll/vim-bbye'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-rooter'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release', 'do': ':UpdateRemotePlugins' }
  Plug 'jiangmiao/auto-pairs'
  "Plug 'easymotion/vim-easymotion'

  " Integrations, config, misc
  Plug 'editorconfig/editorconfig-vim'
  Plug 'vim-pandoc/vim-pandoc'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  }
  "Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

  endif
call plug#end()

>>>>>>> goog-dark
" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
