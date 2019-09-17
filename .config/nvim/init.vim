" Load plugins

call plug#begin('~/.config/nvim/plugged')
	Plug 'dylanaraps/wal.vim'
	Plug 'jiangmiao/auto-pairs'
	Plug 'tpope/vim-sensible'
	Plug 'artur-shaik/vim-javacomplete2'
	Plug 'neomake/neomake'
	Plug 'Yggdroot/indentLine'
"	Plug 'airblade/vim-gitgutter'
"	Plug 'alvan/vim-closetag'
	Plug 'lervag/vimtex'
	Plug 'simnalamburt/vim-mundo'
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
set encoding=utf-8
set clipboard+=unnamedplus
set mouse=a
set scrolloff=3

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

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_python_checkers = ['pylint']

" autocompletion

let g:deoplete#enable_at_startup = 1
set omnifunc=syntaxcomplete#Complete

let g:deoplete#enable_at_startup = 1
let g:deoplete#omni_patterns = {}
let g:deoplete#auto_completion_start_length = 2
let g:deoplete#sources = {}
let g:deoplete#sources._ = []
let g:deoplete#file#enable_buffer_path = 1
if !exists('g:deoplete#omni#input_patterns')
	let g:deoplete#omni#input_patterns = {}
endif

" Java
autocmd FileType java setlocal omnifunc=javacomplete#Complete
let g:deoplete#omni_patterns.java = '[^. *\t]\.\w*'

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
let g:deoplete#omni#input_patterns.tex=g:vimtex#re#deoplete
autocmd FileType tex setlocal tabstop=4
autocmd FileType tex setlocal shiftwidth=4
autocmd FileType tex setlocal expandtab
autocmd FileType tex VimtexCompile
autocmd FileType tex IndentLinesDisable


