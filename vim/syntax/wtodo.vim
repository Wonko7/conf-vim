syntax case ignore
syntax match Comment		/^[ \t]\+[^!\*+-/!?].*/
syntax match Title		display /^\*.*$/ contains=Identifier
syntax match Special		display /^[ \t]\+\*.*$/ contains=Identifier
syntax match Statement		/^[ \t]\+-.*/ contains=Identifier
syntax match Question		/^[ \t]\+\/.*/
syntax match Identifier		/=.*/
syntax match Todo		/^[ \t]*!.*$/


let b:current_syntax = "wtodo"
