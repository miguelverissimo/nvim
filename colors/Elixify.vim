" Vim color file
" Converted from Textmate theme Elixcify using Coloration v0.4.0 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "Elixify"

hi Cursor ctermfg=16 ctermbg=145 cterm=NONE guifg=#23202c guibg=#9ea7a6 gui=NONE
hi Visual ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#484a56 gui=NONE
hi CursorLine ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#383540 gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#383540 gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#383540 gui=NONE
hi LineNr ctermfg=245 ctermbg=59 cterm=NONE guifg=#8a888e guibg=#383540 gui=NONE
hi VertSplit ctermfg=59 ctermbg=59 cterm=NONE guifg=#5e5c65 guibg=#5e5c65 gui=NONE
hi MatchParen ctermfg=217 ctermbg=NONE cterm=underline guifg=#f1c1b9 guibg=NONE gui=underline
hi StatusLine ctermfg=231 ctermbg=59 cterm=bold guifg=#f0f0f0 guibg=#5e5c65 gui=bold
hi StatusLineNC ctermfg=231 ctermbg=59 cterm=NONE guifg=#f0f0f0 guibg=#5e5c65 gui=NONE
hi Pmenu ctermfg=153 ctermbg=NONE cterm=NONE guifg=#9fccff guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#484a56 gui=NONE
hi IncSearch ctermfg=16 ctermbg=151 cterm=NONE guifg=#23202c guibg=#b0cba6 gui=NONE
hi Search ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi Directory ctermfg=189 ctermbg=NONE cterm=NONE guifg=#e9cfec guibg=NONE gui=NONE
hi Folded ctermfg=96 ctermbg=16 cterm=NONE guifg=#7c717f guibg=#23202c gui=NONE

hi Normal ctermfg=231 ctermbg=16 cterm=NONE guifg=#f0f0f0 guibg=#23202c gui=NONE
hi Boolean ctermfg=189 ctermbg=NONE cterm=NONE guifg=#e9cfec guibg=NONE gui=NONE
hi Character ctermfg=189 ctermbg=NONE cterm=NONE guifg=#e9cfec guibg=NONE gui=NONE
hi Comment ctermfg=96 ctermbg=NONE cterm=NONE guifg=#7c717f guibg=NONE gui=italic
hi Conditional ctermfg=217 ctermbg=NONE cterm=NONE guifg=#f1c1b9 guibg=NONE gui=NONE
hi Constant ctermfg=189 ctermbg=NONE cterm=NONE guifg=#e9cfec guibg=NONE gui=NONE
hi Define ctermfg=217 ctermbg=NONE cterm=NONE guifg=#f1c1b9 guibg=NONE gui=NONE
hi DiffAdd ctermfg=231 ctermbg=64 cterm=bold guifg=#f0f0f0 guibg=#45820e gui=bold
hi DiffDelete ctermfg=88 ctermbg=NONE cterm=NONE guifg=#8a0609 guibg=NONE gui=NONE
hi DiffChange ctermfg=231 ctermbg=23 cterm=NONE guifg=#f0f0f0 guibg=#22355a gui=NONE
hi DiffText ctermfg=231 ctermbg=24 cterm=bold guifg=#f0f0f0 guibg=#204a87 gui=bold
hi ErrorMsg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi WarningMsg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Float ctermfg=189 ctermbg=NONE cterm=NONE guifg=#e9cfec guibg=NONE gui=NONE
hi Function ctermfg=153 ctermbg=NONE cterm=NONE guifg=#9fccff guibg=NONE gui=NONE
hi Identifier ctermfg=108 ctermbg=NONE cterm=NONE guifg=#93b687 guibg=NONE gui=NONE
hi Keyword ctermfg=217 ctermbg=NONE cterm=NONE guifg=#f1c1b9 guibg=NONE gui=NONE
hi Label ctermfg=151 ctermbg=NONE cterm=NONE guifg=#b0cba6 guibg=NONE gui=NONE
hi NonText ctermfg=59 ctermbg=17 cterm=NONE guifg=#494d5c guibg=#2d2a36 gui=NONE
hi Number ctermfg=189 ctermbg=NONE cterm=NONE guifg=#e9cfec guibg=NONE gui=NONE
hi Operator ctermfg=217 ctermbg=NONE cterm=NONE guifg=#f1c1b9 guibg=NONE gui=NONE
hi PreProc ctermfg=217 ctermbg=NONE cterm=NONE guifg=#f1c1b9 guibg=NONE gui=NONE
hi Special ctermfg=231 ctermbg=NONE cterm=NONE guifg=#f0f0f0 guibg=NONE gui=NONE
hi SpecialKey ctermfg=59 ctermbg=59 cterm=NONE guifg=#494d5c guibg=#383540 gui=NONE
hi Statement ctermfg=217 ctermbg=NONE cterm=NONE guifg=#f1c1b9 guibg=NONE gui=NONE
hi StorageClass ctermfg=108 ctermbg=NONE cterm=NONE guifg=#93b687 guibg=NONE gui=NONE
hi String ctermfg=151 ctermbg=NONE cterm=NONE guifg=#b0cba6 guibg=NONE gui=NONE
hi Tag ctermfg=153 ctermbg=NONE cterm=NONE guifg=#9fccff guibg=NONE gui=NONE
hi Title ctermfg=231 ctermbg=NONE cterm=bold guifg=#f0f0f0 guibg=NONE gui=bold
hi Todo ctermfg=96 ctermbg=NONE cterm=inverse,bold guifg=#7c717f guibg=NONE gui=inverse,bold,italic
hi Type ctermfg=153 ctermbg=NONE cterm=NONE guifg=#9fccff guibg=NONE gui=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi rubyClass ctermfg=217 ctermbg=NONE cterm=NONE guifg=#f1c1b9 guibg=NONE gui=NONE
hi rubyFunction ctermfg=153 ctermbg=NONE cterm=NONE guifg=#9fccff guibg=NONE gui=NONE
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubySymbol ctermfg=189 ctermbg=NONE cterm=NONE guifg=#e9cfec guibg=NONE gui=NONE
hi rubyConstant ctermfg=183 ctermbg=NONE cterm=NONE guifg=#dbb4ef guibg=NONE gui=NONE
hi rubyStringDelimiter ctermfg=151 ctermbg=NONE cterm=NONE guifg=#b0cba6 guibg=NONE gui=NONE
hi rubyBlockParameter ctermfg=183 ctermbg=NONE cterm=NONE guifg=#d0c0ed guibg=NONE gui=NONE
hi rubyInstanceVariable ctermfg=183 ctermbg=NONE cterm=NONE guifg=#d0c0ed guibg=NONE gui=NONE
hi rubyInclude ctermfg=217 ctermbg=NONE cterm=NONE guifg=#f1c1b9 guibg=NONE gui=NONE
hi rubyGlobalVariable ctermfg=183 ctermbg=NONE cterm=NONE guifg=#d0c0ed guibg=NONE gui=NONE
hi rubyRegexp ctermfg=179 ctermbg=NONE cterm=NONE guifg=#e9c062 guibg=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=179 ctermbg=NONE cterm=NONE guifg=#e9c062 guibg=NONE gui=NONE
hi rubyEscape ctermfg=189 ctermbg=NONE cterm=NONE guifg=#e9cfec guibg=NONE gui=NONE
hi rubyControl ctermfg=217 ctermbg=NONE cterm=NONE guifg=#f1c1b9 guibg=NONE gui=NONE
hi rubyClassVariable ctermfg=183 ctermbg=NONE cterm=NONE guifg=#d0c0ed guibg=NONE gui=NONE
hi rubyOperator ctermfg=217 ctermbg=NONE cterm=NONE guifg=#f1c1b9 guibg=NONE gui=NONE
hi rubyException ctermfg=217 ctermbg=NONE cterm=NONE guifg=#f1c1b9 guibg=NONE gui=NONE
hi rubyPseudoVariable ctermfg=183 ctermbg=NONE cterm=NONE guifg=#d0c0ed guibg=NONE gui=NONE
hi rubyRailsUserClass ctermfg=183 ctermbg=NONE cterm=NONE guifg=#dbb4ef guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod ctermfg=186 ctermbg=NONE cterm=NONE guifg=#e9db82 guibg=NONE gui=NONE
hi rubyRailsARMethod ctermfg=186 ctermbg=NONE cterm=NONE guifg=#e9db82 guibg=NONE gui=NONE
hi rubyRailsRenderMethod ctermfg=186 ctermbg=NONE cterm=NONE guifg=#e9db82 guibg=NONE gui=NONE
hi rubyRailsMethod ctermfg=186 ctermbg=NONE cterm=NONE guifg=#e9db82 guibg=NONE gui=NONE
hi erubyDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi erubyComment ctermfg=96 ctermbg=NONE cterm=NONE guifg=#7c717f guibg=NONE gui=italic
hi erubyRailsMethod ctermfg=186 ctermbg=NONE cterm=NONE guifg=#e9db82 guibg=NONE gui=NONE
hi htmlTag ctermfg=183 ctermbg=NONE cterm=NONE guifg=#d6b7ed guibg=NONE gui=NONE
hi htmlEndTag ctermfg=183 ctermbg=NONE cterm=NONE guifg=#d6b7ed guibg=NONE gui=NONE
hi htmlTagName ctermfg=183 ctermbg=NONE cterm=NONE guifg=#d6b7ed guibg=NONE gui=NONE
hi htmlArg ctermfg=183 ctermbg=NONE cterm=NONE guifg=#d6b7ed guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=189 ctermbg=NONE cterm=NONE guifg=#e9cfec guibg=NONE gui=NONE
hi javaScriptFunction ctermfg=108 ctermbg=NONE cterm=NONE guifg=#93b687 guibg=NONE gui=NONE
hi javaScriptRailsFunction ctermfg=186 ctermbg=NONE cterm=NONE guifg=#e9db82 guibg=NONE gui=NONE
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlKey ctermfg=153 ctermbg=NONE cterm=NONE guifg=#9fccff guibg=NONE gui=NONE
hi yamlAnchor ctermfg=183 ctermbg=NONE cterm=NONE guifg=#d0c0ed guibg=NONE gui=NONE
hi yamlAlias ctermfg=183 ctermbg=NONE cterm=NONE guifg=#d0c0ed guibg=NONE gui=NONE
hi yamlDocumentHeader ctermfg=151 ctermbg=NONE cterm=NONE guifg=#b0cba6 guibg=NONE gui=NONE
hi cssURL ctermfg=183 ctermbg=NONE cterm=NONE guifg=#d0c0ed guibg=NONE gui=NONE
hi cssFunctionName ctermfg=186 ctermbg=NONE cterm=NONE guifg=#e9db82 guibg=NONE gui=NONE
hi cssColor ctermfg=189 ctermbg=NONE cterm=NONE guifg=#e9cfec guibg=NONE gui=NONE
hi cssPseudoClassId ctermfg=153 ctermbg=NONE cterm=NONE guifg=#9fccff guibg=NONE gui=NONE
hi cssClassName ctermfg=153 ctermbg=NONE cterm=NONE guifg=#9fccff guibg=NONE gui=NONE
hi cssValueLength ctermfg=189 ctermbg=NONE cterm=NONE guifg=#e9cfec guibg=NONE gui=NONE
hi cssCommonAttr ctermfg=151 ctermbg=NONE cterm=NONE guifg=#a7cfa3 guibg=NONE gui=NONE
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE