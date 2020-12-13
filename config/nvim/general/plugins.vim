" Auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Begin Plugins List
call plug#begin('~/.config/nvim/plugged/')
  
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
  Plug 'jxnblk/vim-mdx-js'
  Plug 'vim-pandoc/vim-pandoc-syntax'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

  " UI Enhancements
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'mhinz/vim-startify'
  Plug 'easymotion/vim-easymotion'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'airblade/vim-gitgutter'
  Plug 'vim-airline/vim-airline'
  " TODO - do I *really* need this or can I configure the theme without?
  Plug 'vim-airline/vim-airline-themes'
  Plug 'voldikss/vim-floaterm'
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'liuchengxu/vim-which-key'

  " Functionality Enhancements
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-rooter'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release', 'do': ':UpdateRemotePlugins' }
  Plug 'jiangmiao/auto-pairs'
  
  " Integrations, config, misc
  Plug 'editorconfig/editorconfig-vim'
  Plug 'vim-pandoc/vim-pandoc'
  Plug 'iamcco/markdown-preview.nvim'
  "Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

  endif
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
