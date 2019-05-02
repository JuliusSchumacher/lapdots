" Load plugins

call plug#begin('~/.config/nvim/plugged')
	Plug 'dylanaraps/wal.vim'
	Plug 'jiangmiao/auto-pairs'
	Plug 'tpope/vim-sensible'
	Plug 'artur-shaik/vim-javacomplete2'
	Plug 'neomake/neomake'
	Plug 'Yggdroot/indentLine'
	Plug 'airblade/vim-gitgutter'
call plug#end()

" theming and sensible settings

syntax on
filetype plugin indent on
set number
set relativenumber
set list
set tabstop=3
set shiftwidth=3
set encoding=utf-8

colorscheme wal

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
