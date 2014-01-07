if v:progname =~? "evim"
  finish
endif

set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup				" just use git.
set noswapfile
set history=5000			" keep 50 lines of command line history
set ruler				" show the cursor position all the time
set showcmd				" display incomplete commands


if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  filetype plugin indent on
  augroup vimrcEx
  au!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END
else
  set autoindent			" always set autoindenting on
endif " has("autocmd")


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" pathogen
"call pathogen#runtime_append_all_bundles()
call pathogen#infect()
call pathogen#helptags()


let g:zenburn_force_dark_Background = 1
let g:zenburn_high_Contrast = 1
"colorscheme late
"colorscheme zenburn
set background=dark
let g:solarized_contrast = 'normal'
colorscheme solarized
set scrolloff=2
set wildmode=longest,list
set viminfo='1000,f1,:500,/500,<50,s10,h
" set nomodeline
"set listchars+=trail:_,tab:I. " FIXME; for now, remove tab display

set nowrap
set wildignore=*.o,*.obj,*.bak,*.exe,*~
"set lz " do not redraw while running macros (much faster) (LazyRedraw)
set hid " you can change buffer without saving
set number
set fileencoding=utf8
set encoding=utf8

filetype indent on

" SEARCH
set incsearch				" do incremental searching
set ignorecase
set smartcase
set nowrapscan

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax keyword Comment SAFE_CALL
syn keyword	cTodo		contained TODO FIXME XXX todo fixme xxx

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lang depended
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" CLOJURE

"	PAREDIT
let g:paredit_electric_return = 0
let g:paredit_shortmaps = 1
map \( :call PareditToggle()<RETURN>
let g:paredit_leader = "\\"

" cljs
au BufNewFile,BufRead *.cljs set filetype=clojure


" vim -b : edit binary using xxd-format!
augroup Binary
  au!
  au BufReadPre  *.o,out,*.obj,*.a,*.so,*.exe,*.bin let &bin=1
  au BufReadPost *.o,*.out,*.obj,*.a,*.so,*.exe,*.bin if &bin | %!xxd
  au BufReadPost *.o,*.out,*.obj,*.a,*.so,*.exe,*.bin set ft=xxd | endif
  au BufWritePre *.o,*.out,*.obj,*.a,*.so,*.exe,*.bin if &bin | %!xxd -r
  au BufWritePre *.o,*.out,*.obj,*.a,*.so,*.exe,*.bin endif
  au BufWritePost *.o,*.out,*.obj,*.a,*.so,*.exe,*.bin if &bin | %!xxd
  au BufWritePost *.o,*.out,*.obj,*.a,*.so,*.exe,*.bin set nomod | endif
augroup END
au BufNewFile,BufRead *todo,*TODO		set ft=wtodo


" perl

let perl_include_POD=1
let perl_extended_vars=1

let bash_is_sh=1
let highlight_balanced_quotes = 1
let highlight_function_name = 1

"python:

autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
"autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

autocmd BufRead *.tex set makeprg=texi2pdf\ '%'
autocmd BufRead *.tex set autoindent

" completion
set omnifunc=syntaxcomplete#Complete

" omnicompletion for cpp
" set nocp
" filetype plugin on
" let OmniCpp_ShowPrototypeInAbbr = 1
" let OmniCpp_DefaultNamespaces = ["std"]
" let OmniCpp_MayCompleteDot = 1
" let OmniCpp_MayCompleteArrow = 1
" let OmniCpp_MayCompleteScope = 1
" let OmniCpp_SelectFirstItem = 2
"
" au BufWinEnter *.[ch] let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sub conf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

source ~/.vim/mappings.vim
source ~/.vim/abbrev.vim
source ~/.vim/headers.vim
source ~/.vim/fun.vim
source ~/.vim/cabbrev.vim

" indentation
call My_set_style()

" plugins
source $VIMRUNTIME/macros/matchit.vim " extends %

au BufNewFile,BufRead *.doxygen setfiletype doxygen

let s:ECbindInInsert = 0

" Cscope:
if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=0
	set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
	    cs add cscope.out
	" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
	    cs add $CSCOPE_DB
	endif
	set csverb
endif

" plugin configuration, user info
let g:login	= "William Caldwell"
let g:email	= "William@undefined.re"
let g:login_aka	= ""

" drag bloc
runtime plugin/dragvisuals.vim

vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()


" digraphs
inoremap <expr>  <C-K>   BDG_GetDigraph()

" replace w b e
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

omap <silent> iw <Plug>CamelCaseMotion_iw
xmap <silent> iw <Plug>CamelCaseMotion_iw
omap <silent> ib <Plug>CamelCaseMotion_ib
xmap <silent> ib <Plug>CamelCaseMotion_ib
omap <silent> ie <Plug>CamelCaseMotion_ie
xmap <silent> ie <Plug>CamelCaseMotion_ie


" cursor sniper
set updatetime=2000

function! MySetCursor()
	set cursorline
	set cursorcolumn
endfunction
function! MyUnSetCursor()
	set nocursorline
	set nocursorcolumn
endfunction

au! CursorHold * call MyUnSetCursor()
au! CursorMoved * call MySetCursor()
au! CursorMovedI * call MyUnSetCursor()

" completion
let g:SuperTabDefaultCompletionType = "context"

" hl for git gutter
highlight clear SignColumn

" status:
set laststatus=2
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline_powerline_fonts = 0

"  " unicode symbols
"  let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
"  let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
"  let g:airline_symbols.linenr = '␊'
"  let g:airline_symbols.linenr = '␤'
"  let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"  let g:airline_symbols.paste = 'Þ'
"  let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'
let g:airline_theme='solarized'
"set background=dark
"let g:airline_theme='powerlineish'
let g:airline#extensions#whitespace#trailing_format = 'WS:%s'
let g:airline#extensions#whitespace#mixed_indent_format = 'MI:%s'
let g:airline#extensions#whitespace#enabled = 0

" sneak
let g:sneak#streak = 1
let g:sneak#use_ic_scs = 1
vmap ' <Plug>SneakForward
vmap " <Plug>SneakBackward
nmap ' <Plug>SneakForward
nmap " <Plug>SneakBackward
