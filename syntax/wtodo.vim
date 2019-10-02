syntax case ignore
syntax match Comment		/^[ \t]\+[^!\*+-/!?].*/ contains=Identifier
syntax match Title		display /^\*.*$/ contains=Identifier
syntax match Special		display /^[ \t]*\*.*$/ contains=Identifier
syntax match Statement		/^[ \t]*-.*/ contains=Identifier
syntax match Question		/^[ \t]*\/.*/ contains=Identifier
syntax match Todo		/^[ \t]*!.*$/ contains=Identifier
syntax match Error		/^[ \t]*|.*$/ contains=Identifier
syntax match Function		/^[ \t]*[A-Za-z0-9].*$/ contains=Identifier
syntax match Identifier		/=>.*/

let b:current_syntax = "wtodo"
