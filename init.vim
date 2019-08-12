call plug#begin('~/.local/share/nvim/plugged')

Plug 'arcticicestudio/nord-vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf'

call plug#end()

let mapleader = ","

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

" Mappings
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
nnoremap <leader>v :b#<CR><cr>
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


"Go configs
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_addtags_transform = "snakecase"
let g:go_auto_sameids = 0
let g:go_fmt_command = "goimports"
let g:go_term_mode = "split"
let g:go_term_enabled = 1
let g:go_test_timout = 40
let g:go_auto_type_info = 1
nnoremap 'gr :call LanguageClient_textDocument_rename()<cr>
au FileType go nmap 'gd <Plug>(go-doc)
au FileType go nmap 'gi <Plug>(go-implements)
au FileType go nmap 'gf <Plug>(go-info)
au FileType go nmap 'gv <Plug>(go-run-vertical)
au FileType go nmap 'gt <Plug>(go-test)
au FileType go nmap 'gb <Plug>(go-describe)
au FileType go nmap 'gs <Plug>(go-referrers)
au FileType go nmap 'ge <Plug>(go-whicherrs)
au FileType go nmap 'gg <Plug>(go-coverage-toggle)

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
       \ 'go': ['gopls']
       \ }
let g:LanguageClient_useVirtualText=0
let g:deoplete#enable_at_startup = 1
nnoremap <leader>lc :call LanguageClient_contextMenu()<cr>

nnoremap <C-P> :FZF<CR>
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
