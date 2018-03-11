"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if &diff
  map gn ]czz
  map gN [czz
endif

" FZF also see tags. :lines maybe..
map <SPACE><SPACE> :Buffers<RETURN>
map <SPACE>o :History<RETURN>
map <SPACE>f :Files<RETURN>
" map <SPACE>c :Commits<RETURN>
" map <SPACE>C :BCommits<RETURN>
map <SPACE>gf :GFiles<RETURN>
map <SPACE>R :Rg<SPACE>
map <SPACE>r :RgCurrentWord<cr>
map <SPACE>/ :History/<RETURN>

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


" cscope: FZF? see https://gist.github.com/amitab/cd051f1ea23c588109c6cfcb7d1d5776
nnoremap <silent> <space>s  :call Cscope('8', expand('<cword>'))<CR>
nnoremap <silent> <space>cd :call Cscope('1', expand('<cword>'))<CR>
nnoremap <silent> <space>cf :call Cscope('7', expand('<cword>'))<CR>
nnoremap <silent> <space>cc :call Cscope('3', expand('<cword>'))<CR>
nnoremap <silent> <space>cC :call Cscope('2', expand('<cword>'))<CR>
" nmap <Space>s :cs find s <C-R>=expand("<cword>")<CR><CR>
" nmap <C-Space>g :cs find g <C-R>=expand("<cword>")<CR><CR>
" nmap <C-Space>c :cs find c <C-R>=expand("<cword>")<CR><CR>
" nmap <C-Space>t :cs find t <C-R>=expand("<cword>")<CR><CR>
" nmap <C-Space>e :cs find e <C-R>=expand("<cword>")<CR><CR>
" nmap <C-Space>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
" nmap <C-Space>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
" nmap <C-Space>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" c args: FIXME do this in c langs only?
map g> cxiaWcxia
"map <CR>> cxiavia<ESC>Wcxiavia<ESC>
map g< cxiabcxia
"map <CR>< cxiaviao<ESC>bcxia

" copy/paste to *
vnoremap <C-p> "*p
vnoremap <C-y> "*y
noremap <C-p> "*p
nnoremap <C-y> "*y
