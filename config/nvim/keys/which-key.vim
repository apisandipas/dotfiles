
let g:which_key_map = {}
"let g:which_key_map.c = {
   "\'name': '+comment',
   "\' ':'toggle-comment',
   "\'$':'comment-to-EOL'
"\}

"let g:which_key_map.k = 'kill-buffer'
"let g:which_key_map.w = 'save-buffer'
"let g:which_key_map.sp = 'toggle-spellcheck'

"let g:which_key_map.g = {
   "\ 'name': '+git',
   "\ 'a': 'git-add-all'
"\}

"call which_key#register('\', 'g:which_key_map')
nnoremap <silent> <leader> :WhichKey '\'<CR>
vnoremap <silent> <leader> :WhichKeyVisual '\'<CR>

