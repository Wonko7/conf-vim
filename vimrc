set nocompatible
set backspace=indent,eol,start
set nobackup				" just use git.
set noswapfile
set history=5000			" keep 50 lines of command line history
set ruler				" show the cursor position all the time
set showcmd				" display incomplete commands
set showtabline=0
set runtimepath+=",~/conf/vim/"

if &t_Co > 2 || has("gui_running")
	syntax on
	set hlsearch
	autocmd GUIEnter * set vb t_vb=
	set noerrorbells
endif

set vb t_vb=
set noerrorbells


" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
if has("autocmd")
	filetype plugin indent on
	augroup vimrcEx
		au!
		autocmd BufReadPost *
					\ if line("'\"") > 0 && line("'\"") <= line("$") |
					\   exe "normal g`\"" |
					\ endif
	augroup END
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/bundle')

Plug 'altercation/vim-colors-solarized'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'jamessan/vim-gnupg'
" open/fite/at/line-number.txt:88
Plug 'kopischke/vim-fetch'
" cxiw mark word to exchange:
Plug 'tommcdo/vim-exchange'
" col align: gl<motion> or v<motions><enter>:
Plug 'junegunn/vim-easy-align'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vividchalk'
"Plug 'Valloric/YouCompleteMe'
" show dumped shell escape colors as colors:
Plug 'vim-scripts/AnsiEsc.vim'
Plug 'vim-scripts/Gundo'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-scripts/argtextobj.vim'
Plug 'justinmk/vim-sneak'
Plug 'bkad/CamelCaseMotion'

" buffer/file nav:
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'kien/ctrlp.vim'
"Plug 'vim-scripts/FuzzyFinder'

"Plug 'vim-syntastic/syntastic'
Plug 'w0rp/ale'

" rainbow paren:
Plug 'luochen1990/rainbow'
"Plug 'bounceme/poppy.vim'
"Plug 'Yggdroot/hiPairs'
"Plug 'kien/rainbow_parentheses.vim'

"deoplete:
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-clang'
Plug 'zchee/deoplete-go'
Plug 'zchee/deoplete-jedi'
Plug 'zchee/deoplete-zsh'
Plug 'sebastianmarkow/deoplete-rust'
Plug 'SevereOverfl0w/async-clj-omni'
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neco-vim'
Plug 'slashmili/alchemist.vim'
Plug 'eagletmt/neco-ghc'
Plug 'carlitux/deoplete-ternjs'

"lang specific:
Plug 'elixir-editors/vim-elixir'
Plug 'jrk/vim-ocaml'
Plug 'mrtazz/DoxygenToolkit.vim'
"js:
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
"scala;
Plug 'derekwyatt/vim-scala'
Plug 'ensime/ensime-vim', { 'do': ':UpdateRemotePlugins' }
"Plug 'heavenshell/vim-jsdoc'
"clj:
Plug 'clojure-vim/nvim-parinfer.js', { 'do': 'npm install neovim' } " also :UpdateRemotePlugins
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-fireplace'
" FIXME: doesn't seem useful:
"Plug 'tpope/vim-salve'
"Plug 'tpope/vim-dispatch'
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-sexp'
Plug 'guns/vim-slamhound'

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General stuff:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set background=dark
let g:solarized_contrast = 'normal'
colorscheme solarized

set scrolloff=2
set wildmode=longest,list
set viminfo='1000,f1,:500,/500,<50,s10,h

set nowrap
set wildignore=*.o,*.obj,*.bak,*.exe,*~
"set lz " do not redraw while running macros (much faster) (LazyRedraw)
set hid " you can change buffer without saving
set number
set fileencoding=utf8
set encoding=utf8
set previewheight=7

filetype indent on

" SEARCH
set incsearch				" do incremental searching
set ignorecase
set smartcase
set nowrapscan
"set listchars+=trail:_,tab:I. " FIXME; for now, remove tab display

" for file comment headers:
" plugin configuration, user info
let g:login	= "William Caldwell"
let g:email	= "William@undefined.re"
let g:login_aka	= ""

" toggle cursor:
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Completion:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"set completeopt+=noinsert,noselect
"set completeopt-=preview
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = '/usr/lib64/llvm/5/lib64/libclang.so'
let g:SuperTabDefaultCompletionType = "<c-n>"

if !exists('g:deoplete#omni#input_patterns')
	let g:deoplete#omni#input_patterns = {}
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin config:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" align cols:

vmap <Enter> <Plug>(EasyAlign)
nmap gl <Plug>(EasyAlign)
"nmap g= Vip:EasyAlign /\v([-+^*~!<>]?=)/<cr>--
nmap g= Vip:EasyAlign /[-+*~^.:!<>]\?=>\?/<cr>--

" align % on space.. omg... this got out of hand real fast:
nmap gL :ParinferOff<cr>i<cr>;;<cr><esc>k^d0j=%%v%:EasyAlign v/\v^\s{5,}/<cr>1 kddk:ParinferToggleMode<cr>:ParinferToggleMode<cr>J=%
" nmap gL i<CR><Esc>d0=%%v%:LiveEasyAlign v/\v^\s{2,}/<cr> <cr>kJ=%
" nmap gL i<CR><Esc>d0=%%v%<cr>1 kJ=%

""""""""""" git

" hl for git gutter
let g:gitgutter_max_signs = 2000
highlight clear SignColumn


""""""""""" rg for fzf

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)


""""""""""" rainbow & parens:

let g:AutoPairsFlyMode = 1
"let g:AutoPairsShortcutFastWrap='<C-i>' " fixme useless, i mode only

" jump to next closing pair
let g:AutoPairsShortcutJump='<C-n>'
let g:AutoPairsShortcutFastWrap='<C-w>' " ()|word -> (word)|
let g:AutoPairsShortcutBackInsert='<C-b>' " I really wanted to insert closing paren, not jump to closing. will balance closing.

"map <C-a> :call AutoPairsMoveCharacter('<')<CR>

" see: https://github.com/luochen1990/rainbow for original conf
let g:rainbow_active = 1
let g:rainbow_conf = {
			\	'ctermfgs': ['208', '34', '39', '205'],
			\	'operators': '_,_',
			\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
			\	'separately': {
			\		'*': {},
			\		'tex': {
			\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
			\		},
			\		'vim': {
			\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
			\		},
			\		'html': {
			\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
			\		},
			\		'css': 0,
			\	}
			\}


""""""""""" LINT: Disable other C linters, too slow:

let g:ale_linters = {
			\   'c': ['clang'],
			\}
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'


""""""""""" CamelCase, replace e w b:

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


""""""""""" Airline

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline_powerline_fonts = 1

let g:airline_symbols.branch = '⎇'
let g:airline#extensions#whitespace#trailing_format = 'WS:%s'
let g:airline#extensions#whitespace#mixed_indent_format = 'MI:%s'
let g:airline#extensions#whitespace#enabled = 0


""""""""""" sneak

let g:sneak#streak = 0
let g:sneak#use_ic_scs = 1

noremap g" "
vnoremap g" "
xmap ' <Plug>VSneakForward
nmap ' <Plug>SneakForward
xmap " <Plug>VSneakBackward
nmap " <Plug>SneakBackward


""""""""""" Cscope:

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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax keyword Comment SAFE_CALL
syntax keyword cTodo contained TODO FIXME XXX todo fixme xxx


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lang depended
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""" clojure:

let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'

let g:clojure_maxlines = 1000
let g:clojure_special_indent_words = 'deftype,defrecord,reify,proxy,extend-type,extend-protocol,letfn,go-loop'
let g:clojure_fuzzy_indent_patterns = ['^with', '^def', '^go-loop']

let g:parinfer_mode = "paren"
let g:parinfer_airline_integration = 0
let g:parinfer_shift_norm_right_map = '<space>>'
let g:parinfer_shift_norm_left_map = '<space><'
let g:parinfer_shift_vis_right_map = 'g>'
let g:parinfer_shift_vis_left_map = 'g<'

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
augroup Clojure
	au!
	au BufNewFile,BufRead *.cljs set filetype=clojure
augroup END


""""""""""" scala

augroup Scala
	au!
	au BufWritePost *.scala silent :EnTypeCheck
	au FileType scala nnoremap <cr>d :EnDeclaration<CR>
	au FileType scala nnoremap <cr>t :EnType<CR>
	au FileType scala nnoremap <cr>C :EnTypeCheck<CR>
augroup END

let g:deoplete#sources = {}
let g:deoplete#sources.scala = ['buffer', 'tags', 'omni']
let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#input_patterns.scala = [
  \ '[^. *\t]\.\w*',
  \ '[:\[,] ?\w*',
  \ '^import .*'
  \]

""""""""""" perl

let perl_include_POD=1
let perl_extended_vars=1

let bash_is_sh=1
let highlight_balanced_quotes = 1
let highlight_function_name = 1


""""""""""" python:

augroup Python
	au!
	autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
	"autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
augroup END


""""""""""" latex:

augroup Latex
	au!
	autocmd BufRead *.tex set makeprg=texi2pdf\ '%'
	autocmd BufRead *.tex set autoindent
augroup END


""""""""""" javascript

nmap <silent> <Space>c ?function<cr>:noh<cr><Plug>(jsdoc)
nmap <silent> <Space>C <Plug>(jsdoc)
"nmap <silent> <Space>d :YcmCompleter GetDoc<CR>
"nmap <silent> <Space>g :YcmCompleter GoTo<CR>
nmap <silent> <Space>a :s/\vfunction\s+([0-9a-zA-Z_]+)\s*(\(.*\))\s*\{/const \1 = \2 => {/<CR>--
nmap <silent> <Space>A :s/\vconst\s+([0-9a-zA-Z_]+)\s*\=\s*(\(.*\))\s*\=\>\s*\{/function \1\2 {/<CR>--
set indentkeys+=',.,?,<:>,&,|'
let g:javascript_plugin_jsdoc = 1

"Add extra filetypes
let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue',
                \ ]
let g:deoplete#sources#ternjs#case_insensitive = 1
" maybe:
let g:deoplete#sources#ternjs#docs = 1
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#filter = 0
let g:deoplete#sources#ternjs#include_keywords = 1
let g:deoplete#sources#ternjs#omit_object_prototype = 0


""""""""""" HEX/Binary: vim -b : edit binary using xxd-format!

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


""""""""""" diff

" started In Diff-Mode set diffexpr (plugin not loaded yet)
if &diff
	let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sub conf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

source ~/.vim/mappings.vim
source ~/.vim/headers.vim
source ~/.vim/fun.vim

" init indentation:
silent call My_set_style()

set updatetime=2000
augroup snipe_cursor
	autocmd!
	autocmd CursorHold * call MyUnSetCursor()
	autocmd CursorMoved * call MySetCursor()
	autocmd CursorMovedI * call MyUnSetCursor()
augroup END
