" Note: Make sure the function is defined before `vim-buffet` is loaded.
function! g:BuffetSetCustomColors()
    hi! BuffetCurrentBuffer cterm=NONE ctermbg=0 ctermfg=7
    hi! BuffetBuffer cterm=NONE ctermbg=2 ctermfg=7
endfunction" Load plugins

call plug#begin('~/.config/nvim/plugged')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'zchee/deoplete-clang'
    Plug 'dylanaraps/wal.vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-sensible'
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
    Plug 'ap/vim-css-color'
    Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh',
        \ },
    Plug 'bagrat/vim-buffet',
    Plug 'neovimhaskell/haskell-vim'
call plug#end()

" theming and sensible settings

syntax on
colorscheme wal
"filetype plugin indent on
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

let mapleader=","

" Hardmode because I hate myself
let g:HardMode_level='wannabe'
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" remove trailing whitespace on write
autocmd BufWritePre * %s/\s\+$//e

" Folds

set foldmethod=indent " fold based on indent level
map zz zA
autocmd BufReadPost,FileReadPost,BufEnter * :normal zR " unfold by default


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
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'

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


" Neomake

 call neomake#configure#automake('nrw', 500)

" autocompletion

let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_completion_start_length = 2

" make tab do the reasonable thing I guess
imap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" close preview after autocompletion
autocmd CompleteDone * pclose!

" LanguageClient
let g:LanguageClient_serverCommands = {
    \ 'erlang': ['/usr/bin/erlang_ls'],
    \ 'java': ['jdtls'],
    \ 'python': ['pyls'],
    \ 'rust': ['rls'],
    \ 'haskell': ['haskell-language-server-wrapper', '--lsp'],
    \}
let g:LanguageClient_autoStart=1
"let g:LanguageClient_hoverPreview = "Auto"
let g:LanguageClient_useFloatingHover = 0
let g:LanguageClient_diagnosticsMaxSeverity = "Warning"
let g:LanguageClient_useVirtualText = "No"
let g:LanguageClient_showCompletionDocs = 0
let g:LanguageClient_preferredMarkupKind = ['plaintext']

nmap <F5> <Plug>(lcn-menu)
nmap <leader>K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> <F2> <Plug>(lcn-rename)

" buffet

nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)
nmap <leader>6 <Plug>BuffetSwitch(6)
nmap <leader>7 <Plug>BuffetSwitch(7)
nmap <leader>8 <Plug>BuffetSwitch(8)
nmap <leader>9 <Plug>BuffetSwitch(9)
nmap <leader>0 <Plug>BuffetSwitch(10)
let g:buffet_always_show_tabline = 0

" Java

autocmd FileType java setlocal tabstop=4
autocmd FileType java setlocal shiftwidth=4
autocmd FileType java setlocal expandtab
autocmd BufEnter,BufRead,BufNewFile *.java NeomakeDisableBuffer


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
autocmd FileType tex setlocal tabstop=2
autocmd FileType tex setlocal shiftwidth=2
autocmd FileType tex setlocal expandtab
autocmd FileType tex VimtexCompile
autocmd FileType tex IndentLinesDisable
autocmd FileType tex setlocal spell

" Rust

" let g:deoplete#sources#rust#racer_binary='/usr/bin/racer'
" let g:deoplete#sources#rust#rust_source_path='/usr/share/rust/src'

" Erlang

autocmd FileType erlang setlocal tabstop=2
autocmd FileType erlang setlocal shiftwidth=2
autocmd FileType erlang setlocal expandtab

" yaml

autocmd FileType yaml setlocal tabstop=2
autocmd FileType yaml setlocal shiftwidth=2
autocmd FileType yaml setlocal expandtab

" Haskell

autocmd FileType haskell setlocal tabstop=2
autocmd FileType haskell setlocal shiftwidth=2
autocmd FileType haskell setlocal expandtab
autocmd FileType haskell IndentLinesDisable

let g:haskell_classic_highlighting = 1
let g:haskell_indent_if = 3
let g:haskell_indent_case = 2
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_before_where = 2
let g:haskell_indent_after_bare_where = 2
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1
let g:haskell_indent_guard = 2
let g:haskell_indent_case_alternative = 1
let g:cabal_indent_section = 2
