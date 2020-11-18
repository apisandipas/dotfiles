" pimento.vim
" Copyright: 2020 by Bryan Paronto <bryan.paronto@pm.me>

highlight clear
if exists("syntax_on")
  syntax reset
endif

set background=dark
let g:colors_name="pimento"

let s:underline = "underline,"
let s:italic = "italic,"
let s:bold = "bold,"

function! s:hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
  if a:guifg != ""
    exec "hi " . a:group . " guifg=" . a:guifg
  endif
  if a:guibg != ""
    exec "hi " . a:group . " guibg=" . a:guibg
  endif
  if a:ctermfg != ""
    exec "hi " . a:group . " ctermfg=" . a:ctermfg
  endif
  if a:ctermbg != ""
    exec "hi " . a:group . " ctermbg=" . a:ctermbg
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . substitute(a:attr, "undercurl", s:underline, "")
  endif
  if a:guisp != ""
    exec "hi " . a:group . " guisp=" . a:guisp
  endif
endfunction

let s:pimento0_gui = "#333b47"
let s:pimento1_gui = "#f05656"
let s:pimento2_gui = "#2cc46e"
let s:pimento3_gui = "#ecc46f"
let s:pimento4_gui = "#6088dd"
let s:pimento5_gui = "#fa5477"
let s:pimento6_gui = "#64b9f2"
let s:pimento7_gui = "#d2d2d4"
let s:pimento8_gui = "#bFF656"
let s:pimento9_gui = "#ff6565"
let s:pimento10_gui = "#3bd37d"
let s:pimento11_gui = "#fbd37e"
let s:pimento12_gui = "#6f97ec"
let s:pimento13_gui = "#ff6386"
let s:pimento14_gui = "#71c6ff"
let s:pimento15_gui = "#f1f1f3"

let s:pimento0_term = "0"
let s:pimento1_term = "1"
let s:pimento2_term = "2"
let s:pimento3_term = "3"
let s:pimento4_term = "4"
let s:pimento5_term = "5"
let s:pimento6_term = "6"
let s:pimento7_term = "7"
let s:pimento8_term = "8"
let s:pimento9_term = "9"
let s:pimento10_term = "10"
let s:pimento11_term = "11"
let s:pimento12_term = "12"
let s:pimento13_term = "13"
let s:pimento14_term = "14"
let s:pimento15_term = "15"

if has('terminal')
  let g:terminal_ansi_colors = [s:pimento1_gui, s:pimento11_gui, s:pimento14_gui, s:pimento13_gui, s:pimento9_gui, s:pimento15_gui, s:pimento8_gui, s:pimento5_gui, s:pimento3_gui, s:pimento11_gui, s:pimento14_gui, s:pimento13_gui, s:pimento9_gui, s:pimento15_gui, s:pimento7_gui, s:pimento6_gui]
endif

" Neovim Terminal Colors 
if has('nvim')
  let g:terminal_color_0 = s:pimento0_gui
  let g:terminal_color_1 = s:pimento1_gui
  let g:terminal_color_2 = s:pimento2_gui
  let g:terminal_color_3 = s:pimento3_gui
  let g:terminal_color_4 = s:pimento4_gui
  let g:terminal_color_5 = s:pimento5_gui
  let g:terminal_color_6 = s:pimento6_gui
  let g:terminal_color_7 = s:pimento7_gui
  let g:terminal_color_8 = s:pimento8_gui
  let g:terminal_color_9 = s:pimento9_gui
  let g:terminal_color_10 = s:pimento10_gui
  let g:terminal_color_11 = s:pimento11_gui
  let g:terminal_color_12 = s:pimento12_gui
  let g:terminal_color_13 = s:pimento13_gui
  let g:terminal_color_14 = s:pimento14_gui
  let g:terminal_color_15 = s:pimento15_gui
endif

" TODO: add GUI values to colorscheme

syntax enable

" line numbers
highlight CursorLine ctermbg=8

"+--- Gutter ---+
call s:hi("LineNr", s:pimento6_gui, "",  s:pimento6_term, "", "", "")
call s:hi("CursorColumn", "", s:pimento1_gui, "NONE", s:pimento1_term, "", "")
call s:hi("CursorLine", "", "",  "", s:pimento8_term, "NONE", "")
call s:hi("CursorLineNr", s:pimento8_gui, s:pimento1_gui, s:pimento8_term, s:pimento2_term, s:italic, "")
call s:hi("Folded", s:pimento3_gui, s:pimento1_gui, s:pimento3_term, s:pimento1_term, s:bold, "")
call s:hi("FoldColumn", s:pimento3_gui, s:pimento0_gui, s:pimento3_term, "NONE", "", "")
call s:hi("SignColumn", s:pimento1_gui, "NONE", s:pimento1_term, "NONE", "", "")

"+--- Navigation ---+
call s:hi("Directory", s:pimento6_gui, "", s:pimento6_term, "NONE", "", "")

"+--- Prompt/Status ---+
call s:hi("EndOfBuffer", s:pimento0_gui, "", s:pimento0_term, "NONE", "", "")
call s:hi("ErrorMsg", s:pimento4_gui, s:pimento11_gui, "NONE", s:pimento11_term, "", "")
call s:hi("ModeMsg", s:pimento4_gui, "", "", "", "", "")
call s:hi("MoreMsg", s:pimento8_gui, "", s:pimento8_term, "", "", "")
call s:hi("Question", s:pimento4_gui, "", "NONE", "", "", "")
call s:hi("StatusLine", s:pimento8_gui, s:pimento3_gui, s:pimento8_term, s:pimento3_term, "NONE", "")
call s:hi("StatusLineNC", s:pimento4_gui, s:pimento1_gui, "NONE", s:pimento1_term, "NONE", "")
call s:hi("StatusLineTerm", s:pimento8_gui, s:pimento3_gui, s:pimento8_term, s:pimento3_term, "NONE", "")
call s:hi("StatusLineTermNC", s:pimento4_gui, s:pimento1_gui, "NONE", s:pimento1_term, "NONE", "")
call s:hi("WarningMsg", s:pimento0_gui, s:pimento13_gui, s:pimento1_term, s:pimento13_term, "", "")
call s:hi("WildMenu", s:pimento8_gui, s:pimento1_gui, s:pimento8_term, s:pimento1_term, "", "")

"+--- Search ---+
call s:hi("IncSearch", s:pimento2_gui, s:pimento0_gui, s:pimento2_term, s:pimento0_term, s:underline, "")
call s:hi("Search", s:pimento2_gui, s:pimento0_gui, s:pimento2_term, s:pimento0_term, "NONE", "")

"+--- Tabs ---+
call s:hi("TabLine", s:pimento4_gui, s:pimento1_gui, "NONE", s:pimento1_term, "NONE", "")
call s:hi("TabLineFill", s:pimento4_gui, s:pimento1_gui, "NONE", s:pimento1_term, "NONE", "")
call s:hi("TabLineSel", s:pimento8_gui, s:pimento3_gui, s:pimento8_term, s:pimento3_term, "NONE", "")

"+--- Window ---+
call s:hi("Title", s:pimento4_gui, "", "NONE", "", "NONE", "")
call s:hi("VertSplit", s:pimento3_gui, s:pimento0_gui, s:pimento3_term, s:pimento0_term, "NONE", "")


"+----------------------+
"+ Language Base Groups +
"+----------------------+
call s:hi("Boolean", s:pimento2_gui, "", s:pimento2_term, "", "", "")
call s:hi("Character", s:pimento14_gui, "", s:pimento14_term, "", "", "")
call s:hi("Comment", s:pimento2_gui, "", s:pimento2_term, "", s:italic, "")
call s:hi("Conditional", s:pimento9_gui, "", s:pimento9_term, "", "", "")
call s:hi("Constant", s:pimento4_gui, "", "NONE", "", "", "")
call s:hi("Define", s:pimento9_gui, "", s:pimento9_term, "", "", "")
call s:hi("Delimiter", s:pimento6_gui, "", s:pimento6_term, "", "", "")
call s:hi("Exception", s:pimento9_gui, "", s:pimento9_term, "", "", "")
call s:hi("Float", s:pimento15_gui, "", s:pimento15_term, "", "", "")
call s:hi("Function", s:pimento4_gui, "", s:pimento4_term, "", "", "")
call s:hi("Identifier", s:pimento4_gui, "", "NONE", "", "NONE", "")
call s:hi("Include", s:pimento9_gui, "", s:pimento9_term, "", "", "")
call s:hi("Keyword", s:pimento9_gui, "", s:pimento9_term, "", "", "")
call s:hi("Label", s:pimento9_gui, "", s:pimento9_term, "", "", "")
call s:hi("Number", s:pimento15_gui, "", s:pimento15_term, "", "", "")
call s:hi("Operator", s:pimento9_gui, "", s:pimento9_term, "", "NONE", "")
call s:hi("PreProc", s:pimento4_gui, "", s:pimento4_term, "", "NONE", "")
call s:hi("Repeat", s:pimento9_gui, "", s:pimento9_term, "", "", "")
call s:hi("Special", s:pimento5_gui, "", "NONE", "", "", "")
call s:hi("SpecialChar", s:pimento13_gui, "", s:pimento13_term, "", "", "")
call s:hi("SpecialComment", s:pimento8_gui, "", s:pimento8_term, "", s:italic, "")
call s:hi("Statement", s:pimento3_gui, "", s:pimento3_term, "", "", "")
call s:hi("StorageClass", s:pimento9_gui, "", s:pimento9_term, "", "", "")
call s:hi("String", s:pimento14_gui, "", s:pimento14_term, "", "", "")
call s:hi("Structure", s:pimento9_gui, "", s:pimento9_term, "", "", "")
call s:hi("Tag", s:pimento4_gui, "", "", "", "", "")
call s:hi("Todo", s:pimento13_gui, "NONE", s:pimento13_term, "NONE", "", "")
call s:hi("Type", s:pimento6_gui, "", s:pimento6_term, "", "NONE", "")
call s:hi("Typedef", s:pimento9_gui, "", s:pimento9_term, "", "", "")
hi! link Macro Define
hi! link PreCondit PreProc

"+-----------+
"+ Languages +
"+-----------+
call s:hi("asciidocAttributeEntry", s:pimento10_gui, "", s:pimento10_term, "", "", "")
call s:hi("asciidocAttributeList", s:pimento10_gui, "", s:pimento10_term, "", "", "")
call s:hi("asciidocAttributeRef", s:pimento10_gui, "", s:pimento10_term, "", "", "")
call s:hi("asciidocHLabel", s:pimento9_gui, "", s:pimento9_term, "", "", "")
call s:hi("asciidocListingBlock", s:pimento7_gui, "", s:pimento7_term, "", "", "")
call s:hi("asciidocMacroAttributes", s:pimento8_gui, "", s:pimento8_term, "", "", "")
call s:hi("asciidocOneLineTitle", s:pimento8_gui, "", s:pimento8_term, "", "", "")
call s:hi("asciidocPassthroughBlock", s:pimento9_gui, "", s:pimento9_term, "", "", "")
call s:hi("asciidocQuotedMonospaced", s:pimento7_gui, "", s:pimento7_term, "", "", "")
call s:hi("asciidocTriplePlusPassthrough", s:pimento7_gui, "", s:pimento7_term, "", "", "")
hi! link asciidocAdmonition Keyword
hi! link asciidocAttributeRef markdownH1
hi! link asciidocBackslash Keyword
hi! link asciidocMacro Keyword
hi! link asciidocQuotedBold Bold
hi! link asciidocQuotedEmphasized Italic
hi! link asciidocQuotedMonospaced2 asciidocQuotedMonospaced
hi! link asciidocQuotedUnconstrainedBold asciidocQuotedBold
hi! link asciidocQuotedUnconstrainedEmphasized asciidocQuotedEmphasized
hi! link asciidocURL markdownLinkText

call s:hi("cssAttributeSelector", s:pimento7_gui, "", s:pimento7_term, "", "", "")
call s:hi("cssDefinition", s:pimento7_gui, "", s:pimento7_term, "", "NONE", "")
call s:hi("cssIdentifier", s:pimento7_gui, "", s:pimento7_term, "", s:underline, "")
call s:hi("cssStringQ", s:pimento7_gui, "", s:pimento7_term, "", "", "")
hi! link cssAttr Keyword
hi! link cssBraces Delimiter
hi! link cssClassName cssDefinition
hi! link cssColor Number
hi! link cssProp cssDefinition
hi! link cssPseudoClass cssDefinition
hi! link cssPseudoClassId cssPseudoClass
hi! link cssVendor Keyword
hi! link cssSelectorOp Keyword

call s:hi("DiffAdd", s:pimento14_gui, s:pimento1_gui, s:pimento14_term, s:pimento1_term, "", "")
call s:hi("DiffChange", s:pimento13_gui, s:pimento1_gui, s:pimento13_term, s:pimento1_term, "", "")
call s:hi("DiffDelete", s:pimento11_gui, s:pimento1_gui, s:pimento11_term, s:pimento1_term, "", "")
call s:hi("DiffText", s:pimento9_gui, s:pimento1_gui, s:pimento9_term, s:pimento1_term, "", "")
" Legacy groups for official git.vim and diff.vim syntax
hi! link diffAdded DiffAdd
hi! link diffChanged DiffChange
hi! link diffRemoved DiffDelete

call s:hi("gitconfigVariable", s:pimento7_gui, "", s:pimento7_term, "", "", "")

call s:hi("helpBar", s:pimento3_gui, "", s:pimento3_term, "", "", "")
call s:hi("helpHyperTextJump", s:pimento8_gui, "", s:pimento8_term, "", s:underline, "")

call s:hi("htmlArg", s:pimento7_gui, "", s:pimento7_term, "", "", "")
call s:hi("htmlLink", s:pimento4_gui, "", "", "", "NONE", "NONE")
call s:hi("htmlH1", s:pimento4_gui, "", "", "", "NONE", "NONE")
hi! link htmlBold Bold
hi! link htmlEndTag htmlTag
hi! link htmlItalic Italic
hi! link htmlH1 markdownH1
hi! link htmlH2 markdownH1
hi! link htmlH3 markdownH1
hi! link htmlH4 markdownH1
hi! link htmlH5 markdownH1
hi! link htmlH6 markdownH1
hi! link htmlSpecialChar SpecialChar
hi! link htmlTag Keyword
hi! link htmlTagN htmlTag

call s:hi("jsonKeyword", s:pimento7_gui, "", s:pimento7_term, "", "", "")

hi! link luaFunc Function

call s:hi("markdownBlockquote", s:pimento7_gui, "", s:pimento7_term, "", "", "")
call s:hi("markdownCode", s:pimento7_gui, "", s:pimento7_term, "", "", "")
call s:hi("markdownCodeDelimiter", s:pimento7_gui, "", s:pimento7_term, "", "", "")
call s:hi("markdownFootnote", s:pimento7_gui, "", s:pimento7_term, "", "", "")
call s:hi("markdownId", s:pimento7_gui, "", s:pimento7_term, "", "", "")
call s:hi("markdownIdDeclaration", s:pimento7_gui, "", s:pimento7_term, "", "", "")
call s:hi("markdownH1", s:pimento8_gui, "", s:pimento8_term, "", "", "")
call s:hi("markdownLinkText", s:pimento8_gui, "", s:pimento8_term, "", "", "")
call s:hi("markdownUrl", s:pimento4_gui, "", "NONE", "", "NONE", "")
hi! link markdownBold Bold
hi! link markdownBoldDelimiter Keyword
hi! link markdownFootnoteDefinition markdownFootnote
hi! link markdownH2 markdownH1
hi! link markdownH3 markdownH1
hi! link markdownH4 markdownH1
hi! link markdownH5 markdownH1
hi! link markdownH6 markdownH1
hi! link markdownIdDelimiter Keyword
hi! link markdownItalic Italic
hi! link markdownItalicDelimiter Keyword
hi! link markdownLinkDelimiter Keyword
hi! link markdownLinkTextDelimiter Keyword
hi! link markdownListMarker Keyword
hi! link markdownRule Keyword
hi! link markdownHeadingDelimiter Keyword

call s:hi("phpClasses", s:pimento7_gui, "", s:pimento7_term, "", "", "")
call s:hi("phpClass", s:pimento7_gui, "", s:pimento7_term, "", "", "")
call s:hi("phpDocTags", s:pimento7_gui, "", s:pimento7_term, "", "", "")
hi! link phpDocCustomTags phpDocTags
hi! link phpMemberSelector Keyword
hi! link phpMethod Function
hi! link phpFunction Function

call s:hi("sassClass", s:pimento7_gui, "", s:pimento7_term, "", "", "")
call s:hi("sassId", s:pimento7_gui, "", s:pimento7_term, "", s:underline, "")
hi! link sassAmpersand Keyword
hi! link sassClassChar Delimiter
hi! link sassControl Keyword
hi! link sassControlLine Keyword
hi! link sassExtend Keyword
hi! link sassFor Keyword
hi! link sassFunctionDecl Keyword
hi! link sassFunctionName Function
hi! link sassidChar sassId
hi! link sassInclude SpecialChar
hi! link sassMixinName Function
hi! link sassMixing SpecialChar
hi! link sassReturn Keyword

hi! link shCmdParenRegion Delimiter
hi! link shCmdSubRegion Delimiter
hi! link shDerefSimple Identifier
hi! link shDerefVar Identifier

hi! link sqlKeyword Keyword
hi! link sqlSpecial Keyword

call s:hi("vimAugroup", s:pimento7_gui, "", s:pimento7_term, "", "", "")
call s:hi("vimMapRhs", s:pimento7_gui, "", s:pimento7_term, "", "", "")
call s:hi("vimNotation", s:pimento7_gui, "", s:pimento7_term, "", "", "")
hi! link vimFunc Function
hi! link vimFunction Function
hi! link vimUserFunc Function

call s:hi("xmlAttrib", s:pimento7_gui, "", s:pimento7_term, "", "", "")
call s:hi("xmlCdataStart", s:pimento3_gui, "", s:pimento3_term, "", s:bold, "")
call s:hi("xmlNamespace", s:pimento7_gui, "", s:pimento7_term, "", "", "")
hi! link xmlAttribPunct Delimiter
hi! link xmlCdata Comment
hi! link xmlCdataCdata xmlCdataStart
hi! link xmlCdataEnd xmlCdataStart
hi! link xmlEndTag xmlTagName
hi! link xmlProcessingDelim Keyword
hi! link xmlTagName Keyword

call s:hi("yamlBlockMappingKey", s:pimento7_gui, "", s:pimento7_term, "", "", "")
hi! link yamlBool Keyword
hi! link yamlDocumentStart Keyword

"+----------------+
"+ Plugin Support +
"+----------------+
"+--- UI ---+
" Coc
" > neoclide/coc
call s:hi("CocWarningHighlight" , s:pimento13_gui, "", s:pimento13_term, "", "undercurl", "")
call s:hi("CocErrorHighlight" , s:pimento11_gui, "", s:pimento11_term, "", "undercurl", "")
call s:hi("CocWarningSign", s:pimento13_gui, "", s:pimento13_term, "", "", "")
call s:hi("CocErrorSign" , s:pimento11_gui, "", s:pimento11_term, "", "", "")
call s:hi("CocInfoSign" , s:pimento8_gui, "", s:pimento8_term, "", "", "")
call s:hi("CocHintSign" , s:pimento10_gui, "", s:pimento10_term, "", "", "")

" Nvim LSP
" > neovim/nvim-lsp
call s:hi("LSPDiagnosticsWarning", s:pimento13_gui, "", s:pimento13_term, "", "", "")
call s:hi("LSPDiagnosticsError" , s:pimento11_gui, "", s:pimento11_term, "", "", "")
call s:hi("LSPDiagnosticsInformation" , s:pimento8_gui, "", s:pimento8_term, "", "", "")
call s:hi("LSPDiagnosticsHint" , s:pimento10_gui, "", s:pimento10_term, "", "", "")

" GitGutter
" > airblade/vim-gitgutter
call s:hi("GitGutterAdd", s:pimento14_gui, "", s:pimento14_term, "", "", "")
call s:hi("GitGutterChange", s:pimento13_gui, "", s:pimento13_term, "", "", "")
call s:hi("GitGutterChangeDelete", s:pimento11_gui, "", s:pimento11_term, "", "", "")
call s:hi("GitGutterDelete", s:pimento11_gui, "", s:pimento11_term, "", "", "")


" fugitive.vim
" > tpope/vim-fugitive
call s:hi("gitcommitDiscardedFile", s:pimento11_gui, "", s:pimento11_term, "", "", "")
call s:hi("gitcommitUntrackedFile", s:pimento11_gui, "", s:pimento11_term, "", "", "")
call s:hi("gitcommitSelectedFile", s:pimento14_gui, "", s:pimento14_term, "", "", "")

" CtrlP
" > ctrlpvim/ctrlp.vim
hi! link CtrlPMatch Keyword
hi! link CtrlPBufferHid Normal

" vim-plug
" > junegunn/vim-plug
call s:hi("plugDeleted", s:pimento11_gui, "", "", s:pimento11_term, "", "")

" vim-startify
" > mhinz/vim-startify
call s:hi("StartifyFile", s:pimento6_gui, "", s:pimento6_term, "", "", "")
call s:hi("StartifyFooter", s:pimento7_gui, "", s:pimento7_term, "", "", "")
call s:hi("StartifyHeader", s:pimento1_gui, "", s:pimento1_term, "", "", "")
call s:hi("StartifyNumber", s:pimento7_gui, "", s:pimento7_term, "", "", "")
call s:hi("StartifyPath", s:pimento2_gui, "", s:pimento2_term, "", "", "")
hi! link StartifyBracket Delimiter
hi! link StartifySlash Normal
hi! link StartifySpecial Comment

"+--- Languages ---+
" JavaScript
" > pangloss/vim-javascript
call s:hi("jsGlobalNodeObjects", s:pimento8_gui, "", s:pimento8_term, "", s:italic, "")
hi! link jsBrackets Delimiter
hi! link jsFuncCall Function
hi! link jsFuncParens Delimiter
hi! link jsThis Keyword
hi! link jsNoise Delimiter
hi! link jsPrototype Keyword
hi! link jsRegexpString SpecialChar

" TypeScript
" > HerringtonDarkholme/yats.vim
call s:hi("typescriptBOMWindowMethod", s:pimento8_gui, "", s:pimento8_term, "", s:italic, "")
call s:hi("typescriptClassName", s:pimento7_gui, "", s:pimento7_term, "", "", "")
call s:hi("typescriptDecorator", s:pimento12_gui, "", s:pimento12_term, "", "", "")
call s:hi("typescriptInterfaceName", s:pimento7_gui, "", s:pimento7_term, "", s:bold, "")
call s:hi("typescriptRegexpString", s:pimento13_gui, "", s:pimento13_term, "", "", "")
" TypeScript JSX
 call s:hi("tsxAttrib", s:pimento7_gui, "", s:pimento7_term, "", "", "")
hi! link typescriptOperator Operator
hi! link typescriptBinaryOp Operator
hi! link typescriptAssign Operator
hi! link typescriptMember Identifier
hi! link typescriptDOMStorageMethod Identifier
hi! link typescriptArrowFuncArg Identifier
hi! link typescriptGlobal typescriptClassName
hi! link typescriptBOMWindowProp Function
hi! link typescriptArrowFuncDef Function
hi! link typescriptAliasDeclaration Function
hi! link typescriptPredefinedType Type
hi! link typescriptTypeReference typescriptClassName
hi! link typescriptTypeAnnotation Structure
hi! link typescriptDocNamedParamType SpecialComment
hi! link typescriptDocNotation Keyword
hi! link typescriptDocTags Keyword
hi! link typescriptImport Keyword
hi! link typescriptExport Keyword
hi! link typescriptTry Keyword
hi! link typescriptVariable Keyword
hi! link typescriptBraces Normal
hi! link typescriptObjectLabel Normal
hi! link typescriptCall Normal
hi! link typescriptClassHeritage typescriptClassName
hi! link typescriptFuncTypeArrow Structure
hi! link typescriptMemberOptionality Structure
hi! link typescriptNodeGlobal typescriptGlobal
hi! link typescriptTypeBrackets Structure
hi! link tsxEqual Operator
hi! link tsxIntrinsicTagName htmlTag
hi! link tsxTagName tsxIntrinsicTagName

" Vimwiki
" > vimwiki/vimwiki
if !exists("g:vimwiki_hl_headers") || g:vimwiki_hl_headers == 0
  for s:i in range(1,6)
    call s:hi("VimwikiHeader".s:i, s:pimento8_gui, "", s:pimento8_term, "", s:bold, "")
  endfor
else
  let s:vimwiki_hcolor_guifg = [s:pimento7_gui, s:pimento8_gui, s:pimento9_gui, s:pimento10_gui, s:pimento14_gui, s:pimento15_gui]
  let s:vimwiki_hcolor_ctermfg = [s:pimento7_term, s:pimento8_term, s:pimento9_term, s:pimento10_term, s:pimento14_term, s:pimento15_term]
  for s:i in range(1,6)
    call s:hi("VimwikiHeader".s:i, s:vimwiki_hcolor_guifg[s:i-1] , "", s:vimwiki_hcolor_ctermfg[s:i-1], "", s:bold, "")
  endfor
endif

call s:hi("VimwikiLink", s:pimento8_gui, "", s:pimento8_term, "", s:underline, "")
hi! link VimwikiHeaderChar markdownHeadingDelimiter
hi! link VimwikiHR Keyword
hi! link VimwikiList markdownListMarker


