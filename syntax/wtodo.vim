syntax case ignore
syntax match Comment		/^[ \t]*+.*$/             contains=Identifier,Id2,Id3,Id4,Id5,Id6
syntax match Title		display /^\*.*$/          contains=Identifier,Id2,Id3,Id4,Id5,Id6
syntax match Special		display /^[ \t]*\*.*$/    contains=Identifier,Id2,Id3,Id4,Id5,Id6
syntax match Statement		/^[ \t]*-.*/              contains=Identifier,Id2,Id3,Id4,Id5,Id6
syntax match Question		/^[ \t]*\/.*/	          contains=Identifier,Id2,Id3,Id4,Id5,Id6
syntax match Todo		/^[ \t]*!.*$/	          contains=Identifier,Id2,Id3,Id4,Id5,Id6
syntax match Error		/^[ \t]*|.*$/	          contains=Identifier,Id2,Id3,Id4,Id5,Id6
syntax match Identifier		/^[ \t]*=.*$/	          contains=Identifier,Id2,Id3,Id4,Id5,Id6
"syntax match Default		/^[ \t]*[A-Za-z0-9].*$/   contains=Identifier,Id2,Id3,Id4,Id5,Id6
syntax match Identifier		/=>.*/                    contains=Identifier,Id2,Id3,Id4,Id5,Id6
syntax match Id2		/->.*/                    contains=Identifier,Id2,Id3,Id4,Id5,Id6
syntax match Id2		/||.*/                    contains=Identifier,Id2,Id3,Id4,Id5,Id6
syntax match Id3		/==.*/                    contains=Identifier,Id2,Id3,Id4,Id5,Id6
syntax match Id4		/!!.*/                    contains=Identifier,Id2,Id3,Id4,Id5,Id6
syntax match Id5		/--.*/                    contains=Identifier,Id2,Id3,Id4,Id5,Id6
syntax match Id6		/++.*/                    contains=Identifier,Id2,Id3,Id4,Id5,Id6

" add something to ?.

hi def link Id2 Error
hi def link Id3 Question
hi def link Id4 Todo
hi def link Id5 Special
hi def link Id6 Comment

let b:current_syntax = "wtodo"
