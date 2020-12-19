let s:wiki_common_syntax = 'markdown'
let s:wiki_common_ext = '.md'
let s:wiki_root_dir = '~/Dropbox/vimwiki/'

function DefineWiki(wiki_name) abort
  let s:wiki_name =  a:wiki_name
  let s:wiki_slug =  tolower(substitute(s:wiki_name, ' ', '-', 'g'))

  let s:wiki = {}
  let s:wiki.name = s:wiki_name
  let s:wiki.syntax = s:wiki_common_syntax
  let s:wiki.ext = s:wiki_common_ext
  let s:wiki.path = s:wiki_root_dir . s:wiki_slug . '/'
  let s:wiki.html_template = s:wiki_root_dir . 'assets/templates/' . s:wiki_slug . '-page.tpl'

  return s:wiki
endfunction


let g:vimwiki_list = [
  \ extend(DefineWiki("Wiki Home"), { 'path': s:wiki_root_dir, }),
  \ DefineWiki("Personal Wiki"),
  \ DefineWiki('Work Wiki'),
  \ DefineWiki('Knowledge Base'),
  \ DefineWiki('Honeypot'),
\]

let g:vimwiki_global_ext = 0

