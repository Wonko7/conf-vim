"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" C
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Struct / Enum / Union
"imap #s<tab>	struct<RETURN>{<CR>};<ESC>kkA <tab><tab><tab>s_<ESC>F xA
"imap #n<tab>	enum<RETURN>{<CR>};<ESC>kkA<tab><tab><tab>e_<ESC>F xA
"imap #u<tab>	union<RETURN>{<CR>};<ESC>kkA<tab><tab><tab>u_<ESC>F xA
"
"" " main function
""imap <leader>m int<tab><tab>main(int<tab><tab><tab>argc,<RETURN><tab><tab><tab><tab><tab><tab><tab><tab> char<tab><tab><tab>**argv)<RETURN>{<ESC>o}<ESC>O
"" 
"" " For loop
"imap for<tab> for ()<ESC>i
"imap fori<tab> for (int i = 0; i < ; ++i)<ESC>BBi
"imap ford<tab> for (int i = 0; i > ; --i)<ESC>BBi
"imap forei<tab> for (int i = 0; i <= ; ++i)<ESC>BBi
"imap fored<tab> for (int i = 0; i >= ; --i)<ESC>BBi
"" 
"" " While loop
"imap while<tab> while ()<ESC>i
"" 
"" " if
"imap if<tab> if ()<ESC>i
"imap else<tab> else<CR>
"imap elif<tab> else<CR>{<CR>if ()<CR>}<ESC>kf(a
"" 
"" " preproc
"imap #i<tab> #include <tab>""<ESC>$i
"imap #I<tab> #include <tab><><ESC>$i
"imap #d<tab> #define <tab><tab><ESC>A
