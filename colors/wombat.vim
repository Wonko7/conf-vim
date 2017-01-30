" Maintainer:	Lars H. Nielsen (dengmao@gmail.com)
" Last Change:	January 22 2007

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "wombat"


" Vim >= 7.0 specific colors
if version >= 700
  hi CursorLine		guibg=#2d2d2d
  hi CursorColumn	guibg=#2d2d2d
  hi MatchParen		guifg=#f6f3e8 guibg=#857b6f gui=bold
  hi Pmenu 		guifg=#f6f3e8 guibg=#444444
  hi PmenuSel		guifg=#000000 guibg=#cae682
endif

" General colors
"hi Cursor 		guifg=NONE    guibg=#656565 gui=none "grey
"hi Cursor 		guifg=#ff1493    guibg=NONE gui=bold
"hi Cursor 		guifg=#00FF00 guibg=#FF0000 gui=bold
"hi Cursor 		guifg=#000000 guibg=#ff1493 gui=bold "pink
hi Cursor 		guifg=#000000 guibg=#cae682 gui=none
hi Normal 		guifg=#f6f3e8 guibg=#242424 gui=none
hi NonText 		guifg=#808080 guibg=#303030 gui=none
hi LineNr 		guifg=#857b6f guibg=#141414 gui=none
hi SignColumn   	guifg=#857b6f guibg=#121212 gui=none
hi StatusLine		guifg=#f6f3e8 guibg=#444444 gui=bold
hi StatusLineNC 	guifg=#857b6f guibg=#444444 gui=none
hi VertSplit 		guifg=#444444 guibg=#444444 gui=none
hi Folded 		guibg=#384048 guifg=#a0a8b0 gui=none
hi Title		guifg=#f6f3e8 guibg=NONE    gui=bold
hi Visual		guifg=#f6f3e8 guibg=#444444 gui=none
hi SpecialKey		guifg=#808080 guibg=#242424 gui=none
" General2
hi Search		guifg=#ff1493 guibg=NONE    gui=underline
"hi Search		guifg=#f6f3e8 guibg=#ff1493 gui=none
"hi Search		guifg=#f6f3e8 guibg=#ff1493 gui=none
hi IncSearch		guifg=#14ff13 guibg=NONE    gui=underline
hi Title		guifg=#95e454 gui=bold

" Syntax highlighting
"hi Comment 		guifg=#99968b "gui=italic
hi Comment 		guifg=#99968b gui=none
hi Todo 		guifg=#FF0000 gui=bold guibg=#242424
hi Constant		guifg=#e5786d gui=none
hi String 		guifg=#95e454 gui=none
hi Identifier		guifg=#cae682 gui=none
hi Function		guifg=#cae682 gui=none
hi Type 		guifg=#cae682 gui=none
hi Statement		guifg=#8ac6f2 gui=none
hi Keyword		guifg=#8ac6f2 gui=none
hi PreProc 		guifg=#e5786d gui=none
hi Number		guifg=#e5786d gui=none
"hi Special		guifg=#c68af2 gui=none
"hi Special		guifg=#e7f6da gui=bold
hi Special		guifg=#99968b gui=bold
