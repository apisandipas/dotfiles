" pimento.vim
" Copyright: 2020 by Bryan Paronto <bryan.paronto@pm.me>
" License: MIT
" Website: https://github.com/apisandipas/pimento.vim

highlight clear
if exists("syntax_on")
  syntax reset
endif

set background=dark
let g:colors_name = "pimento"
let g:pimento_italic_comments = 1

let s:underline = "underline,"

function! s:logWarning(msg)
  echohl WarningMsg
  echomsg 'pimento: warning: ' . a:msg
  echohl None
endfunction

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


if !exists("g:pimento_bold")
  let g:pimento_bold = 1
endif

let s:bold = "bold,"
if g:pimento_bold == 0
  let s:bold = ""
endif

if !exists("g:pimento_italic")
  if has("gui_running") || $TERM_ITALICS == "true"
    let g:pimento_italic = 1
  else
    let g:pimento_italic = 0
  endif
endif

let s:italic = "italic,"
if g:pimento_italic == 0
  let s:italic = ""
endif

let s:italicize_comments = ""
if exists("g:pimento_italic_comments")
  if g:pimento_italic_comments == 1
    let s:italicize_comments = s:italic
  endif
endif

let s:pimento0_gui = "#333b47"
let s:pimento1_gui = "#f05656"
let s:pimento2_gui = "#2cc46e"
let s:pimento3_gui = "#ecc46f"
let s:pimento4_gui = "#6088dd"
let s:pimento5_gui = "#fa5477"
let s:pimento6_gui = "#64b9f2"
let s:pimento7_gui = "#d2d2d4"
let s:pimento8_gui = "#bada55"
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
  let g:terminal_color_0 = s:pimento1_gui
  let g:terminal_color_1 = s:pimento11_gui
  let g:terminal_color_2 = s:pimento14_gui
  let g:terminal_color_3 = s:pimento13_gui
  let g:terminal_color_4 = s:pimento9_gui
  let g:terminal_color_5 = s:pimento15_gui
  let g:terminal_color_6 = s:pimento8_gui
  let g:terminal_color_7 = s:pimento5_gui
  let g:terminal_color_8 = s:pimento3_gui
  let g:terminal_color_9 = s:pimento11_gui
  let g:terminal_color_10 = s:pimento14_gui
  let g:terminal_color_11 = s:pimento13_gui
  let g:terminal_color_12 = s:pimento9_gui
  let g:terminal_color_13 = s:pimento15_gui
  let g:terminal_color_14 = s:pimento7_gui
  let g:terminal_color_15 = s:pimento6_gui
endif

syntax enable

"+--- Gutter ---+
call s:hi("CursorColumn", "", s:pimento1_gui, "NONE", s:pimento1_term, "", "")
call s:hi("CursorLineNr", s:pimento4_gui, s:pimento4_gui, "NONE", s:pimento4_term, "NONE", "")
call s:hi("Folded", s:pimento3_gui, s:pimento1_gui, s:pimento3_term, s:pimento1_term, s:bold, "")
call s:hi("FoldColumn", s:pimento3_gui, s:pimento0_gui, s:pimento3_term, "NONE", "", "")
call s:hi("SignColumn","NONE", s:pimento0_gui, "NONE", "NONE", "", "")

"+--- Navigation ---+
call s:hi("Directory", s:pimento8_gui, "", s:pimento3_term, "NONE", "", "")

"+--- Prompt/Status ---+
call s:hi("EndOfBuffer", s:pimento1_gui, "", s:pimento1_term, "NONE", "", "")
call s:hi("ErrorMsg", s:pimento4_gui, s:pimento11_gui, "NONE", s:pimento11_term, "", "")
call s:hi("ModeMsg", s:pimento4_gui, "", "", "", "", "")
call s:hi("MoreMsg", s:pimento7_gui, "", s:pimento7_term, "", "", "")
call s:hi("Question", s:pimento4_gui, "", "NONE", "", "", "")
call s:hi("StatusLine", s:pimento7_gui, s:pimento3_gui, s:pimento7_term, s:pimento3_term, "NONE", "")
call s:hi("StatusLineNC", s:pimento4_gui, s:pimento1_gui, "NONE", s:pimento1_term, "NONE", "")
call s:hi("StatusLineTerm", s:pimento7_gui, s:pimento3_gui, s:pimento6_term, s:pimento3_term, "NONE", "")
call s:hi("StatusLineTermNC", s:pimento4_gui, s:pimento1_gui, "NONE", s:pimento1_term, "NONE", "")
call s:hi("WarningMsg", s:pimento0_gui, s:pimento13_gui, s:pimento1_term, s:pimento13_term, "", "")
call s:hi("WildMenu", s:pimento8_gui, s:pimento1_gui, s:pimento8_term, s:pimento1_term, "", "")

"+--- Search ---+
call s:hi("IncSearch", s:pimento6_gui, s:pimento10_gui, s:pimento6_term, s:pimento10_term, s:underline, "")
call s:hi("Search", s:pimento1_gui, s:pimento8_gui, s:pimento1_term, s:pimento7_term, "NONE", "")

"+--- Tabs ---+
call s:hi("TabLine", s:pimento4_gui, s:pimento1_gui, "NONE", s:pimento1_term, "NONE", "")
call s:hi("TabLineFill", s:pimento4_gui, s:pimento1_gui, "NONE", s:pimento1_term, "NONE", "")
call s:hi("TabLineSel", s:pimento7_gui, s:pimento3_gui, s:pimento7_term, s:pimento3_term, "NONE", "")

"+--- Window ---+
call s:hi("Title", s:pimento4_gui, "", "NONE", "", "NONE", "")
call s:hi("VertSplit", s:pimento2_gui, s:pimento1_gui, s:pimento3_term, s:pimento1_term, "NONE", "")


"+----------------------+
"+ Language Base Groups +
"+----------------------+
call s:hi("Boolean", s:pimento9_gui, "", s:pimento9_term, "", "", "")
call s:hi("Character", s:pimento14_gui, "", s:pimento14_term, "", "", "")
call s:hi("Comment", s:pimento3_gui, "", s:pimento3_term, "", s:italicize_comments, "")
call s:hi("Conditional", s:pimento9_gui, "", s:pimento9_term, "", "", "")
call s:hi("Constant", s:pimento4_gui, "", "NONE", "", "", "")
call s:hi("Define", s:pimento9_gui, "", s:pimento9_term, "", "", "")
call s:hi("Delimiter", s:pimento6_gui, "", s:pimento6_term, "", "", "")
call s:hi("Exception", s:pimento9_gui, "", s:pimento9_term, "", "", "")
call s:hi("Float", s:pimento15_gui, "", s:pimento15_term, "", "", "")
call s:hi("Function", s:pimento3_gui, "", s:pimento2_term, "", "", "")
call s:hi("Identifier", s:pimento4_gui, "", "NONE", "", "NONE", "")
call s:hi("Include", s:pimento9_gui, "", s:pimento9_term, "", "", "")
call s:hi("Keyword", s:pimento9_gui, "", s:pimento9_term, "", "", "")
call s:hi("Label", s:pimento9_gui, "", s:pimento9_term, "", "", "")
call s:hi("Number", s:pimento15_gui, "", s:pimento15_term, "", "", "")
call s:hi("Operator", s:pimento9_gui, "", s:pimento9_term, "", "NONE", "")
call s:hi("PreProc", s:pimento9_gui, "", s:pimento9_term, "", "NONE", "")
call s:hi("Repeat", s:pimento9_gui, "", s:pimento9_term, "", "", "")
call s:hi("Special", s:pimento4_gui, "", "NONE", "", "", "")
call s:hi("SpecialChar", s:pimento13_gui, "", s:pimento13_term, "", "", "")
call s:hi("SpecialComment", s:pimento8_gui, "", s:pimento8_term, "", s:italicize_comments, "")
call s:hi("Statement", s:pimento9_gui, "", s:pimento9_term, "", "", "")
call s:hi("StorageClass", s:pimento9_gui, "", s:pimento9_term, "", "", "")
call s:hi("String", s:pimento14_gui, "", s:pimento14_term, "", "", "")
call s:hi("Structure", s:pimento9_gui, "", s:pimento9_term, "", "", "")
call s:hi("Tag", s:pimento4_gui, "", "", "", "", "")
call s:hi("Todo", s:pimento13_gui, "NONE", s:pimento13_term, "NONE", "", "")
call s:hi("Type", s:pimento9_gui, "", s:pimento9_term, "", "NONE", "")
call s:hi("Typedef", s:pimento9_gui, "", s:pimento9_term, "", "", "")
highlight! link Macro Define
highlight! link PreCondit PreProc

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
highlight! link asciidocAdmonition Keyword
highlight! link asciidocAttributeRef markdownH1
highlight! link asciidocBackslash Keyword
highlight! link asciidocMacro Keyword
highlight! link asciidocQuotedBold Bold
highlight! link asciidocQuotedEmphasized Italic
highlight! link asciidocQuotedMonospaced2 asciidocQuotedMonospaced
highlight! link asciidocQuotedUnconstrainedBold asciidocQuotedBold
highlight! link asciidocQuotedUnconstrainedEmphasized asciidocQuotedEmphasized
highlight! link asciidocURL markdownLinkText

call s:hi("awkCharClass", s:pimento7_gui, "", s:pimento7_term, "", "", "")
call s:hi("awkPatterns", s:pimento9_gui, "", s:pimento9_term, "", s:bold, "")
highlight! link awkArrayElement Identifier
highlight! link awkBoolLogic Keyword
highlight! link awkBrktRegExp SpecialChar
highlight! link awkComma Delimiter
highlight! link awkExpression Keyword
highlight! link awkFieldVars Identifier
highlight! link awkLineSkip Keyword
highlight! link awkOperator Operator
highlight! link awkRegExp SpecialChar
highlight! link awkSearch Keyword
highlight! link awkSemicolon Delimiter
highlight! link awkSpecialCharacter SpecialChar
highlight! link awkSpecialPrintf SpecialChar
highlight! link awkVariables Identifier

call s:hi("cIncluded", s:pimento7_gui, "", s:pimento7_term, "", "", "")
highlight! link cOperator Operator
highlight! link cPreCondit PreCondit

call s:hi("cmakeGeneratorExpression", s:pimento10_gui, "", s:pimento10_term, "", "", "")

highlight! link csPreCondit PreCondit
highlight! link csType Type
highlight! link csXmlTag SpecialComment

call s:hi("cssAttributeSelector", s:pimento7_gui, "", s:pimento7_term, "", "", "")
call s:hi("cssDefinition", s:pimento7_gui, "", s:pimento7_term, "", "NONE", "")
call s:hi("cssIdentifier", s:pimento7_gui, "", s:pimento7_term, "", s:underline, "")
call s:hi("cssStringQ", s:pimento7_gui, "", s:pimento7_term, "", "", "")
highlight! link cssAttr Keyword
highlight! link cssBraces Delimiter
highlight! link cssClassName cssDefinition
highlight! link cssColor Number
highlight! link cssProp cssDefinition
highlight! link cssPseudoClass cssDefinition
highlight! link cssPseudoClassId cssPseudoClass
highlight! link cssVendor Keyword

call s:hi("dosiniHeader", s:pimento8_gui, "", s:pimento8_term, "", "", "")
highlight! link dosiniLabel Type

call s:hi("dtBooleanKey", s:pimento7_gui, "", s:pimento7_term, "", "", "")
call s:hi("dtExecKey", s:pimento7_gui, "", s:pimento7_term, "", "", "")
call s:hi("dtLocaleKey", s:pimento7_gui, "", s:pimento7_term, "", "", "")
call s:hi("dtNumericKey", s:pimento7_gui, "", s:pimento7_term, "", "", "")
call s:hi("dtTypeKey", s:pimento7_gui, "", s:pimento7_term, "", "", "")
highlight! link dtDelim Delimiter
highlight! link dtLocaleValue Keyword
highlight! link dtTypeValue Keyword

call s:hi("DiffAdd", s:pimento14_gui, s:pimento1_gui, s:pimento14_term, s:pimento1_term, "", "")
call s:hi("DiffChange", s:pimento13_gui, s:pimento1_gui, s:pimento13_term, s:pimento1_term, "", "")
call s:hi("DiffDelete", s:pimento11_gui, s:pimento1_gui, s:pimento11_term, s:pimento1_term, "", "")
call s:hi("DiffText", s:pimento9_gui, s:pimento1_gui, s:pimento9_term, s:pimento1_term, "", "")
" Legacy groups for official git.vim and diff.vim syntax
highlight! link diffAdded DiffAdd
highlight! link diffChanged DiffChange
highlight! link diffRemoved DiffDelete

call s:hi("gitconfigVariable", s:pimento7_gui, "", s:pimento7_term, "", "", "")

call s:hi("goBuiltins", s:pimento7_gui, "", s:pimento7_term, "", "", "")
highlight! link goConstants Keyword

call s:hi("helpBar", s:pimento3_gui, "", s:pimento3_term, "", "", "")
call s:hi("helpHyperTextJump", s:pimento8_gui, "", s:pimento8_term, "", s:underline, "")

call s:hi("htmlArg", s:pimento7_gui, "", s:pimento7_term, "", "", "")
call s:hi("htmlLink", s:pimento4_gui, "", "", "", "NONE", "NONE")
highlight! link htmlBold Bold
highlight! link htmlEndTag htmlTag
highlight! link htmlItalic Italic
highlight! link htmlH1 markdownH1
highlight! link htmlH2 markdownH1
highlight! link htmlH3 markdownH1
highlight! link htmlH4 markdownH1
highlight! link htmlH5 markdownH1
highlight! link htmlH6 markdownH1
highlight! link htmlSpecialChar SpecialChar
highlight! link htmlTag Keyword
highlight! link htmlTagN htmlTag

call s:hi("javaDocTags", s:pimento7_gui, "", s:pimento7_term, "", "", "")
highlight! link javaCommentTitle Comment
highlight! link javaScriptBraces Delimiter
highlight! link javaScriptIdentifier Keyword
highlight! link javaScriptNumber Number

call s:hi("jsonKeyword", s:pimento7_gui, "", s:pimento7_term, "", "", "")

call s:hi("lessClass", s:pimento7_gui, "", s:pimento7_term, "", "", "")
highlight! link lessAmpersand Keyword
highlight! link lessCssAttribute Delimiter
highlight! link lessFunction Function
highlight! link cssSelectorOp Keyword

highlight! link lispAtomBarSymbol SpecialChar
highlight! link lispAtomList SpecialChar
highlight! link lispAtomMark Keyword
highlight! link lispBarSymbol SpecialChar
highlight! link lispFunc Function

highlight! link luaFunc Function

call s:hi("markdownBlockquote", s:pimento7_gui, "", s:pimento7_term, "", "", "")
call s:hi("markdownCode", s:pimento7_gui, "", s:pimento7_term, "", "", "")
call s:hi("markdownCodeDelimiter", s:pimento7_gui, "", s:pimento7_term, "", "", "")
call s:hi("markdownFootnote", s:pimento7_gui, "", s:pimento7_term, "", "", "")
call s:hi("markdownId", s:pimento7_gui, "", s:pimento7_term, "", "", "")
call s:hi("markdownIdDeclaration", s:pimento7_gui, "", s:pimento7_term, "", "", "")
call s:hi("markdownH1", s:pimento8_gui, "", s:pimento8_term, "", "", "")
call s:hi("markdownLinkText", s:pimento8_gui, "", s:pimento8_term, "", "", "")
call s:hi("markdownUrl", s:pimento4_gui, "", "NONE", "", "NONE", "")
highlight! link markdownBold Bold
highlight! link markdownBoldDelimiter Keyword
highlight! link markdownFootnoteDefinition markdownFootnote
highlight! link markdownH2 markdownH1
highlight! link markdownH3 markdownH1
highlight! link markdownH4 markdownH1
highlight! link markdownH5 markdownH1
highlight! link markdownH6 markdownH1
highlight! link markdownIdDelimiter Keyword
highlight! link markdownItalic Italic
highlight! link markdownItalicDelimiter Keyword
highlight! link markdownLinkDelimiter Keyword
highlight! link markdownLinkTextDelimiter Keyword
highlight! link markdownListMarker Keyword
highlight! link markdownRule Keyword
highlight! link markdownHeadingDelimiter Keyword

call s:hi("perlPackageDecl", s:pimento7_gui, "", s:pimento7_term, "", "", "")

call s:hi("phpClasses", s:pimento7_gui, "", s:pimento7_term, "", "", "")
call s:hi("phpClass", s:pimento7_gui, "", s:pimento7_term, "", "", "")
call s:hi("phpDocTags", s:pimento7_gui, "", s:pimento7_term, "", "", "")
highlight! link phpDocCustomTags phpDocTags
highlight! link phpMemberSelector Keyword
highlight! link phpMethod Function
highlight! link phpFunction Function

call s:hi("podCmdText", s:pimento7_gui, "", s:pimento7_term, "", "", "")
call s:hi("podVerbatimLine", s:pimento4_gui, "", "NONE", "", "", "")
highlight! link podFormat Keyword

highlight! link pythonBuiltin Type
highlight! link pythonEscape SpecialChar

call s:hi("rubyConstant", s:pimento7_gui, "", s:pimento7_term, "", "", "")
call s:hi("rubySymbol", s:pimento6_gui, "", s:pimento6_term, "", s:bold, "")
highlight! link rubyAttribute Identifier
highlight! link rubyBlockParameterList Operator
highlight! link rubyInterpolationDelimiter Keyword
highlight! link rubyKeywordAsMethod Function
highlight! link rubyLocalVariableOrMethod Function
highlight! link rubyPseudoVariable Keyword
highlight! link rubyRegexp SpecialChar

call s:hi("rustAttribute", s:pimento10_gui, "", s:pimento10_term, "", "", "")
call s:hi("rustEnum", s:pimento7_gui, "", s:pimento7_term, "", s:bold, "")
call s:hi("rustMacro", s:pimento8_gui, "", s:pimento8_term, "", s:bold, "")
call s:hi("rustModPath", s:pimento7_gui, "", s:pimento7_term, "", "", "")
call s:hi("rustPanic", s:pimento9_gui, "", s:pimento9_term, "", s:bold, "")
call s:hi("rustTrait", s:pimento7_gui, "", s:pimento7_term, "", s:italic, "")
highlight! link rustCommentLineDoc Comment
highlight! link rustDerive rustAttribute
highlight! link rustEnumVariant rustEnum
highlight! link rustEscape SpecialChar
highlight! link rustQuestionMark Keyword

call s:hi("sassClass", s:pimento7_gui, "", s:pimento7_term, "", "", "")
call s:hi("sassId", s:pimento7_gui, "", s:pimento7_term, "", s:underline, "")
highlight! link sassAmpersand Keyword
highlight! link sassClassChar Delimiter
highlight! link sassControl Keyword
highlight! link sassControlLine Keyword
highlight! link sassExtend Keyword
highlight! link sassFor Keyword
highlight! link sassFunctionDecl Keyword
highlight! link sassFunctionName Function
highlight! link sassidChar sassId
highlight! link sassInclude SpecialChar
highlight! link sassMixinName Function
highlight! link sassMixing SpecialChar
highlight! link sassReturn Keyword

highlight! link shCmdParenRegion Delimiter
highlight! link shCmdSubRegion Delimiter
highlight! link shDerefSimple Identifier
highlight! link shDerefVar Identifier

highlight! link sqlKeyword Keyword
highlight! link sqlSpecial Keyword

call s:hi("vimAugroup", s:pimento7_gui, "", s:pimento7_term, "", "", "")
call s:hi("vimMapRhs", s:pimento7_gui, "", s:pimento7_term, "", "", "")
call s:hi("vimNotation", s:pimento7_gui, "", s:pimento7_term, "", "", "")
highlight! link vimFunc Function
highlight! link vimFunction Function
highlight! link vimUserFunc Function

call s:hi("xmlAttrib", s:pimento7_gui, "", s:pimento7_term, "", "", "")
call s:hi("xmlCdataStart", s:pimento3_gui, "", s:pimento3_term, "", s:bold, "")
call s:hi("xmlNamespace", s:pimento7_gui, "", s:pimento7_term, "", "", "")
highlight! link xmlAttribPunct Delimiter
highlight! link xmlCdata Comment
highlight! link xmlCdataCdata xmlCdataStart
highlight! link xmlCdataEnd xmlCdataStart
highlight! link xmlEndTag xmlTagName
highlight! link xmlProcessingDelim Keyword
highlight! link xmlTagName Keyword

call s:hi("yamlBlockMappingKey", s:pimento7_gui, "", s:pimento7_term, "", "", "")
highlight! link yamlBool Keyword
highlight! link yamlDocumentStart Keyword

"+----------------+
"+ Plugin Support +
"+----------------+
"+--- UI ---+
" ALE
" > w0rp/ale
call s:hi("ALEWarningSign", s:pimento13_gui, "", s:pimento13_term, "", "", "")
call s:hi("ALEErrorSign" , s:pimento11_gui, "", s:pimento11_term, "", "", "")
call s:hi("ALEWarning" , s:pimento13_gui, "", s:pimento13_term, "", "undercurl", "")
call s:hi("ALEError" , s:pimento11_gui, "", s:pimento11_term, "", "undercurl", "")

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

" NERDTree
" > scrooloose/nerdtree
call s:hi("NERDTreeExecFile", s:pimento7_gui, "", s:pimento7_term, "", "", "")
highlight! link NERDTreeDirSlash Keyword
highlight! link NERDTreeHelp Comment

" CtrlP
" > ctrlpvim/ctrlp.vim
highlight! link CtrlPMatch Keyword
highlight! link CtrlPBufferHid Normal

" vim-plug
" > junegunn/vim-plug
call s:hi("plugDeleted", s:pimento11_gui, "", "", s:pimento11_term, "", "")


" vim-startify
" > mhinz/vim-startify
call s:hi("StartifyFile", s:pimento6_gui, "", s:pimento6_term, "", "", "")
call s:hi("StartifyFooter", s:pimento7_gui, "", s:pimento7_term, "", "", "")
call s:hi("StartifyHeader", s:pimento8_gui, "", s:pimento8_term, "", "", "")
call s:hi("StartifyNumber", s:pimento7_gui, "", s:pimento7_term, "", "", "")
call s:hi("StartifyPath", s:pimento8_gui, "", s:pimento8_term, "", "", "")
highlight! link StartifyBracket Delimiter
highlight! link StartifySlash Normal
highlight! link StartifySpecial Comment

"+--- Languages ---+
" Haskell
" > neovimhaskell/haskell-vim
call s:hi("haskellPreProc", s:pimento10_gui, "", s:pimento10_term, "", "", "")
call s:hi("haskellType", s:pimento7_gui, "", s:pimento7_term, "", "", "")
highlight! link haskellPragma haskellPreProc

" JavaScript
" > pangloss/vim-javascript
call s:hi("jsGlobalNodeObjects", s:pimento8_gui, "", s:pimento8_term, "", s:italic, "")
highlight! link jsBrackets Delimiter
highlight! link jsFuncCall Function
highlight! link jsFuncParens Delimiter
highlight! link jsThis Keyword
highlight! link jsNoise Delimiter
highlight! link jsPrototype Keyword
highlight! link jsRegexpString SpecialChar

" TypeScript
" > HerringtonDarkholme/yats.vim
call s:hi("typescriptBOMWindowMethod", s:pimento8_gui, "", s:pimento8_term, "", s:italic, "")
call s:hi("typescriptClassName", s:pimento7_gui, "", s:pimento7_term, "", "", "")
call s:hi("typescriptDecorator", s:pimento12_gui, "", s:pimento12_term, "", "", "")
call s:hi("typescriptInterfaceName", s:pimento7_gui, "", s:pimento7_term, "", s:bold, "")
call s:hi("typescriptRegexpString", s:pimento13_gui, "", s:pimento13_term, "", "", "")
" TypeScript JSX
 call s:hi("tsxAttrib", s:pimento7_gui, "", s:pimento7_term, "", "", "")
highlight! link typescriptOperator Operator
highlight! link typescriptBinaryOp Operator
highlight! link typescriptAssign Operator
highlight! link typescriptMember Identifier
highlight! link typescriptDOMStorageMethod Identifier
highlight! link typescriptArrowFuncArg Identifier
highlight! link typescriptGlobal typescriptClassName
highlight! link typescriptBOMWindowProp Function
highlight! link typescriptArrowFuncDef Function
highlight! link typescriptAliasDeclaration Function
highlight! link typescriptPredefinedType Type
highlight! link typescriptTypeReference typescriptClassName
highlight! link typescriptTypeAnnotation Structure
highlight! link typescriptDocNamedParamType SpecialComment
highlight! link typescriptDocNotation Keyword
highlight! link typescriptDocTags Keyword
highlight! link typescriptImport Keyword
highlight! link typescriptExport Keyword
highlight! link typescriptTry Keyword
highlight! link typescriptVariable Keyword
highlight! link typescriptBraces Normal
highlight! link typescriptObjectLabel Normal
highlight! link typescriptCall Normal
highlight! link typescriptClassHeritage typescriptClassName
highlight! link typescriptFuncTypeArrow Structure
highlight! link typescriptMemberOptionality Structure
highlight! link typescriptNodeGlobal typescriptGlobal
highlight! link typescriptTypeBrackets Structure
highlight! link tsxEqual Operator
highlight! link tsxIntrinsicTagName htmlTag
highlight! link tsxTagName tsxIntrinsicTagName

" Markdown
" > plasticboy/vim-markdown
call s:hi("mkdCode", s:pimento7_gui, "", s:pimento7_term, "", "", "")
call s:hi("mkdFootnote", s:pimento8_gui, "", s:pimento8_term, "", "", "")
call s:hi("mkdRule", s:pimento10_gui, "", s:pimento10_term, "", "", "")
call s:hi("mkdLineBreak", s:pimento9_gui, "", s:pimento9_term, "", "", "")
highlight! link mkdBold Bold
highlight! link mkdItalic Italic
highlight! link mkdString Keyword
highlight! link mkdCodeStart mkdCode
highlight! link mkdCodeEnd mkdCode
highlight! link mkdBlockquote Comment
highlight! link mkdListItem Keyword
highlight! link mkdListItemLine Normal
highlight! link mkdFootnotes mkdFootnote
highlight! link mkdLink markdownLinkText
highlight! link mkdURL markdownUrl
highlight! link mkdInlineURL mkdURL
highlight! link mkdID Identifier
highlight! link mkdLinkDef mkdLink
highlight! link mkdLinkDefTarget mkdURL
highlight! link mkdLinkTitle mkdInlineURL
highlight! link mkdDelimiter Keyword

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
highlight! link VimwikiHeaderChar markdownHeadingDelimiter
highlight! link VimwikiHR Keyword
highlight! link VimwikiList markdownListMarker

" YAML
" > stephpy/vim-yaml
call s:hi("yamlKey", s:pimento7_gui, "", s:pimento7_term, "", "", "")

