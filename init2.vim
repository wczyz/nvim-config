" Directory for plugins
call plug#begin('~/.config/nvim/autoload/plugged')

    " Dark theme
    Plug 'EdenEast/nightfox.nvim'

    " Normal tabs for neovim
    "Plug 'kyazdani42/nvim-web-devicons'
    "Plug 'romgrk/barbar.nvim'

    " Rainbow parentheses
    Plug 'luochen1990/rainbow'

    " Status line
    Plug 'nvim-lualine/lualine.nvim'
    " If you want to have icons in your statusline choose one of these
    Plug 'kyazdani42/nvim-web-devicons'

    " Builtin LSP config
    Plug 'neovim/nvim-lspconfig'

    "Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'preservim/nerdtree'
    "Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
    Plug 'nvim-lua/plenary.nvim'
    Plug 'lewis6991/gitsigns.nvim'
    "Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'tpope/vim-fugitive'
    Plug 'jiangmiao/auto-pairs'
    "Plug 'dense-analysis/ale'
    "Plug 'sbdchd/neoformat'
    Plug 'preservim/nerdcommenter'
    "Plug 'sheerun/vim-polyglot'
    "Plug 'SidOfc/mkdx'
    Plug 'nvim-telescope/telescope.nvim'
    "Plug 'rktjmp/lush.nvim'
    "Plug 'jackguo380/vim-lsp-cxx-highlight'

call plug#end()

colorscheme nightfox

" Lualine
lua require('lualine').setup { options = { theme = "nightfox" } }
set noshowmode " -- INSERT -- message is reduntant with lightline

" Rainbow
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle


syntax on
filetype plugin on

set number
set tabstop=4
set shiftwidth=4
set expandtab
set splitright
set splitbelow
set termguicolors
set colorcolumn=120

let mapleader = " "

"nasm
autocmd BufEnter *.asm set ft=nasm


"" Coc config

"" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
"" unicode characters in the file autoload/float.vim
"set encoding=utf-8

"" TextEdit might fail if hidden is not set.
"set hidden

"" Some servers have issues with backup files, see #649.
"set nobackup
"set nowritebackup

"" Give more space for displaying messages.
"set cmdheight=2

"" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
"" delays and poor user experience.
"set updatetime=300

"" Don't pass messages to |ins-completion-menu|.
"set shortmess+=c

"" Use tab for trigger completion with characters ahead and navigate.
"" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
"" other plugin before putting this into your config.
"inoremap <silent><expr> <TAB>
      "\ pumvisible() ? "\<C-n>" :
      "\ <SID>check_back_space() ? "\<TAB>" :
      "\ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"function! s:check_back_space() abort
  "let col = col('.') - 1
  "return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

"" Use <c-space> to trigger completion.
"if has('nvim')
  "inoremap <silent><expr> <c-space> coc#refresh()
"else
  "inoremap <silent><expr> <c-@> coc#refresh()
"endif

"" Use `[g` and `]g` to navigate diagnostics
"" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)

"" GoTo code navigation.
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)

"" Remap for rename current word
"nmap <leader>rn <Plug>(coc-rename)

" Use K to show documentation in preview window.
"nnoremap <silent> K :call <SID>show_documentation()<CR>

"function! s:show_documentation()
  "if (index(['vim','help'], &filetype) >= 0)
    "execute 'h '.expand('<cword>')
  "elseif (coc#rpc#ready())
    "call CocActionAsync('doHover')
  "else
    "execute '!' . &keywordprg . " " . expand('<cword>')
  "endif
"endfunction

"" Highlight the symbol and its references when holding the cursor.
"autocmd CursorHold * silent call CocActionAsync('highlight')

"let g:go_def_mode='gopls'
"let g:go_info_mode='gopls'

" end of Coc config


" NerdTree config

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree and leave the cursor in it.
"autocmd VimEnter * NERDTree

" Start NERDTree and put the cursor back in the other window.
"autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" end of NerdTree config

lua require('gitsigns').setup()

" ale
"let g:ale_linters = {
    "\ 'vim': ['vint'],
    "\ 'c': ['clang'],
    "\ 'cpp': ['clang -Wc++20-extension', 'clang-tidy'],
"\}

"let g:ale_linters_explicit = 1

"" custom setting for clangformat
"let g:neoformat_cpp_clangformat = {
    "\ 'exe': 'clang-format',
    "\ 'args': ['--style="{IndentWidth: 4}"', '-Wc++20-extension']
"\}
"let g:neoformat_enabled_cpp = ['clangformat']
"let g:neoformat_enabled_c = ['clangformat']


"" mkdx start -- markdown
"let g:mkdx#settings     = { 'highlight': { 'enable': 1 },
                        "\ 'enter': { 'shift': 1 },
                        "\ 'links': { 'external': { 'enable': 1 } },
                        "\ 'toc': { 'text': 'Table of Contents', 'update_on_write': 1 },
                        "\ 'fold': { 'enable': 0 } }
" mkdx end

inoremap <C-Return> <CR><CR><C-o>k<Tab>

" Find files using Telescope command-line sugar.
nnoremap ; <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


map <C-J> :bnext<CR>
map <C-K> :bprev<CR>

let g:loaded_python_provider = 0
let g:python3_host_prog = '/usr/bin/python3'
