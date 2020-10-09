" Load plugins

call plug#begin('~/.config/nvim/plugged')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'zchee/deoplete-clang'
	Plug 'dylanaraps/wal.vim'
	Plug 'jiangmiao/auto-pairs'
	Plug 'tpope/vim-sensible'
	Plug 'artur-shaik/vim-javacomplete2'
	Plug 'neomake/neomake'
	Plug 'Yggdroot/indentLine'
	Plug 'airblade/vim-gitgutter'
	Plug 'alvan/vim-closetag'
	Plug 'lervag/vimtex'
	Plug 'simnalamburt/vim-mundo'
	Plug 'dusans/vim-hardmode'
	Plug 'deoplete-plugins/deoplete-jedi'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'rhysd/vim-grammarous'
	Plug 'sebastianmarkow/deoplete-rust'
	Plug 'goerz/jupytext.vim'
	Plug 'autozimu/LanguageClient-neovim', {
	\ 'branch': 'next',
	\ 'do': 'bash install.sh',
	\ }
	"Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
call plug#end()

" theming and sensible settings

syntax on
colorscheme wal
filetype plugin indent on
set number
set relativenumber
set list
set tabstop=4
set shiftwidth=4
set expandtab
set encoding=utf-8
set clipboard+=unnamedplus
set mouse=a
set scrolloff=3
set hidden
set signcolumn=yes
highlight Comment cterm=italic

" Hardmode because I hate myself
let g:HardMode_level='wannabe'
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" remove trailing whitespace on write
autocmd BufWritePre * %s/\s\+$//e

" Folds

set foldmethod=indent " fold based on indent level
map zz zA
autocmd BufReadPost,FileReadPost * :normal zR " unfold by default


" Remember last position in file

if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" w/q aliases

cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" History

set history=200 " Keep 200 lines of command line history
set undofile " Enable persistent history storage
set undodir=~/.config/nvim/undo " Store undofiles in a centralized folder
set backup " Enable backups
set backupdir=~/.config/nvim/backup " Store backups in a centralized folder
set writebackup

" Airline

let g:airline_theme='term'
let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

" syntax checking

call neomake#configure#automake('nrw', 500)

" autocompletion

let g:deoplete#enable_at_startup = 1
set omnifunc=syntaxcomplete#Complete

let g:deoplete#enable_at_startup = 1
let g:deoplete#omni_patterns = {}
let g:deoplete#auto_completion_start_length = 2
" let g:deoplete#sources = {}
" let g:deoplete#sources._ = []
" let g:deoplete#file#enable_buffer_path = 1
"if !exists('g:deoplete#omni#input_patterns')
"	let g:deoplete#omni#input_patterns = {}
"endif

" Map expression when a tab is hit:
"           checks if the completion popup is visible
"           if yes
"               then it cycles to next item
"           else
"               if expandable_or_jumpable
"                   then expands_or_jumps
"                   else returns a normal TAB
"
imap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" LanguageClient
let g:LanguageClient_serverCommands = {
	\ 'erlang': ['/usr/bin/erlang_ls'],
	\}

" Java
" autocmd FileType java setlocal omnifunc=javacomplete#Complete
" let g:deoplete#omni_patterns.java = '[^. *\t]\.\w*'

autocmd FileType java setlocal tabstop=4
autocmd FileType java setlocal shiftwidth=4
autocmd FileType java setlocal expandtab


" Assembly
autocmd FileType asm setlocal tabstop=8
autocmd FileType asm setlocal shiftwidth=8

" C
autocmd FileType c setlocal tabstop=4
autocmd FileType c setlocal shiftwidth=4
autocmd FileType c setlocal expandtab
autocmd BufEnter,BufRead,BufNewFile *.h setfiletype c

" Markdown

autocmd FileType markdown setlocal tabstop=4
autocmd FileType markdown setlocal shiftwidth=4
autocmd FileType markdown setlocal spell

" Text

autocmd FileType text setlocal tabstop=4
autocmd FileType text setlocal shiftwidth=4
autocmd FileType text setlocal spell


" LaTeX

let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_open_on_warning=0
let g:vimtex_compiler_progname='nvr'
let g:tex_flavor="latex"
" let g:deoplete#omni#input_patterns.tex=g:vimtex#re#deoplete
autocmd FileType tex setlocal tabstop=4
autocmd FileType tex setlocal shiftwidth=4
autocmd FileType tex setlocal expandtab
autocmd FileType tex VimtexCompile
autocmd FileType tex IndentLinesDisable
autocmd FileType tex setlocal spell

" Rust

let g:deoplete#sources#rust#racer_binary='/usr/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/usr/share/rust/src'

" Erlang
autocmd FileType erlang setlocal tabstop=2
autocmd FileType erlang setlocal shiftwidth=2
autocmd FileType erlang setlocal expandtab

