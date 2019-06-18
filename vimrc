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


let g:node_host_prog = '/home/wjc/.nvm/versions/node/v8.12.0/bin/neovim-node-host'

call plug#begin('~/.vim/bundle')

Plug 'altercation/vim-colors-solarized'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'jamessan/vim-gnupg'
" open/fite/at/line-number.txt:88
Plug 'kopischke/vim-fetch'
" cxiw mark word to exchange:
Plug 'tommcdo/vim-exchange'
" col align: gl<motion> or v<motions><enter>:
" used to remember place before substitute: :KeepView
Plug 'vim-scripts/anwolib'
Plug 'junegunn/vim-easy-align'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vividchalk'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-abolish'

Plug 'Yggdroot/indentLine'

"Plug 'Valloric/YouCompleteMe'
" show dumped shell escape colors as colors:
Plug 'vim-scripts/AnsiEsc.vim'
" FIXME tmp broken here: Plug 'vim-scripts/Gundo'
Plug 'lambdalisue/suda.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs' "FIXME enable globally, disable for clojure?
"Plug 'Shougo/neopairs.vim'
Plug 'vim-scripts/argtextobj.vim'
Plug 'justinmk/vim-sneak'
" FIXME: only load this for js & co:
"Plug 'bkad/CamelCaseMotion'

" buffer/file nav:
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/neomru.vim'
Plug 'airblade/vim-rooter'
"Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'kien/ctrlp.vim'
"Plug 'vim-scripts/FuzzyFinder'

"Plug 'vim-syntastic/syntastic'
Plug 'w0rp/ale'

" rainbow paren:
Plug 'luochen1990/rainbow'
"Plug 'bounceme/poppy.vim'
"Plug 'Yggdroot/hiPairs'
"Plug 'kien/rainbow_parentheses.vim'

""" nvim completion:
""Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
""Plug 'ncm2/ncm2-bufword'
""Plug 'ncm2/ncm2-tmux'
""Plug 'ncm2/ncm2-path'
""Plug 'ncm2/ncm2-tagprefix'
""Plug 'ncm2/ncm2-cssomni'
""Plug 'ncm2/ncm2-tern'
""Plug 'mhartington/nvim-typescript'
""Plug 'ncm2/ncm2-vim'

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
Plug 'udalov/kotlin-vim'
Plug 'neovimhaskell/haskell-vim'
"js:
Plug 'isRuslan/vim-es6'
Plug 'jparise/vim-graphql'
"Plug 'pangloss/vim-javascript'
"Plug 'heavenshell/vim-jsdoc'
"Plug 'othree/yajs.vim' --> see es6 companion
"Plug 'leafgarland/typescript-vim'
Plug 'leafgarland/typescript-vim'
"scala;
Plug 'derekwyatt/vim-scala'
Plug 'ensime/ensime-vim', { 'do': ':UpdateRemotePlugins' }
"clj:
"Plug 'eraserhd/parinfer-rust', {'do': 'cargo build --release'}
"Plug 'bhurlow/vim-parinfer',
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-fireplace'
" FIXME: doesn't seem useful:
"Plug 'tpope/vim-salve'
"Plug 'tpope/vim-dispatch'
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-sexp'
Plug 'wonko7/vim-sexp-mappings-for-regular-people'
Plug 'guns/vim-slamhound'
Plug 'kovisoft/paredit'
"Plug 'vim-scripts/paredit.vim'

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
let g:email	= "william@undefined.re"
let g:login_aka	= ""

" toggle cursor:
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Completion:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"set completeopt+=noinsert,noselect
"set completeopt-=preview
let g:deoplete#enable_at_startup           = 1
let g:deoplete#sources#clang#libclang_path = '/usr/lib64/llvm/7/lib64/libclang.so'
let g:SuperTabDefaultCompletionType        = "<c-n>"

if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif

" ncm2

"let g:ncm2#matcher = 'abbrfuzzy'
"" use a sorter that's more friendly for fuzzy match
"let g:ncm2#sorter = 'abbrfuzzy'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin config:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""" indent levels for spaces:

let g:indentLine_char = '▏'

""""""""""" align cols:

vmap <Enter> <Plug>(EasyAlign)
nmap gl <Plug>(EasyAlign)
nmap g= Vip:EasyAlign /[-+*~^.:!<>]\?=>\?/<cr>--
nmap g<space> Vip<cr> <cr>--
nmap g*       Vip<cr>* <cr>--
vmap =        <cr>=<cr>
vmap <space>  <cr><space><cr>

""""""""""" git

" hl for git gutter
let g:gitgutter_max_signs = 2000
highlight clear SignColumn
let g:gitgutter_map_keys = 0


""""""""""" Denite:

call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command',
      \ ['git', 'ls-files', '-co', '--exclude-standard'])
call denite#custom#option('default', 'prompt', '>')

call denite#custom#map(
      \ 'insert',
      \ '<down>',
      \ '<denite:move_to_next_line>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'insert',
      \ '<up>',
      \ '<denite:move_to_previous_line>',
      \ 'noremap')


""""""""""" rg for fzf

command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)

function! RgCurrentWord()
  let l:dir = system('cd ' . expand('%:p:h') . ' && git rev-parse --show-toplevel ' . expand('%:p') . ' | head -n 1')
  if !filereadable(l:dir)
    " FIXME: might make more sense to use pwd... try it out
    let l:dir = expand('%:p:h')
  endif
  let l:curr_word = shellescape(expand('<cword>'))
  call fzf#vim#grep('rg --column --line-number --no-heading --color=always ' . l:curr_word . ' ' . l:dir, 1, fzf#vim#with_preview('right:30%', '?'), 0)
endfunc

""""""""""" rainbow & parens:

let g:AutoPairsFlyMode = 1
"let g:AutoPairsShortcutFastWrap='<C-i>' " fixme useless, i mode only

" jump to next closing pair
"" "let b:autopairs_enabled = 1  wait what?
let g:AutoPairsShortcutJump       = '<C-n>'
let g:AutoPairsShortcutFastWrap   = '<C-w>' " ()|word -> (word)|
let g:AutoPairsShortcutBackInsert = '<C-b>' " I really wanted to insert closing paren, not jump to closing. will balance closing.
"map <C-a> :call AutoPairsMoveCharacter('<')<CR>

" see: https://github.com/luochen1990/rainbow for original conf
let g:rainbow_active = 1
let g:rainbow_conf = {
      \	'ctermfgs': ['208', '34', '39', '205'],
      \	'operators': '_,_',
      \	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
      \	'separately': {
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

let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \}

let g:ale_linters      = {
      \   'c': ['clang'],
      \   'js': ['eslint'],
      \   'javascript': ['eslint'],
      \   'clojure': ['joker'],
      \}

let g:ale_sign_error   = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_fix_on_save = 1


""""""""""" CamelCase, replace e w b:

"map <silent>w <Plug>CamelCaseMotion_w
"map <silent>b <Plug>CamelCaseMotion_b
"map <silent>e <Plug>CamelCaseMotion_e
"sunmap w
"sunmap b
"sunmap e

"omap <silent>iw <Plug>CamelCaseMotion_iw
"xmap <silent>iw <Plug>CamelCaseMotion_iw
"omap <silent>ib <Plug>CamelCaseMotion_ib
"xmap <silent>ib <Plug>CamelCaseMotion_ib
"omap <silent>ie <Plug>CamelCaseMotion_ie
"xmap <silent>ie <Plug>CamelCaseMotion_ie


""""""""""" Airline

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_powerline_fonts = 1

let g:airline_symbols.branch                            = '⎇'
let g:airline#extensions#whitespace#trailing_format     = 'WS:%s'
let g:airline#extensions#whitespace#mixed_indent_format = 'MI:%s'
let g:airline#extensions#whitespace#enabled             = 0


""""""""""" sneak

let g:sneak#streak     = 0
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

augroup fixme
  au!
  au BufNewFile,BufRead * syn match myTodo contained "\(todo\|fixme\):"
  au BufNewFile,BufRead * hi def link myTodo Todo
augroup END



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lang depended
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""" haskell:
"let g:haskell_indent_disable = 1

""""""""""" clojure:

let g:deoplete#auto_completion_start_length = 1
let g:deoplete#enable_smart_case            = 1
let g:deoplete#keyword_patterns             = {}
let g:deoplete#keyword_patterns.clojure     = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'

" jjlet g:clojure_maxlines              = 1000
" jjlet g:clojure_special_indent_words  = 'deftype,defrecord,reify,proxy,extend-type,extend-protocol,letfn,go-loop'
" jjlet g:clojure_fuzzy_indent_patterns = ['^with', '^def', '^go-loop']

let g:parinfer_mode                 = "off"
" let g:parinfer_airline_integration  = 0
" let g:parinfer_shift_norm_right_map = '<space>>'
" let g:parinfer_shift_norm_left_map  = '<space><'
" let g:parinfer_shift_vis_right_map  = 'g>'
" let g:parinfer_shift_vis_left_map   = 'g<'

"let mapleader = ''
"let maplocalleader = ''
let mapleader      = "\<cr>"
let maplocalleader = "\<cr>"
" syntax/color only:
let g:clojure_syntax_keywords = {
      \ 'clojureSpecial': ["alet", "glet", "defn-spec"]
      \ }

let g:paredit_shortmaps = 0
let g:paredit_shortmaps = 0
let g:paredit_electric_return = 0
let g:paredit_smartjump = 0
let g:paredit_matchlines = 100
let g:paredit_leader = 'gaoeuaoeu'

let g:clojure_fuzzy_indent = 1
let g:clojure_fuzzy_indent_patterns = ['^with', '^def',  '^match', '^let', '^glet', '^alet', '^go-loop', '^create-table', '^select', '^update', '^insert', '^delete', '^defn-spec']

let g:sexp_enable_insert_mode_mappings = 0
let g:sexp_insert_after_wrap = 1

" might keep this everywhere? otherwise add to augroup and add <buffer>
"map <silent> \| :let old = @/<cr>/[([{]/<cr>:call histdel('/', -1)<cr>--:let @/ = old<cr>
"map <silent> & :let old = @/<cr>?[([{]<cr>:call histdel('/', -1)<cr>--:let @/ = old<cr>

map <silent> & :let old = @/<cr>/[([{]/<cr>:call histdel('/', -1)<cr>--:let @/ = old<cr>
map <silent> é :let old = @/<cr>?[([{]<cr>:call histdel('/', -1)<cr>--:let @/ = old<cr>

" align % on space.. omg... this got out of hand real fast:
"nmap gL :ParinferOff<cr>i<cr>;;<cr><esc>k^d0j=%%v%:EasyAlign v/\v^\s{5,}/<cr>1 kddk:ParinferToggleMode<cr>:ParinferToggleMode<cr>J=%
"  jjnmap gL :ParinferOff<cr>i<cr>;;<cr><esc>k^d0j=%%v%:EasyAlign v/\v^\s{5,}/<cr>1 kddkJ=%:ParinferOn<cr>
nmap gl i<cr>;;<cr><esc>k^d0j=%%v%:EasyAlign v/\v^\s{5,}/<cr>1 kddkJ=%

nmap gH :let old = @/<cr>?:require<cr>^%i<cr><esc>mr%jml/\v\s*;;\s*$<cr>kV`l:sort<cr>njV`rk:sort<cr>V)<cr><space>kJ:call histdel('/', -1)<cr>--:let @/ = old<cr>
map <c-g> <Plug>FireplaceDjump

" FIXME: should I?? if this sticks put it in mappings.
map gj :let old = @/<cr>:s/\s*\n\s*//<cr>:call histdel('/', -1)<cr>:let @/ = old<cr>--
" FIXME broken with dot, sigh:

function! MyPiggie()
  Connect nrepl://localhost:9999
  Piggieback :main
endfunction
" cljs
augroup Clau!
  "au BufNewFile,BufRead *.cljs,*cljx set filetype=clojure
  " this is tmp until parinfer fixes slurping:
  au FileType clojure noremap <buffer> <Right> >>
  au FileType clojure noremap <buffer> <Left> <<
  " FIXME: might use this everywher:
  "au FileType clojure noremap <buffer> J :let old = @/<cr>s/\s*\n\s*//<cr>:call histdel('/', -1)<cr>:let @/ = old<cr>--
  "au BufNewFile,BufRead *.cljs,*cljx,*clj "map cP [[cpp
  " FIXME easy solution for shadow:
  "au BufNewFile,BufRead *.cljs,*cljx,*clj silent :Connect nrepl://localhost:9999
  "au BufNewFile,BufRead *.cljs,*cljx,*clj silent :Piggieback :main
  au FileType clojure let b:AutoPairs = {'(':')', '[':']', '{':'}', '"':'"'}
  "au BufNewFile,BufRead *.cljs,*cljx,*clj \
  "  au TextChanged * call sexp#indent(0, v:count)
augroup END


""""""""""" scala

augroup Scala
  au!
  au BufWritePost *.scala silent :EnTypeCheck
  au FileType scala nnoremap <buffer> <cr>d :EnDeclaration<CR>
  au FileType scala nnoremap <buffer> <cr>t :EnType<CR>
  au FileType scala nnoremap <buffer> <cr>C :EnTypeCheck<CR>
augroup END

let g:deoplete#sources                   = {}
let g:deoplete#sources.scala             = ['buffer', 'tags', 'omni']
let g:deoplete#omni#input_patterns       = {}
let g:deoplete#omni#input_patterns.scala = [
  \ '[^. *\t]\.\w*',
  \ '[:\[,] ?\w*',
  \ '^import .*'
  \]

""""""""""" perl

let perl_include_POD          = 1
let perl_extended_vars        = 1

let bash_is_sh                = 1
let highlight_balanced_quotes = 1
let highlight_function_name   = 1


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
"set indentkeys+=',.,?,<:>,&,|'
let g:javascript_plugin_jsdoc = 1
let g:jsdoc_allow_input_prompt = 1
" for ul coding style:
let g:javascript_opfirst = '\C\%([<>=,?^%|/&]\|\([-:+]\)\1\@!\|\*\+\|!=\|in\%(stanceof\)\=\>\)'
                            "'\C\%([<>=,.?^%|/&]\|\([-:+]\)\1\@!\|\*\+\|!=\|in\%(stanceof\)\=\>\)'

"augroup javascript
"        au!
"        call AutoPairsToggle()
"        call AutoPairsToggle()
"        "autocmd FileType javascript syntax clear jsFuncBlock
"        "autocmd FileType javascript set cino=(0,W2
"augroup END

"Add extra filetypes
let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue',
                \ ]
let g:deoplete#sources#ternjs#case_insensitive      = 1
" maybe:
let g:deoplete#sources#ternjs#docs                  = 1
let g:deoplete#sources#ternjs#types                 = 1
let g:deoplete#sources#ternjs#filter                = 0
let g:deoplete#sources#ternjs#include_keywords      = 1
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

"source ~/.vim/fzf_cscope.vim
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
