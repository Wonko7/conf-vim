let g:my_set_spell = 0
let g:my_set_style = -1

function! My_set_spell()
	if g:my_set_spell == 0
		set spell
		set spelllang=en
		let g:my_set_spell = 1
		echo "Spell (lang=en)"
	elseif g:my_set_spell == 1
		set spell
		set spelllang=fr
		let g:my_set_spell = 2
		echo "Spell (lang=fr)"
	elseif g:my_set_spell == 2
		set spell
		set spelllang=en,fr
		let g:my_set_spell = 3
		echo "Spell (lang=en,fr)"
	else
		set nospell
		let g:my_set_spell = 0
		echo "No spell"
	endif
endfunction

function! My_set_style()
	if g:my_set_style == 0
		set noexpandtab
		set softtabstop=4
		set tabstop=4
		set shiftwidth=4
		set smarttab
		set comments=sl:/*,mb:\ *,ex:\ */
		let g:DoxygenToolkit_interCommentTag = "* "
		let g:DoxygenToolkit_interCommentBlock = "* "
		let g:DoxygenToolkit_cinoptions = "c1C1"
		let g:my_set_style = 1
		echo "kernel-4 (indent=tab, len=4, tab_display=4)"
	"if g:my_set_style == 0
	"	set expandtab
	"	set softtabstop=3
	"	set tabstop=8
	"	set shiftwidth=3
	"	set smarttab
	"	set comments=sl:/*,mb:\ *,ex:\ */
	"	let g:DoxygenToolkit_interCommentTag = "* "
	"	let g:DoxygenToolkit_interCommentBlock = "* "
	"	let g:DoxygenToolkit_cinoptions = "c1C1"
	"	echo "fred (indent=space, len=3, tab_display=8)"
	"	let g:my_set_style = 1 
	elseif g:my_set_style == 1
		set noexpandtab
		set softtabstop=8
		set tabstop=8
		set shiftwidth=8
		set smarttab
		set comments=sl:/*,mb:\ *,ex:\ */
		let g:DoxygenToolkit_interCommentTag = "* "
		let g:DoxygenToolkit_interCommentBlock = "* "
		let g:DoxygenToolkit_cinoptions = "c1C1"
		echo "kernel-8 (indent=tab, len=8, tab_display=8)"
		let g:my_set_style = 2 
	elseif g:my_set_style == 2 || g:my_set_style == -1
		set noexpandtab
		set softtabstop=8
		set tabstop=8
		set shiftwidth=8
		set smarttab
		set comments=sl:/*,mb:**,ex:*/
		let g:DoxygenToolkit_interCommentTag = "** "
		let g:DoxygenToolkit_interCommentBlock = "** "
		let g:DoxygenToolkit_cinoptions = "c0C1"
                if g:my_set_style != -1
			echo "kernel-gnu-comments-8 (indent=space, len=2, tab_display=8)"
		endif
		let g:my_set_style = 3 
	else
		set noexpandtab
		set softtabstop=8
		set tabstop=8
		set shiftwidth=2
		set smarttab
		set comments=sl:/*,mb:**,ex:*/
		let g:DoxygenToolkit_interCommentTag = "** "
		let g:DoxygenToolkit_interCommentBlock = "** "
		let g:DoxygenToolkit_cinoptions = "c0C1"
		let g:my_set_style = 0
		echo "normal-2 (indent=space, len=2, tab_display=8)"
	endif
endfunction

fu! SeeTab()
	if !exists("g:SeeTabEnabled")
		let g:SeeTabEnabled = 1
		let g:SeeTab_list = &list
		let g:SeeTab_listchars = &listchars
		let regA = @a
		redir @a
		silent! hi SpecialKey
		redir END
		let g:SeeTabSpecialKey = @a
		let @a = regA
		silent! hi SpecialKey guifg=grey25  ctermfg=black 
		set list
		set listchars=tab:\|\ 
	else
		let &list = g:SeeTab_list
		let &listchars = &listchars
		silent! exe "hi ".substitute(g:SeeTabSpecialKey,'xxx','','e')
		unlet g:SeeTabEnabled g:SeeTab_list g:SeeTab_listchars
	endif
endfunc
"call SeeTab()


function! SuperCleverTab()
  " do we have omni completion available
  let line = getline('.')                         " curline
  let substr = strpart(line, -1, col('.'))      " from start to cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr) == 0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  if &omnifunc != ''
    "use omni-completion 1. priority

    " FIXME fuck omni completion for now.... :
    " return "\<C-X>\<C-O>"

    return "\<C-N>"
  " elseif &dictionary != ''
  "   " no omni completion, try dictionary completion
  "   return "\<C-K>"
  else
    "use omni completion or dictionary completion
    "use known-word completion
    return "\<C-N>"
  endif
endfunction

function! C_Func_Add_At()
perl << EOF
	$first = VIM::Eval("a:firstline");
	$last  = VIM::Eval("a:lastline");
	@l     = $curbuf->Get($first .. $last);

	foreach $i ((@l))
	{
		$b .= $i . "\n";
	}

	$b =~ m/ ((\w* [*]* \s)*)	# function return type
		 (\w+ \s*)		# function name
		 \(			# lparen
		 ((\w+ [*]* \s)* ,)	# function arguments
		 ((\w+ [*]* \s)* )	# last argument
		 \)			# rparen
	       /xgms;
	$return = $1;
	$name   = $3;
	$args   = $4;
	$larg   = $6;

	VIM::Msg("1 " . $return);
        VIM::Msg("2 " . $name  );
        VIM::Msg("3 " . $args  );
        VIM::Msg("4 " . $larg  );


EOF
endfunction

