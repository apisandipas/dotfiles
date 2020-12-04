if &background == 'dark'
    
  let s:shade0 = "#252c38"
  let s:shade1 = "#424853"
  let s:shade2 = "#60656e"
  let s:shade3 = "#7d8189"
  let s:shade4 = "#9a9da3"
  let s:shade5 = "#b7b9be"
  let s:shade6 = "#d5d6d9"
  let s:shade7 = "#f2f2f4"
  let s:accent0 = "#f05656"
  let s:accent1 = "#8e44ad"
  let s:accent2 = "#ecc46f"
  let s:accent3 = "#2cc46e"
  let s:accent4 = "#6f97ec"
  let s:accent5 = "#ff6e40"
  let s:accent6 = "#1565c0"
  let s:accent7 = "#71c6ff"
endif


let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:shade1, s:accent5 ], [ s:shade7, s:shade2 ] ]
let s:p.normal.right = [ [ s:shade1, s:shade4 ], [ s:shade5, s:shade2 ] ]
let s:p.inactive.right = [ [ s:shade1, s:shade3 ], [ s:shade3, s:shade1 ] ]
let s:p.inactive.left =  [ [ s:shade4, s:shade1 ], [ s:shade3, s:shade0 ] ]
let s:p.insert.left = [ [ s:shade1, s:accent3 ], [ s:shade7, s:shade2 ] ]
let s:p.replace.left = [ [ s:shade1, s:accent1 ], [ s:shade7, s:shade2 ] ]
let s:p.visual.left = [ [ s:shade1, s:accent6 ], [ s:shade7, s:shade2 ] ]
let s:p.normal.middle = [ [ s:shade5, s:shade1 ] ]
let s:p.inactive.middle = [ [ s:shade4, s:shade1 ] ]
let s:p.tabline.left = [ [ s:shade6, s:shade2 ] ]
let s:p.tabline.tabsel = [ [ s:shade6, s:shade0 ] ]
let s:p.tabline.middle = [ [ s:shade2, s:shade4 ] ]
let s:p.tabline.right = copy(s:p.normal.right)
let s:p.normal.error = [ [ s:accent0, s:shade0 ] ]
let s:p.normal.warning = [ [ s:accent2, s:shade1 ] ]

let g:lightline#colorscheme#pimento#palette = lightline#colorscheme#fill(s:p)

  
