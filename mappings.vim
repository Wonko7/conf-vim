"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if &diff
  map gn ]czz
  map gN [czz
endif

" FZF also see tags. :lines maybe..
map <space><space> :Denite buffer<cr>
map <space>f       :Denite file_mru<cr>
map <space>o       :DeniteProjectDir file/rec/git file/rec buffer<cr>
map <space>:       :Denite command_history<cr>
map <space>/       :Denite history:search<cr>
map <space>t       :Denite tag<cr>
map z=             :Denite spell<cr>

map g<space>s :Gstatus<cr>
map g<space>d :Gdiffsplit<cr>
map g<space>w :Gwrite<cr>
map g<space>co :Gread<cr>
map g<space>b :Gblame<cr>
map g<space>c :Gcommit<cr>
map g<space>ca :Gcommit -a<cr>

        "\ `finddir('.git', ';') != '' ? 'file/rec/git' : 'file/rec'`
"map <SPACE>f :Denite file/rec/git file/rec buffer<RETURN>
"map <SPACE>f :Files<RETURN>
" map <SPACE>c :Commits<RETURN>
" map <SPACE>C :BCommits<RETURN>
"map <SPACE>f :Defx -listed -resume -buffer-name=tab`tabpagenr()`<CR>
map <SPACE>gf :GFiles<RETURN>
map <SPACE>R :Rg<SPACE>
map <SPACE>r :call RgCurrentWord()<cr>
"jjkkkmap <SPACE>/ :History/<RETURN>

map U :GundoToggle<CR>

map <F12> :call My_set_spell()<CR>
map <F11> :call My_set_style()<CR>

imap <C-l> <C-x><C-l>
map Q q

map <C-k> :bw<CR>
map <C-K><C-K> :bw!<CR>

map <SPACE>k <C-w><up>
map <SPACE>j <C-w><down>
map <SPACE>l <C-w><right>
map <SPACE>h <C-w><left>
map + <C-w>>

map -d :%s/\v\s*$//<RETURN>``<ESC>:noh<RETURN>
map -u yypVr=
map -- <ESC>:noh<RETURN>:set nopaste<RETURN>
imap jj <Esc>
imap ,, <Esc>
" how the fuck did I not know about sudoedit??
" cmap w!! :w suda:///%<RETURN>
cmap ww :w!<RETURN>
" cmap ee :e suda:///%<RETURN>

cmap cwd lcd %:p:h
cmap :S %s/\v
vmap g/ y/<C-R>"<CR>
vmap g? y?<C-R>"<CR>
map Y y$

map <F1> ggVGg?

" wrapping ys:
nmap <M-y> ys
nmap <M-w> ysiw
nmap <M-W> ys%
nmap <M-i> ysiw)
nmap <M-I> ys%)
nmap <M-a> ysiw]
nmap <M-A> ys%]

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
