syntax case ignore
syntax match Identifier		/^[ \t]*=.*$/	          contains=Identifier,Id1,Id2,Id3,Id4,Id5,Id6,Id7,Id8,Id9
syntax match Statement		/^[ \t]*-.*/              contains=Identifier,Id1,Id2,Id3,Id4,Id5,Id6,Id7,Id8,Id9
syntax match Comment		/^[ \t]*+.*$/             contains=Identifier,Id1,Id2,Id3,Id4,Id5,Id6,Id7,Id8,Id9

syntax match Title		display /^\*.*$/          contains=Identifier,Id1,Id2,Id3,Id4,Id5,Id6,Id7,Id8,Id9
syntax match Special		display /^[ \t]*\*.*$/    contains=Identifier,Id1,Id2,Id3,Id4,Id5,Id6,Id7,Id8,Id9
syntax match Question		/^[ \t]*\/.*/	          contains=Identifier,Id1,Id2,Id3,Id4,Id5,Id6,Id7,Id8,Id9
syntax match Todo		/^[ \t]*!.*$/	          contains=Identifier,Id1,Id2,Id3,Id4,Id5,Id6,Id7,Id8,Id9

syntax match Error		/^[ \t]*|.*$/	          contains=Identifier,Id1,Id2,Id3,Id4,Id5,Id6,Id7,Id8,Id9
syntax match String		/^[ \t]*?.*$/	          contains=Identifier,Id1,Id2,Id3,Id4,Id5,Id6,Id7,Id8,Id9

"syntax match Default		/^[ \t]*[A-Za-z0-9].*$/   contains=Identifier,Id1,Id2,Id3,Id4,Id5,Id6,Id7,Id8,Id9
syntax match Identifier		/=>.*/                    contains=Identifier,Id1,Id2,Id3,Id4,Id5,Id6,Id7,Id8,Id9
syntax match Id1		/->.*/                    contains=Identifier,Id1,Id2,Id3,Id4,Id5,Id6,Id7,Id8,Id9
syntax match Id2		/++.*/                    contains=Identifier,Id1,Id2,Id3,Id4,Id5,Id6,Id7,Id8,Id9
syntax match Id3		/\*\*.*/                  contains=Identifier,Id1,Id2,Id3,Id4,Id5,Id6,Id7,Id8,Id9
syntax match Id4		/\/\/.*/                  contains=Identifier,Id1,Id2,Id3,Id4,Id5,Id6,Id7,Id8,Id9
syntax match Id5		/!!.*/                    contains=Identifier,Id1,Id2,Id3,Id4,Id5,Id6,Id7,Id8,Id9
syntax match Id6		/||.*/                    contains=Identifier,Id1,Id2,Id3,Id4,Id5,Id6,Id7,Id8,Id9

syntax match Id7		/==.*/                    contains=Identifier,Id1,Id2,Id3,Id4,Id5,Id6,Id7,Id8,Id9
syntax match Id8		/--.*/                    contains=Identifier,Id1,Id2,Id3,Id4,Id5,Id6,Id7,Id8,Id9

syntax match Id9		/??.*/                    contains=Identifier,Id1,Id2,Id3,Id4,Id5,Id6,Id7,Id8,Id9

" add something to ?.

hi def link Id1 Statement
" could have been comment, but... I don't really use comment.
hi def link Id2 Error
hi def link Id3 Special
hi def link Id4 Question
hi def link Id5 Todo
hi def link Id6 Error
hi def link Id7 Macro
"hi def link Id8 Type
hi def link Id8 Structure
hi def link Id9 String

let b:current_syntax = "wtodo"

"    - aoeujk => lol
"    = aoeujk -> lol
"    / aoeujk ++ lol
"    + aoeujk ** lol
"    | aoeujk // lol
"    ? aoeujk !! lol
"    * aoeujk || lol
"    = aoeujk == lol
"    = aoeujk -- lol
"    ? aoeu -- lol
"    - aoeu ?? lol
