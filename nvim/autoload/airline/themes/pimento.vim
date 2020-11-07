"
" Theme: pimento.vim - a bold colorscheme
" Author: Bryan Paronto <bryan.paronto@pm.me>
" License: MIT
"

let g:airline#themes#pimento#palette = {}
let s:gui00 = '#333B47'
let s:gui01 = '#F05656'
let s:gui02 = '#2CC46E'
let s:gui03 = '#ECC46F'
let s:gui04 = '#6088DD'
let s:gui05 = '#FA5477'
let s:gui06 = '#64B9F2'
let s:gui07 = '#D2D2D4'
let s:gui08 = '#424A56'
let s:gui09 = '#FF6565'
let s:gui10 = '#3BD37D'
let s:gui11 = '#FBD37E'
let s:gui12 = '#6F97EC'
let s:gui13 = '#FF6386'
let s:gui14 = '#71C6FF'
let s:gui15 = '#F1F1F3'

let s:cterm00 = 0
let s:cterm01 = 1
let s:cterm02 = 2
let s:cterm03 = 3
let s:cterm04 = 4
let s:cterm05 = 5
let s:cterm06 = 6
let s:cterm07 = 7
let s:cterm08 = 8
let s:cterm09 = 9
let s:cterm10 = 10
let s:cterm11 = 11
let s:cterm12 = 12
let s:cterm13 = 13
let s:cterm14 = 14
let s:cterm15 = 15

let s:airline_a_normal = [ s:gui00 , s:gui02 , s:cterm00  , s:cterm02 ]
let s:airline_b_normal = [ s:gui09 , s:gui00 , s:cterm09  , s:cterm00 ]
let s:airline_c_normal = [ s:gui11 , s:gui00 , s:cterm11  , s:cterm00 ]
let g:airline#themes#pimento#palette.normal = airline#themes#generate_color_map(s:airline_a_normal, s:airline_b_normal, s:airline_c_normal)

let s:airline_a_insert = [ s:gui00, s:gui04, s:cterm00, s:cterm04 ]
let s:airline_b_insert = [ s:gui09, s:gui00, s:cterm09, s:cterm00 ]
let s:airline_c_insert = [ s:gui11, s:gui00, s:cterm11, s:cterm00 ]
let g:airline#themes#pimento#palette.insert = airline#themes#generate_color_map(s:airline_a_insert, s:airline_b_insert, s:airline_c_insert)

let s:airline_a_replace = [ s:gui09, s:gui00, s:cterm09, s:cterm00 ]
let s:airline_b_replace = [ s:gui09, s:gui00, s:cterm09, s:cterm00 ]
let s:airline_c_replace = [ s:gui11, s:gui00, s:cterm11, s:cterm00 ]
let g:airline#themes#pimento#palette.replace = airline#themes#generate_color_map(s:airline_a_replace, s:airline_b_replace, s:airline_c_replace)

let s:airline_a_visual  = [ s:gui05, s:gui05, s:cterm00, s:cterm05 ]
let s:airline_b_visual  = [ s:gui05, s:gui00, s:cterm05, s:cterm00 ]
let s:airline_c_visual  = [ s:gui11, s:gui00, s:cterm11, s:cterm00 ]
let g:airline#themes#pimento#palette.visual = airline#themes#generate_color_map(s:airline_a_visual, s:airline_b_visual, s:airline_c_visual)

let s:airline_a_inactive   = [ s:gui09, s:gui00, s:cterm00, s:cterm02 ]
let s:airline_b_inactive   = [ s:gui09, s:gui00, s:cterm09, s:cterm00 ]
let s:airline_c_inactive   = [ s:gui09, s:gui00, s:cterm09, s:cterm00 ]
let g:airline#themes#pimento#palette.inactive = airline#themes#generate_color_map(s:airline_a_inactive, s:airline_b_inactive, s:airline_c_inactive)

