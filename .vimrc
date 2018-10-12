execute pathogen#infect()
syntax on
filetype plugin indent on
set number
set list
set tabstop=2
set shiftwidth=2
set encoding=utf-8

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

colorscheme wal
let g:airline_theme='term'


let g:syntastic_python_checkers = ['pylint']
