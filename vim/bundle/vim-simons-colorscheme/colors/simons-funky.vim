" Vim color scheme
"
" Name:         simons-funky.vim
" Maintainer:   Simon Stemplinger <simon.stemplinger@gmx.de>
"

let green="#80FF00"
"let magenta="#D31D8C"
"let cyan="#00FFFF"
"let blue="#0080FF"
"let orange="#FFBE00"
"let lightGrey="#444444"
"let darkGrey="#2b2b2b"

let colors_name="simons-funky"



hi link htmlTag              xmlTag
hi link htmlTagName          xmlTagName
hi link htmlEndTag           xmlEndTag
hi clear

hi Normal                    guifg=#FFFFFF guibg=#000000
hi Cursor                    guifg=#000000 ctermfg=0     guibg=#FFFFFF ctermbg=15
"hi CursorLine                guibg=#333333 guifg=NONE   term=underline
"hi CursorCol                 guibg=#333333 guifg=NONE
hi StatusLine                guifg=Black   guibg=#aabbee gui=bold ctermfg=Black ctermbg=White cterm=bold
hi VertSplit                 guifg=Black   guibg=#aabbee gui=bold ctermfg=Black ctermbg=White
hi StatusLineNC              guifg=#444444 guibg=#aaaaaa gui=none ctermfg=Black ctermbg=Grey

hi Comment                   guifg=#BC9458 ctermfg=180 gui=italic
hi Constant                  guifg=#00FFFF ctermfg=73
hi Define                    guifg=#00FFFF ctermfg=173
hi Error                     guifg=#FFC66D ctermfg=221 guibg=#990000 ctermbg=88
hi Function                  guifg=#80FF00 ctermfg=221 gui=NONE cterm=NONE
hi Identifier                guifg=#00FFFF ctermfg=73  gui=NONE cterm=NONE
hi Include                   guifg=#FFBE00 ctermfg=173 gui=NONE cterm=NONE
hi PreCondit                 guifg=#FFBE00 ctermfg=173 gui=NONE cterm=NONE
hi Keyword                   guifg=#FFBE00 ctermfg=173 cterm=NONE
hi LineNr                    guifg=#555555 ctermfg=159 guibg=#2b2b2b
hi Number                    guifg=#80FF00"g ctermfg=107
hi PreProc                   guifg=#E6E1DC ctermfg=103
hi Search                    guifg=NONE    ctermfg=NONE guibg=#444444 ctermbg=235
hi IncSearch                 guifg=White   guibg=Black ctermfg=White ctermbg=Black
hi Statement                 guifg=#FFBE00 ctermfg=173 gui=NONE cterm=NONE
hi String                    guifg=#80FF00"g ctermfg=107
hi Title                     guifg=#FFFFFF ctermfg=15
hi Type                      guifg=#D31D8C ctermfg=167 gui=NONE cterm=NONE
hi Visual                    guibg=#5A647E ctermbg=60

hi DiffAdd                   guifg=#E6E1DC ctermfg=7 guibg=#519F50 ctermbg=71
hi DiffDelete                guifg=#E6E1DC ctermfg=7 guibg=#660000 ctermbg=52
hi Special                   guifg=#D31D8C ctermfg=167

hi pythonBuiltin             guifg=#00FFFF ctermfg=73 gui=NONE cterm=NONE
hi rubyBlockParameter        guifg=#FFFFFF ctermfg=15
hi rubyConstant              guifg=#D31D8C ctermfg=167
hi rubyInstanceVariable      guifg=#D0D0FF ctermfg=189
hi rubyInterpolation         guifg=#519F50 ctermfg=107
hi rubyLocalVariableOrMethod guifg=#D0D0FF ctermfg=189
hi rubyPredefinedConstant    guifg=#D31D8C ctermfg=167
hi rubyPseudoVariable        guifg=#FFC66D ctermfg=221
hi rubyStringDelimiter       guifg=#80FF00"g ctermfg=143
hi rubySymbol                guifg=#80FF00"g

hi NonText                   guifg=#404040 ctermfg=8
hi SpecialKey                guifg=#404040 ctermfg=8

hi xmlTag                    guifg=#E8BF6A ctermfg=179
hi xmlTagName                guifg=#E8BF6A ctermfg=179
hi xmlEndTag                 guifg=#E8BF6A ctermfg=179

hi mailSubject               guifg=#80FF00"g ctermfg=107
hi mailHeaderKey             guifg=#FFC66D ctermfg=221
hi mailEmail                 guifg=#80FF00"g ctermfg=107 gui=italic cterm=underline

hi SpellBad                  guifg=#D70000 ctermfg=160 ctermbg=NONE cterm=underline
hi SpellRare                 guifg=#D75F87 ctermfg=168 guibg=NONE ctermbg=NONE gui=underline cterm=underline
hi SpellCap                  guifg=#D0D0FF ctermfg=189 guibg=NONE ctermbg=NONE gui=underline cterm=underline
hi MatchParen                guifg=#FFFFFF ctermfg=15 guibg=#005f5f ctermbg=23

hi Ignore                    ctermfg=Black
hi WildMenu                  guifg=Black   guibg=#ffff00 gui=bold cterm=bold
hi Directory                 none
hi link Directory            Identifier

hi Folded                    guifg=#F6F3E8 guibg=#444444 gui=NONE
hi Folded                    guibg=#110077 guifg=#aaddee
hi FoldColumn                none
hi link FoldColumn           Folded

hi Pmenu                     guifg=#F6F3E8 guibg=#444444 gui=NONE
hi PmenuSel                  guifg=#000000 guibg=#80FF00"g gui=NONE
hi PMenuSbar                 guibg=#5A647E gui=NONE
hi PMenuThumb                guibg=#AAAAAA gui=NONE
