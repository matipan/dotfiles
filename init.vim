call plug#begin('~/.local/share/nvim/plugged')

Plug 'arcticicestudio/nord-vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'vimlab/split-term.vim'
Plug 'rust-lang/rust.vim'
Plug 'airblade/vim-gitgutter'
Plug 'janko/vim-test'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

call plug#end()

let mapleader = "'"

set laststatus=2
set number
set hidden
set ttimeout
set ttimeoutlen=20
set notimeout
set backspace=indent,eol,start
set completeopt=menu,menuone,noinsert,noselect
set nobackup
set noswapfile
set scrolljump=20
set autoread
set mouse=a
set clipboard+=unnamedplus
set autoindent
set smartindent
set softtabstop=0
set tabstop=8
set shiftwidth=8
set noexpandtab
set smarttab
filetype on
filetype plugin indent on
set incsearch
set inccommand=split

colorscheme nord

nnoremap ; :
nnoremap <leader>ct :checktime<return>
tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-h> <C-w>h
nnoremap tt :terminal<cr>
nnoremap tv :VTerm<cr>
nnoremap th :Term<cr>
nnoremap }t :tabn<cr>
nnoremap {t :tabp<cr>
nnoremap }b :bn<cr>
nnoremap {b :bp<cr>
nnoremap ,v :b#<CR><cr>
nnoremap <leader>bd :bd!<cr>
nnoremap <leader>bc :close<cr>
inoremap jk <esc>
nnoremap <silent> <esc>k :noh<cr>
inoremap <Down> <NOP>
inoremap <Up> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
noremap <Down> ddp
noremap <Up> ddkP
noremap <Left> <<<esc>
noremap <Right> >><esc>
inoremap <c-u> <Esc>gUiw
nnoremap <c-u> gUiw
nnoremap <leader>o :only<cr>
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

"Plugin configs

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

let g:deoplete#enable_at_startup = 1
let g:deoplete#max_menu_width = 20
let g:deoplete#max_list = 100

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_addtags_transform = "snakecase"
let g:go_auto_sameids = 0
let g:go_fmt_command = "goimports"
let g:go_term_mode = "split"
let g:go_term_enabled = 1
let g:go_test_timout = 40
let g:go_auto_type_info = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_function_calls = 1

let g:LanguageClient_serverCommands = {
       \ 'go': ['gopls'],
       \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
       \ }
let g:LanguageClient_useVirtualText=1
let g:LanguageClient_diagnosticsDisplay= {
			\ 1: {
			\ "name": "Error",
            		\ "texthl": "ALEError",
            		\ "signText": "✖",
            		\ "signTexthl": "ALEErrorSign",
            		\ "virtualTexthl": "GitGutterDelete",
			\},
			\ }

let g:rustfmt_autosave = 1

let g:gitgutter_map_keys = 0
let g:gitgutter_sign_added = '│'
let g:gitgutter_sign_modified = '│'
let g:gitgutter_sign_removed = '│'
let g:gitgutter_sign_removed_first_line = '│'
let g:gitgutter_sign_modified_removed = '│'

let test#strategy = "neovim"

"Shortcuts
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" Leader + g -- Go
au FileType go nmap <leader>gd <Plug>(go-doc)
au FileType go nmap <leader>gi <Plug>(go-implements)
au FileType go nmap <leader>gf <Plug>(go-info)
au FileType go nmap <leader>gv <Plug>(go-run-vertical)
au FileType go nmap <leader>gt <Plug>(go-test)
au FileType go nmap <leader>gb <Plug>(go-describe)
au FileType go nmap <leader>gs <Plug>(go-referrers)
au FileType go nmap <leader>ge <Plug>(go-whicherrs)
au FileType go nmap <leader>gg <Plug>(go-coverage-toggle)

" Leader + l -- LSP
nnoremap <C-P> :Files<CR>
nnoremap <leader>lc :call LanguageClient_contextMenu()<cr>
nnoremap <leader>ld :call LanguageClient_textDocument_hover()<cr>
nnoremap <leader>lr :call LanguageClient_textDocument_references()<cr>
nnoremap <leader>ln :call LanguageClient_textDocument_rename()<cr>

" Leader + f -- FZF
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fa :Ag<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fc :Commits<CR>

" Leader + t -- Tests
nnoremap <silent> <leader>tn :TestNearest<CR>
nnoremap <silent> <leader>tf :TestFile<CR>
nnoremap <silent> <leader>ts :TestSuite<CR>
nnoremap <silent> <leader>tl :TestLast<CR>

" Leader + v -- Version control
nnoremap <leader>vs :Gstatus<CR>
nnoremap <leader>vc :Gcommit<CR>
nnoremap <leader>vw :Gwrite<CR>
nnoremap <leader>gl :Git log --oneline --abbrev-commit --graph --decorate --all<CR>

map <F5> :NERDTreeToggle<CR>
