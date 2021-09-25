"▾ Note: Make sure the function is defined before `vim-buffet` is loaded.
function! g:BuffetSetCustomColors()
    hi! BuffetCurrentBuffer cterm=NONE ctermbg=0 ctermfg=7
        hi! BuffetBuffer cterm=NONE ctermbg=2 ctermfg=7
    endfunction" Load plugins

call plug#begin('~/.config/nvim/plugged')

    Plug 'rhysd/vim-grammarous'
    Plug 'PotatoesMaster/i3-vim-syntax'
    Plug 'lervag/vimtex'

    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'zchee/deoplete-clang'
    Plug 'deoplete-plugins/deoplete-jedi'
    Plug 'sebastianmarkow/deoplete-rust'

    Plug 'sirver/UltiSnips'
    Plug 'honza/vim-snippets'

    Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh',
        \ },
    Plug 'Omnisharp/Omnisharp-vim'
    Plug 'nickspoons/vim-sharpenup'
    Plug 'dense-analysis/ale'

    " Vim language extensions
    "
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary' " gc
    Plug 'jiangmiao/auto-pairs'
    Plug 'alvan/vim-closetag'
    Plug 'michaeljsmith/vim-indent-object' " ii in indentation
    Plug 'vim-scripts/ReplaceWithRegister'
    " USAGE
    "	[count]["x]gr{motion}   Replace {motion} text with the contents of register x.
    "	                        Especially when using the unnamed register, this is
    "	                        quicker than "_d{motion}P or "_c{motion}<C-R>"
    "	[count]["x]grr          Replace [count] lines with the contents of register x.
    "	                        To replace from the cursor position to the end of the
    "	                        line use ["x]gr$
    "	{Visual}["x]gr          Replace the selection with the contents of register x.
    Plug 'kana/vim-textobj-user'
    Plug 'kana/vim-textobj-entire' " ae all entire, ie in entire (no leading trailing whitespaces)
    Plug 'kana/vim-textobj-line' " al all line, il in line

    " Plug 'preservim/nerdtree'
    " Plug 'Xuyuanp/nerdtree-git-plugin'
    " Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    " Plug 'ryanoasis/vim-devicons'

    Plug 'tpope/vim-vinegar'

    Plug 'kyazdani42/nvim-web-devicons' " for file icons
    Plug 'kyazdani42/nvim-tree.lua'


    Plug 'dylanaraps/wal.vim'
    Plug 'lukas-reineke/indent-blankline.nvim'

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    Plug 'nvim-lua/plenary.nvim'
    Plug 'lewis6991/gitsigns.nvim'
    Plug 'simnalamburt/vim-mundo'
    Plug 'ap/vim-css-color'
    Plug 'bagrat/vim-buffet'
    Plug 'Asheq/close-buffers.vim'

    " Debugging interfaces
    Plug 'puremourning/vimspector'

    Plug 'mfussenegger/nvim-dap'
    Plug 'rcarriga/nvim-dap-ui'

call plug#end()

" theming and sensible settings

lua <<EOF
require("indent_blankline").setup {
    char = "│"
}

require('gitsigns').setup()
EOF

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
set scrolloff=12
set hidden
" set showbreak=↪\
" set listchars=tab:\|\ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set signcolumn=yes
highlight Comment cterm=italic


" remove trailing whitespace on write
autocmd BufWritePre * %s/\s\+$//e

" Folds

" set foldmethod=indent " fold based on indent level
" set foldmethod=syntax " fold based on syntax
" set foldnestmax=1
" set foldlevel=0
" map zz za
" autocmd BufReadPost,FileReadPost,BufEnter * :normal zR " unfold by default

" Remember last position in file

if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" make tab do the reasonable thing I guess
imap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

let g:UltiSnipsExpandTrigger="<C-Space>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

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

let mapleader=" "
nnoremap j gj
nnoremap k gk
nnoremap <leader>ev :tabe $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <F2> :lopen<cr>
nnoremap <F3> :lclose<cr>
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k

nnoremap <C-n> :NvimTreeToggle<CR>

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
noremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>
nnoremap <silent> Q :Bdelete menu<CR>


"Keybinds for vimspector
" let g:vimspector_enable_mappings = 'HUMAN'
" " for normal mode - the word under the cursor
" nmap <Leader>di <Plug>VimspectorBalloonEval
" " for visual mode, the visually selected text
" xmap <Leader>di <Plug>VimspectorBalloonEval

" Keybinds for nvim-dap
nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <leader>dr :lua require'dap'.repl.toggle()<CR>
nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>
nnoremap <silent> <leader>di <Cmd>require('dap.ui.widgets').hover()<CR>


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

" tree stuff

let g:nvim_tree_quit_on_open = 1 "0 by default, closes the tree when you open a file
let g:nvim_tree_hide_dotfiles = 1 "0 by default, this option hides files and folders starting with a dot `.`let g:nvim_tree_auto_open = 1 "0 by default, opens the tree when typing `vim $DIR` or `vim`
let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.


let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ 'folder_arrows': 0,
    \ }

let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "r",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   },
    \   'lsp': {
    \     'hint': "",
    \     'info': "",
    \     'warning': "",
    \     'error': "",
    \   }
    \ }


" autocompletion

let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_completion_start_length = 2


" close preview after autocompletion
autocmd CompleteDone * pclose!

" LanguageClient
let g:LanguageClient_serverCommands = {
    \ 'erlang': ['/usr/bin/erlang_ls'],
    \ 'java': ['jdtls'],
    \ 'python': ['pyls'],
    \ 'rust': ['rls'],
    \ 'haskell': ['haskell-language-server-wrapper', '--lsp'],
    \ 'html': ['vscode-html-languageserver'],
    \}
let g:LanguageClient_autoStart=1
"let g:LanguageClient_hoverPreview = "Auto"
let g:LanguageClient_useFloatingHover = 0
let g:LanguageClient_diagnosticsMaxSeverity = "Warning"
let g:LanguageClient_useVirtualText = "No"
let g:LanguageClient_showCompletionDocs = 0
let g:LanguageClient_preferredMarkupKind = ['plaintext']


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

" HTML
autocmd FileType html setlocal tabstop=2
autocmd FileType html setlocal shiftwidth=2

autocmd FileType htmldjango setlocal tabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2

" CSS
autocmd FileType css setlocal tabstop=2
autocmd FileType css setlocal shiftwidth=2

autocmd FileType scss setlocal tabstop=2
autocmd FileType scss setlocal shiftwidth=2

" C#
autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
let g:sharpenup_map_prefix = ','

let g:Omnisharp_highlighting = 0
let g:OmniSharp_popup_position = 'peek'
let g:OmniSharp_popup_options = {
\ 'winhl': 'Normal:Normal',
\}

let g:ale_virtualtext_cursor = 1

" Debug adapter stuff
lua <<EOF
local dap = require('dap')
dap.adapters.netcoredbg = {
  type = 'executable',
  command = '/usr/sbin/netcoredbg',
  args = {'--interpreter=vscode'}
}

dap.configurations.cs = {
  {
    type = "netcoredbg",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
        return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    end,
  },
}
require("dapui").setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
  },
  sidebar = {
    open_on_start = false,
    -- You can change the order of elements in the sidebar
    elements = {
      -- Provide as ID strings or tables with "id" and "size" keys
      {
        id = "scopes",
        size = 0.25, -- Can be float or integer > 1
      },
      { id = "breakpoints", size = 0.25 },
      { id = "stacks", size = 0.25 },
      { id = "watches", size = 00.25 },
    },
    size = 40,
    position = "left", -- Can be "left", "right", "top", "bottom"
  },
  tray = {
    open_on_start = true,
    elements = { "repl" },
    size = 10,
    position = "bottom", -- Can be "left", "right", "top", "bottom"
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
})
EOF

" Folding : http://vim.wikia.com/wiki/Syntax-based_folding, see comment by Ostrygen
au FileType cs set omnifunc=syntaxcomplete#Complete

"json
autocmd FileType json setlocal shiftwidth=2
autocmd FileType json setlocal tabstop=2


