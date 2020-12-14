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

" Open explorer on start up
augrou ProjectDrawer
  autocmd!
  autocmd VimEnter * :exec ":CocCommand explorer --no-focus"
  autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
augroup END


nmap <C-n> :CocCommand explorer --toggle<CR>
nmap <a-c-n> :CocCommand explorer --toggle --preset floating<CR>

