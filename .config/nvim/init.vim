" Load plugins

call plug#begin('~/.config/nvim/plugged')
	Plug 'dylanaraps/wal.vim'
	Plug 'jiangmiao/auto-pairs'
	Plug 'tpope/vim-sensible'
call plug#end()

" theming and sensible settings

syntax on
filetype plugin indent on
set number
set relativenumber
set list
set tabstop=2
set shiftwidth=2
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

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint']
