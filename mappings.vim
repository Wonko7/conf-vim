"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if &diff
  map gn ]czz
  map gN [czz
endif

map <SPACE>o :CtrlPMRU<RETURN><c-d>
map <SPACE>f :CtrlP<RETURN>
map <SPACE>e :FufBuffer<RETURN>

map U :GundoToggle<CR>

map <F12> :call My_set_spell()<CR>
map <F11> :call My_set_style()<CR>

imap <C-l> <C-x><C-l>
map Q q

map <C-k> :bw<CR>

map <SPACE>k <C-w><up>
map <SPACE>j <C-w><down>
map <SPACE>l <C-w><right>
map <SPACE>h <C-w><left>
map + <C-w>>


map -d :%s/\v\s*$//<RETURN>``<ESC>:noh<RETURN>
map -u yypVr=
map -- <ESC>:noh<RETURN>
imap jj <Esc>
imap ,, <Esc>
cmap w!! %!sudo tee > /dev/null %<RETURN>
cmap ww %!sudo tee > /dev/null %<RETURN>
cmap cwd lcd %:p:h
cmap :S %s/\v
vmap / y/<C-R>"<CR>
vmap ? y?<C-R>"<CR>
map Y y$

map <F1> ggVGg?

" cscope:
nmap <Space>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-Space>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-Space>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" c args: FIXME do this in c langs only?
map g> cxiavia<ESC>Wcxiavia<ESC>
map <CR>> cxiavia<ESC>Wcxiavia<ESC>
"W
map g< cxiaviao<ESC>bbcxia
map <CR>< cxiaviao<ESC>bbcxia

" copy/paste to *
vnoremap <C-p> "*p
vnoremap <C-y> "*y
noremap <C-p> "*p
nnoremap <C-y> "*y
