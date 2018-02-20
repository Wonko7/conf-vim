if v:progname =~? "evim"
  finish
endif

set nocompatible
"set guiheadroom=0  <-- neovim does not like
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup				" just use git.
set noswapfile
set history=5000			" keep 50 lines of command line history
set ruler				" show the cursor position all the time
set showcmd				" display incomplete commands

noremap <cr> <nop>


if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  autocmd GUIEnter * set vb t_vb=
  set noerrorbells
endif
set vb t_vb=
set noerrorbells


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
" check these out for bugs:
"AnsiEsc.vim
"argtextobj.vim
"hiPairs
"vim-diff-enhanced
"vim-fetch
"

set runtimepath+=",~/conf/vim/"
"
set lispwords+="go-loop"
let g:pathogen_disabled = ["rainbow_parentheses.vim", "hiPairs", "syntastic" ]

"  "poppy", "auto-pairs"]

"let g:parinfer_mode = "indent"
call pathogen#infect()
call pathogen#helptags()

let g:gitgutter_max_signs = 2000
"source /usr/share/vim/vimfiles/plugin/youcompleteme.vim
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '%%'
let g:ycm_complete_in_comments = 1
" set to 1 for clj
let g:ycm_seed_identifiers_with_syntax = 0
" this looks cool; let g:ycm_add_preview_to_completeopt = 0
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<C-h>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>', '<C-l>']
" let g:ycm_key_detailed_diagnostics = '<leader>d' # see more about this diag stuff
let g:ycm_confirm_extra_conf = 0

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

let g:clojure_maxlines = 1000
let g:clojure_special_indent_words = 'deftype,defrecord,reify,proxy,extend-type,extend-protocol,letfn,go-loop'

" lispwords let g:clojure_fuzzy_indent_patterns = ['^with', '^def', '^let']

" S-EXP

"let mapleader = ''
"let maplocalleader = ''
let mapleader="\<cr>"
let maplocalleader = "\<cr>"

let g:sexp_insert_after_wrap = 1
" most are unchanged, but keep this for reference
let g:sexp_mappings = {
			\ 'sexp_move_to_prev_top_element':  '[[',
			\ 'sexp_move_to_next_top_element':  ']]',
			\ 'sexp_select_prev_element':       '[e',
			\ 'sexp_select_next_element':       ']e',
			\ 'sexp_indent':                    '==',
			\ 'sexp_indent_top':                '=-',
			\ 'sexp_round_head_wrap_list':      '<LocalLeader>I',
			\ 'sexp_round_tail_wrap_list':      '<LocalLeader>A',
			\ 'sexp_round_head_wrap_element':   '<LocalLeader>i',
			\ 'sexp_round_tail_wrap_element':   '<LocalLeader>a',
			\ 'sexp_insert_at_list_head':       '<LocalLeader>gi',
			\ 'sexp_insert_at_list_tail':       '<LocalLeader>ga',
			\ 'sexp_square_head_wrap_list':     '<LocalLeader>#[',
			\ 'sexp_square_tail_wrap_list':     '<LocalLeader>#]',
			\ 'sexp_curly_head_wrap_list':      '<LocalLeader>#{',
			\ 'sexp_curly_tail_wrap_list':      '<LocalLeader>#}',
			\ 'sexp_square_head_wrap_element':  '<LocalLeader>[',
			\ 'sexp_square_tail_wrap_element':  '<LocalLeader>]',
			\ 'sexp_curly_head_wrap_element':   '<LocalLeader>{',
			\ 'sexp_curly_tail_wrap_element':   '<LocalLeader>}',
			\ 'sexp_splice_list':               '<LocalLeader>s',
			\ 'sexp_raise_list':                '<LocalLeader>r',
			\ 'sexp_raise_element':             '<LocalLeader>R',
			\ 'sexp_swap_list_backward':        '<LocalLeader><',
			\ 'sexp_swap_list_forward':         '<LocalLeader>>',
			\ 'sexp_swap_element_backward':     '<',
			\ 'sexp_swap_element_forward':      '>',
			\ 'sexp_emit_head_element':         '<LocalLeader>L',
			\ 'sexp_emit_tail_element':         '<LocalLeader>H',
			\ 'sexp_capture_prev_element':      '<LocalLeader>h',
			\ 'sexp_capture_next_element':      '<LocalLeader>l',
			\ }



" cljs
au BufNewFile,BufRead *.cljs set filetype=clojure


let g:hiPairs_hl_matchPair = { 'term'    : 'underline,bold',
			\                  'cterm'   : 'underline,bold',
			\                  'ctermfg' : 'NONE',
			\                  'ctermbg' : 'NONE',
			\                  'gui'     : 'bold',
			\                  'guifg'   : 'White',
			\                  'guibg'   : 'NONE' }



let g:hiPairs_hl_unmatchPair = { 'term'    : 'underline,italic',
			\                    'cterm'   : 'italic',
			\                    'ctermfg' : '15',
			\                    'ctermbg' : '12',
			\                    'gui'     : 'italic',
			\                    'guifg'   : 'White',
			\                    'guibg'   : 'Red' }



" vim -b : edit binary using xxd-format!
augroup Binary
  au!
  au BufReadPre   *.o,*.out,*.obj,*.a,*.so,*.exe,*.bin let &bin=1
  au BufReadPost  *.o,*.out,*.obj,*.a,*.so,*.exe,*.bin if &bin | %!xxd
  au BufReadPost  *.o,*.out,*.obj,*.a,*.so,*.exe,*.bin set ft=xxd | endif
  au BufWritePre  *.o,*.out,*.obj,*.a,*.so,*.exe,*.bin if &bin | %!xxd -r
  au BufWritePre  *.o,*.out,*.obj,*.a,*.so,*.exe,*.bin endif
  au BufWritePost *.o,*.out,*.obj,*.a,*.so,*.exe,*.bin if &bin | %!xxd
  au BufWritePost *.o,*.out,*.obj,*.a,*.so,*.exe,*.bin set nomod | endif
augroup END
au BufNewFile,BufRead *todo,*TODO		set ft=wtodo
au BufNewFile,BufRead *.muttrc		set ft=muttrc


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


" javascript
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_enable_es6 = 1
nmap <silent> <Space>c ?function<cr>:noh<cr><Plug>(jsdoc)
nmap <silent> <Space>C <Plug>(jsdoc)
nmap <silent> <Space>d :YcmCompleter GetDoc<CR>
nmap <silent> <Space>g :YcmCompleter GoTo<CR>
nmap <silent> <Space>a :s/\vfunction\s+([0-9a-zA-Z_]+)\s*(\(.*\))\s*\{/const \1 = \2 => {/<CR>--
nmap <silent> <Space>A :s/\vconst\s+([0-9a-zA-Z_]+)\s*\=\s*(\(.*\))\s*\=\>\s*\{/function \1\2 {/<CR>--
set indentkeys+=',.,?,<:>,&,|'

let g:javascript_plugin_jsdoc = 1
let g:AutoPairsFlyMode = 1
"let g:AutoPairsShortcutFastWrap='<C-i>' " fixme useless, i mode only
let g:AutoPairsShortcutJump='<C-n>'
"map <C-a> :call AutoPairsMoveCharacter('<')<CR>
"set cino=' h'
"set cino=j1,J1
" au Bufenter *.php set comments=sl:/*,mb:*,elx:*/

" completion
set omnifunc=syntaxcomplete#Complete

""
""" omnicompletion for cpp
""" set nocp
""" filetype plugin on
""" let OmniCpp_ShowPrototypeInAbbr = 1
""" let OmniCpp_DefaultNamespaces = ["std"]
""let OmniCpp_MayCompleteDot = 1
""let OmniCpp_MayCompleteArrow = 1
""let OmniCpp_MayCompleteScope = 1
""let OmniCpp_MayCompleteSlash = 1
" let OmniCpp_SelectFirstItem = 2
"au! CursorMoved <buffer> call YcmCompleter('GetDoc')
set previewheight=7
"au! cursormoved *js :echo "lol"


let g:ycm_path_to_python_interpreter = 'python2.7'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
"let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_semantic_triggers = { 'clojure': ['('], 'javascript': ['.'] }


"""""""" scratch
let g:scratch_insert_autohide = 0
"
" au BufWinEnter *.[ch] let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
" 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntastic checker
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers=['eslint']
let g:airline#extensions#syntastic#enabled = 0
"let g:syntastic_javascript_eslint_exe=['~/local/node-local/node_modules/eslint/bin/eslint.js']


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

" FIXME:
" replace w b e
map <silent>w <Plug>CamelCaseMotion_w
map <silent>b <Plug>CamelCaseMotion_b
map <silent>e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

omap <silent>iw <Plug>CamelCaseMotion_iw
xmap <silent>iw <Plug>CamelCaseMotion_iw
omap <silent>ib <Plug>CamelCaseMotion_ib
xmap <silent>ib <Plug>CamelCaseMotion_ib
omap <silent>ie <Plug>CamelCaseMotion_ie
xmap <silent>ie <Plug>CamelCaseMotion_ie


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

let g:airline_powerline_fonts = 1

"  " unicode symbols
"  let g:airline_symbols.linenr = '␊'
"  let g:airline_symbols.linenr = '␤'
"  let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"  let g:airline_symbols.paste = 'Þ'
"  let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'
"let g:airline_theme='solarized'
"set background=dark
"let g:airline_theme='powerlineish'
let g:airline#extensions#whitespace#trailing_format = 'WS:%s'
let g:airline#extensions#whitespace#mixed_indent_format = 'MI:%s'
let g:airline#extensions#whitespace#enabled = 0

" sneak
let g:sneak#streak = 0
let g:sneak#use_ic_scs = 1
" set clipboard=unnamedplus " this was a mistake.
let g:ctrlp_map = ''

vnoremap <C-p> "*p
vnoremap <C-y> "*y
noremap <C-p> "*p
nnoremap <C-y> "*y
"inoremap <C-p> <Esc>"*pa " interferes with completion

noremap g" "
vnoremap g" "
xmap ' <Plug>VSneakForward
nmap ' <Plug>SneakForward
xmap " <Plug>VSneakBackward
nmap " <Plug>SneakBackward

" diff
" started In Diff-Mode set diffexpr (plugin not loaded yet)
if &diff
    let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'
endif

" rainbow:
let g:poppyhigh = ["identifier", "keyword", "character", "conditional", "comment"]
au! cursormoved * call PoppyInit()
let g:poppy_point_enable = 1

" FIXME; set cino+=(0 for c.
