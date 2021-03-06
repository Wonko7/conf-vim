set nocompatible
set backspace=indent,eol,start
set nobackup				" just use git.
set noswapfile
set history=5000			" keep 50 lines of command line history
set ruler				" show the cursor position all the time
set showcmd				" display incomplete commands
set showtabline=0
set runtimepath+=",~/conf/vim/"
set lazyredraw
set conceallevel=0

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


"let g:node_host_prog = '/home/wjc/.nvm/versions/node/v8.12.0/bin/neovim-node-host'

call plug#begin('~/.vim/bundle')

" LSP
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }

Plug 'altercation/vim-colors-solarized'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'jamessan/vim-gnupg' , { 'branch': 'main' }
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
Plug 'vim-scripts/Gundo'

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
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
Plug 'lotabout/skim.vim'

Plug 'Shougo/denite.nvim'
Plug 'neoclide/denite-extra'
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
""Plug 'roxma/nvim-yarp'
""Plug 'roxma/vim-hug-neovim-rpc'
""Plug 'ncm2/ncm2-bufword'
""Plug 'ncm2/ncm2-tmux'
""Plug 'ncm2/ncm2-path'
""Plug 'ncm2/ncm2-tagprefix'
""Plug 'ncm2/ncm2-cssomni'
""Plug 'ncm2/ncm2-tern'
""Plug 'mhartington/nvim-typescript'
""Plug 'ncm2/ncm2-vim'

"deoplete:
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
""  Plug 'zchee/deoplete-clang'
""  Plug 'zchee/deoplete-go'
""  Plug 'zchee/deoplete-jedi'
"Plug 'zchee/deoplete-zsh'
""  Plug 'sebastianmarkow/deoplete-rust'
"" FIXME: not actually used by deoplete look into this!
Plug 'SevereOverfl0w/async-clj-omni'
""  Plug 'slashmili/alchemist.vim'
""  Plug 'eagletmt/neco-ghc'
""  Plug 'carlitux/deoplete-ternjs'

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
"rust
Plug 'rust-lang/rust.vim'
"clj:
"Plug 'eraserhd/parinfer-rust', {'do': 'cargo build --release'}
"Plug 'bhurlow/vim-parinfer',
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-fireplace'
" FIXME: doesn't seem useful:
"Plug 'tpope/vim-salve'
"Plug 'tpope/vim-dispatch'
Plug 'guns/vim-clojure-static'
Plug 'wonko7/vim-sexp-mappings-for-regular-people'
Plug 'guns/vim-sexp'
" FIXME: https://github.com/kovisoft/paredit/issues/25
"Plug 'kovisoft/paredit'
Plug 'Wonko7/paredit'
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
"let g:deoplete#enable_at_startup           = 1
"let g:deoplete#sources#clang#libclang_path = '/usr/lib64/llvm/7/lib64/libclang.so'
let g:SuperTabDefaultCompletionType        = "<c-n>"

"if !exists('g:deoplete#omni#input_patterns')
  "let g:deoplete#omni#input_patterns = {}
"endif
" call deoplete#custom#option('sources', {
"       \ '_': ['ale'],
"       \})
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
nmap g= Vip:EasyAlign /[-+*~^.:!<>]\?=>\?/<cr>--
nmap g<space> Vip<cr> <cr>--
nmap g*       Vip<cr>* <cr>--
vmap =        <cr>=<cr>
vmap <space>  <cr><space><cr>
vmap *<space>  <cr>*<space><cr>

""""""""""" git

" hl for git gutter
let g:gitgutter_max_signs = 2000
highlight clear SignColumn
let g:gitgutter_map_keys = 0

augroup fugitive
  au! BufReadPost fugitive://* set bufhidden=delete
augroup END


""""""""""" Denite:

call denite#custom#option('default', { 'start_filter': 1})
call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command',
      \ ['git', 'ls-files', '-co', '--exclude-standard'])
call denite#custom#option('default', 'prompt', '>')

let s:denite_options = {
      \ 'prompt' : '>',
      \ 'split': 'floating',
      \ 'start_filter': 1,
      \ 'auto_resize': 1,
      \ 'source_names': 'short',
      \ 'direction': 'botright',
      \ 'highlight_filter_background': 'CursorLine',
      \ 'highlight_matched_char': 'Type',
      \ }

" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings()
  nnoremap <silent><buffer><expr> <CR>
        \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
        \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
        \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
        \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
        \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
        \ denite#do_map('toggle_select').'j'
  nnoremap <silent><buffer><expr> <up>
        \ denite#do_map('move_to_previous_line')
  nnoremap <silent><buffer><expr> <down>
        \ denite#do_map('move_to_next_line')
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <tab> <Plug>(denite_filter_quit)
  inoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
  inoremap <silent><buffer><expr> <c-v>
        \ denite#do_map('do_action', 'vsplit')
  inoremap <silent><buffer><expr> <esc>
        \ denite#do_map('quit')
  inoremap <silent><buffer> <down>
        \ <Esc><C-w>p:call cursor(line('.')+1,0)<CR><C-w>pA
  inoremap <silent><buffer> <up>
        \ <Esc><C-w>p:call cursor(line('.')-1,0)<CR><C-w>pA
  inoremap <silent><buffer> <C-j>
        \ <Esc><C-w>p:call cursor(line('.')+1,0)<CR><C-w>pA
  inoremap <silent><buffer> <C-k>
        \ <Esc><C-w>p:call cursor(line('.')-1,0)<CR><C-w>pA
endfunction


""""""""""" rg for fzf

"let g:skim_layout = { 'window': 'call FloatingFZF()' }
"command! -bang -nargs=* Rg call fzf#vim#rg_interactive(<q-args>, fzf#vim#with_preview('right:50%:hidden', 'alt-h'))

command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%', '?'),
      \   <bang>0)

function! RgCurrentWord()
  let l:curr_word = shellescape(expand('<cword>'))
  "call fzf#vim#grep('rg --column --line-number --no-heading --color=always ' . l:curr_word . ' ' . l:dir, 1, fzf#vim#with_preview('right:30%', '?'), 0)
  call fzf#vim#grep('rg --column --line-number --no-heading --color=always ' . l:curr_word, 1, fzf#vim#with_preview('right:50%', '?'), 0)
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
      \ 'c':          ['clang'],
      \ 'js':         ['eslint'],
      \ 'javascript': ['eslint'],
      \ 'clojure':    ['joker'],
      \}


let g:ale_sign_error         = '✘'
let g:ale_sign_warning       = '⚠'
let g:ale_fix_on_save        = 1
let g:ale_completion_enabled = 1

""""""""""" LSP:
let g:LanguageClient_settingsPath=".lsp/settings.json"
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'clojure': ['bash', '-c', '~/local/bin/clojure-lsp'],
    \ }

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
let g:airline#extensions#whitespace#enabled             = 0
let g:airline_detect_spell=0
"let g:airline_inactive_alt_sep=1
let g:airline_mode_map = {
      \ '__'     : '-',
      \ 'c'      : 'C',
      \ 'i'      : 'I',
      \ 'ic'     : 'I',
      \ 'ix'     : 'I',
      \ 'n'      : 'N',
      \ 'multi'  : 'M',
      \ 'ni'     : 'N',
      \ 'no'     : 'N',
      \ 'R'      : 'R',
      \ 'Rv'     : 'R',
      \ 's'      : 'S',
      \ 'S'      : 'S',
      \ ''     : 'S',
      \ 't'      : 'T',
      \ 'v'      : 'V',
      \ 'V'      : 'V',
      \ ''     : 'V',
      \ }
"let g:airline#extensions#branch#enabled=0
let g:airline_section_b = ''
let g:airline_section_z = '%3p%% %3l/%L:%3v'
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'


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

"let g:deoplete#auto_completion_start_length = 1
"let g:deoplete#enable_smart_case            = 1
"" "let g:deoplete#keyword_patterns             = {}
"" "let g:deoplete#keyword_patterns.clojure     = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'

" jjlet g:clojure_maxlines              = 1000
" jjlet g:clojure_special_indent_words  = 'deftype,defrecord,reify,proxy,extend-type,extend-protocol,letfn,go-loop'
" jjlet g:clojure_fuzzy_indent_patterns = ['^with', '^def', '^go-loop']

"let g:parinfer_mode                 = "off"
" let g:parinfer_airline_integration  = 0
" let g:parinfer_shift_norm_right_map = '<space>>'
" let g:parinfer_shift_norm_left_map  = '<space><'
" let g:parinfer_shift_vis_right_map  = 'g>'
" let g:parinfer_shift_vis_left_map   = 'g<'

"let mapleader = ''
"let maplocalleader = ''
let mapleader      = "\\"

" syntax/color only:
let g:clojure_syntax_keywords = {
      \ 'clojureSpecial': ["defn-spec"]
      \ }

"let g:paredit_mode = 0
let g:paredit_shortmaps = 0
let g:paredit_shortmaps = 0
let g:paredit_electric_return = 0
let g:paredit_smartjump = 0
let g:paredit_matchlines = 100
let g:paredit_leader = '<enter>'
let mapleader      = "\<cr>"
let maplocalleader = "\<cr>"


let g:clojure_maxlines = 1000
let g:clojure_fuzzy_indent = 1
let g:clojure_fuzzy_indent_patterns = ['^with', '^def',  '^match', '^let', '^glet', '^alet', '^go-loop', '^create-table', '^alter-table', '^select', '^update', '^insert', '^delete', '^defn-spec', '^async', '^if-*', '^when-*', '^recursive-path']

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

nmap gH :let old = @/<cr>gg/:require<cr>^%i<cr><esc>mr%jml/\v\s*;;\s*$<cr>kV`l:sort<cr>njV`rk:sort<cr>V)<cr><space>kJ:call histdel('/', -1)<cr>--:let @/ = old<cr>
map <c-g> <Plug>FireplaceDjump

" FIXME: should I?? if this sticks put it in mappings.
map gj :let old = @/<cr>:s/\s*\n\s*//<cr>:call histdel('/', -1)<cr>:let @/ = old<cr>--

function! MyPiggie()
  Connect nrepl://localhost:9999
  Piggieback :main
  "Piggieback :app
endfunction
" cljs

function! Expand(exp) abort
    let l:result = expand(a:exp)
    return l:result ==# '' ? '' : "file://" . l:result
endfunction

augroup Clojure
  " this is tmp until parinfer fixes slurping:
  au FileType clojure noremap <buffer> <Right> >>
  au FileType clojure noremap <buffer> <Left> <<
  au FileType clojure let b:AutoPairs = {'(':')', '[':']', '{':'}', '"':'"'}

  nnoremap <silent> crcc :call LanguageClient#workspace_executeCommand('cycle-coll', [Expand('%:p'), line('.') - 1, col('.') - 1])<CR>
  nnoremap <silent> crth :call LanguageClient#workspace_executeCommand('thread-first', [Expand('%:p'), line('.') - 1, col('.') - 1])<CR>
  nnoremap <silent> crtt :call LanguageClient#workspace_executeCommand('thread-last', [Expand('%:p'), line('.') - 1, col('.') - 1])<CR>
  nnoremap <silent> crtf :call LanguageClient#workspace_executeCommand('thread-first-all', [Expand('%:p'), line('.') - 1, col('.') - 1])<CR>
  nnoremap <silent> crtl :call LanguageClient#workspace_executeCommand('thread-last-all', [Expand('%:p'), line('.') - 1, col('.') - 1])<CR>
  nnoremap <silent> crml :call LanguageClient#workspace_executeCommand('move-to-let', [Expand('%:p'), line('.') - 1, col('.') - 1, input('Binding name: ')])<CR>
  nnoremap <silent> cril :call LanguageClient#workspace_executeCommand('introduce-let', [Expand('%:p'), line('.') - 1, col('.') - 1, input('Binding name: ')])<CR>
  nnoremap <silent> crel :call LanguageClient#workspace_executeCommand('expand-let', [Expand('%:p'), line('.') - 1, col('.') - 1])<CR>
  nnoremap <silent> cram :call LanguageClient#workspace_executeCommand('add-missing-libspec', [Expand('%:p'), line('.') - 1, col('.') - 1])<CR>

  " √ 	add-missing-libspec
  " - 	clean-ns
  " √ 	cycle-coll
  " √ 	cycle-privacy
  " √ 	expand-let
  " √ 	extract-function 	[document-uri, line, column, function-name]
  " √ 	inline-symbol
  " √ 	introduce-let 	[document-uri, line, column, binding-name]
  " √ 	move-to-let 	[document-uri, line, column, binding-name]
  " √ 	thread-first
  " √ 	thread-first-all
  " √ 	thread-last
  " √ 	thread-last-all
  " √ 	unwind-all
  " √ 	unwind-thread
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
"let g:deoplete#sources#ternjs#filetypes = [
"                \ 'jsx',
"                \ 'javascript.jsx',
"                \ 'vue',
"                \ ]
"let g:deoplete#sources#ternjs#case_insensitive      = 1
"" maybe:
"let g:deoplete#sources#ternjs#docs                  = 1
"let g:deoplete#sources#ternjs#types                 = 1
"let g:deoplete#sources#ternjs#filter                = 0
"let g:deoplete#sources#ternjs#include_keywords      = 1
"let g:deoplete#sources#ternjs#omit_object_prototype = 0
"

""""""""""" gitcommit:

augroup gitcom
  au!
  autocmd FileType gitcommit setlocal spell
augroup END


""""""""""" HEX/Binary: vim -b : edit binary using xxd-format!

"augroup Binary
"  au!
"  au BufReadPre   *.o,*.out,*.obj,*.a,*.so,*.exe,*.bin let &bin=1
"  au BufReadPost  *.o,*.out,*.obj,*.a,*.so,*.exe,*.bin if &bin | %!xxd
"  au BufReadPost  *.o,*.out,*.obj,*.a,*.so,*.exe,*.bin set ft=xxd | endif
"  au BufWritePre  *.o,*.out,*.obj,*.a,*.so,*.exe,*.bin if &bin | %!xxd -r
"  au BufWritePre  *.o,*.out,*.obj,*.a,*.so,*.exe,*.bin endif
"  au BufWritePost *.o,*.out,*.obj,*.a,*.so,*.exe,*.bin if &bin | %!xxd
"  au BufWritePost *.o,*.out,*.obj,*.a,*.so,*.exe,*.bin set nomod | endif
"augroup END

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
silent call My_set_spell()

"a set updatetime=2000
"a augroup snipe_cursor
"a   autocmd!
"a   autocmd CursorHold   * call MyUnSetCursor()
"a   autocmd CursorMoved  * call MySetCursor()
"a   autocmd CursorMovedI * call MyUnSetCursor()
"a augroup END
