"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"map \c <Plug>Comment
"map \d <Plug>DeComment
"map \t <Plug>Traditional
"map \c <Plug>FirstLine
"vmap \c <Plug>VisualFirstLine<CR>

if &diff
  map gn ]czz
  map gN [czz
  map gp dp
  map go do
  map g1 dp
  map g2 do
endif

map <SPACE>o :CtrlPMRU<RETURN><c-d>
map <SPACE>f :CtrlP<RETURN>
"map <SPACE>o :FufBuffer<RETURN>
"map <SPACE>f :FufFile<RETURN>
"map <SPACE>e :NERDTree `pwd`<RETURN>

map U :GundoToggle<CR>

" map <SPACE>e :NERDTree `pwd`<RETURN>
" map <SPACE>t :TlistToggle<RETURN>
map <F12> :call My_set_spell()<CR>
map <F11> :call My_set_style()<CR>

"map <space> <C-x><C-n>
"map <C-space> <C-x><C-n>
imap <C-l> <C-x><C-l>
"imap <C-j> <C-x><C-i>
map <M-i> i <ESC>r
map Q gq
map <down> gt
map <up> gT
map <right> <ESC>:bn<RETURN>
map <left> <ESC>:bp<RETURN>

map <C-k> :bw<CR>

map <SPACE>k <C-w><up>
map <SPACE>j <C-w><down>
map <SPACE>l <C-w><right>
map <SPACE>h <C-w><left>
map + <C-w>>


"map <up> <ESC>:Sex<RETURN><ESC><C-W><C-W> " up arrow (normal mode) brings up a file list
"map <down> <ESC>:Tlist<RETURN> " down arrow  (normal mode) brings up the tag list
" map -d <ESC>:1,$s/[<tab> ]*$//<RETURN>`'<ESC>:1,$s/[  ]*$//<RETURN>`'<ESC>:noh<RETURN>
map -d <ESC>:1,$s/ / /<RETURN><ESC>:1,$s/[<tab> ]*$//<RETURN>`'<ESC>:noh<RETURN>
map -u yypVr=
map -- <ESC>:noh<RETURN>
imap jj <Esc>
"imap vv <Esc>
"imap uu <Esc>
cmap w!! %!sudo tee > /dev/null %
cmap cwd lcd %:p:h
cmap :S %s/\v
vmap / y/<C-R>"<CR>
map Y y$

map <F1> ggVGg?
"map :tags :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" old; bind function to the tab key: see vim/vim/after/plugin/snipMate.vim.
"inoremap <TAB> <C-R>=SuperCleverTab()<RETURN>

" cscope:
"nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
"nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
"nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
"nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
"nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
"nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

nmap <C-Space>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-Space>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-Space>d :cs find d <C-R>=expand("<cword>")<CR><CR>
