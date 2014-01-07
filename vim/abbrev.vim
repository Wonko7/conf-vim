"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" abbr
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" imap qq    quelque
" imap qqun   quelqu'un
" imap qqs    quelques
" imap qcq    quelconque
" imap qcqs   quelconques
" imap bcp    beaucoup
" imap Qq    Quelque
" imap Qqun   Quelqu'un
" imap Qqs    Quelques
" imap Qcq    Quelconque
" imap Qcqs   Quelconques
" imap Bcp    Beaucoup


" Opening and closing parenthesis
autocmd FileType php,perl,javascript,java,cpp,c imap <buffer> (<tab> ()<ESC>i
autocmd FileType php,perl,javascript,java,cpp,c imap <buffer> [<tab> []<ESC>i
autocmd FileType php,perl,javascript,java,cpp,c imap <buffer> "<tab> ""<ESC>i
autocmd FileType php,perl,javascript,java,cpp,c imap <buffer> '<tab> ''<ESC>i
autocmd FileType php,perl,javascript,java,cpp,c imap <buffer> <<tab> <><ESC>i
autocmd FileType php,perl,javascript,java,cpp,c imap <buffer> <\<tab> <><ESC>i
autocmd FileType php,perl,javascript,java,cpp,c imap <buffer> {<tab> {}<ESC>i
