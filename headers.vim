"
" file headers
"
aug coding
  au!

  au BufNewFile	  {M,m}akefile	    call MakefileNew()

  au BufNewFile	  *.c{,c,++,pp,xx}  call HeaderCNew()
  au BufWritePre  *.c{,c,++,pp,xx}  call HeaderUpdate()

  au BufNewFile	  *.h{,h,++,pp,xx}  call HeaderHNew()
  au BufWritePre  *.h{,h,++,pp,xx}  call HeaderUpdate()

  au BufNewFile	  index.{html,php}  call HeaderWWWNew()
aug END

function! Replace(cs, cm, ce)
  execute "% s,@CS@," . a:cs . ",ge"
  execute "% s,@CM@," . a:cm . ",ge"
  execute "% s,@CE@," . a:ce . ",ge"
  execute "% s,@DATE-STAMP@," . strftime("%c") . ",ge"
  execute "% s,@FILE-NAME@," . expand('%:t') . ",ge"
  execute "% s,@FILE-HEADER@," . substitute(substitute(expand('%:t'), "\\.c", "\\.h", "g"), "\\.hc", "\\.hh", "g") . ",ge"
  execute "% s,@LARGE-FILE-NAME@," . substitute(toupper(expand('%:t')), "\\.", "_", "g") . ",ge"
  execute "% s,@PART@," . expand("%:p:h:t") . ",ge"
  execute "% s,@PROJECT@," . expand("%:p:h:t") . ",ge"
  execute "% s,@USER-LOGIN@," . g:login . ",ge"
  execute "% s,@EMAIL@," . g:email . ",ge"
  execute "% s,@AKA@," . g:login_aka . ",ge"
endfun
"execute Get_git_parent()

function! HeaderCNew()
  let header = confirm("Add header?", "&None\n&Epita\n&Default")
  if header == 2
    0r ~/.vim/skel/epita.tpl
    9r ~/.vim/skel/c.tpl
  endif
  if header == 3
    0r ~/.vim/skel/c.tpl
  endif
  if header >= 2
    call Replace('/*', '**', '*/')
    normal 2G3W
  endif
endfun

function! HeaderHNew()
  let header = confirm("Add header?", "&None\n&Epita\n&Default")
  if header == 2
    0r ~/.vim/skel/epita.tpl
    9r ~/.vim/skel/h.tpl
  endif
  if header == 3
    0r ~/.vim/skel/h.tpl
  endif
  if header >= 2
    call Replace('/*', '**', '*/')
    normal 2G3W
  endif
endfun

function! HeaderWWWNew()
  let header = confirm("Use default structure?", "&Yes\n&No")
  if header == 1
    0r ~/.vim/skel/index.tpl
    call Replace('/*', '**', '*/')
    normal 2G3W
  endif
endfun

function! HeaderUpdate()
  let linenb = line(".")
  let n = search('Last update')
  if (n > 0) && (n< 10)
    execute "1,10 s,\\(Last update \\).*,\\1" . strftime("%c") . " " . g:login . ","
  endif
  execute ":" . linenb
endfun

function! MakefileNew()
  let makefile = confirm("Use default makefile?", "&None\n&C\n&C++\n&LaTeX")
  if makefile == 2
    0r ~/.vim/skel/Makefile_c.tpl
  elseif makefile == 3
    0r ~/.vim/skel/Makefile.tpl
  elseif makefile == 4
    0r ~/.vim/skel/Makefile_ltx.tpl
  endif
endfun
