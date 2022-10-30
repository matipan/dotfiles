local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.local/share/nvim/plugged')

-- Programming language and autocomplete plugins
Plug 'rust-lang/rust.vim'
Plug 'hashivim/vim-terraform'
Plug 'jjo/vim-cue'
Plug 'LnL7/vim-nix'
Plug 'tomlion/vim-solidity'
--Plug('fatih/vim-go', { ['do'] = ':GoUpdateBinaries' })
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'jparise/vim-graphql'
Plug 'euclidianAce/BetterLua.vim'

-- Search
Plug 'nvim-lua/plenary.nvim'
Plug('nvim-telescope/telescope.nvim', {tag = '0.1.0'})
Plug 'nvim-telescope/telescope-project.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-cheat.sh'
Plug 'junegunn/fzf.vim'

-- Styles
Plug 'kyazdani42/nvim-web-devicons'
Plug 'arcticicestudio/nord-vim'
Plug 'andersevenrud/nordic.nvim'

-- File explorer and window configs
Plug 'voldikss/vim-floaterm'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'tjdevries/express_line.nvim'

-- Misc
Plug 'mbbill/undotree'
Plug 'TimUntersberger/neogit'
Plug 'ThePrimeagen/git-worktree.nvim'

vim.call('plug#end')

-- Global configurations
vim.cmd[[
set noswapfile
set nobackup
]]
vim.g.mapleader = "'"
vim.g.filetype = 'on'
vim.g.hidden = true
vim.cmd [[
filetype plugin indent on
]]

-- Vim options
local set = vim.opt
set.number = true
set.relativenumber = true
set.mouse = 'a'
set.autoread = true
set.scrolljump = 20
set.backspace = 'indent,eol,start'
set.completeopt = 'menu,menuone,noselect'
set.clipboard = set.clipboard + 'unnamedplus'
set.incsearch = true
set.inccommand = 'split'
set.pumheight = 25

-- Tab configs
set.autoindent = true
set.smartindent = true
set.smarttab = true
set.softtabstop = 0
set.tabstop = 4
set.shiftwidth = 4
set.smarttab = true
set.laststatus = 2

vim.cmd[[
autocmd! FileType yaml setlocal shiftwidth=2 tabstop=2 expandtab softtabstop=2
autocmd! FileType json setlocal shiftwidth=2 tabstop=2 expandtab softtabstop=2
autocmd! FileType javascript setlocal shiftwidth=4 tabstop=4 expandtab softtabstop=4
autocmd! FileType python setlocal shiftwidth=4 tabstop=4 expandtab softtabstop=4
autocmd! FileType vim setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd! FileType lua setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd! FileType go setlocal shiftwidth=8 tabstop=8 softtabstop=8
autocmd! FileType dockerfile setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd! BufReadPost *dockerfile* set syntax=dockerfile
autocmd! BufReadPost *.kt* set syntax=java
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
\| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif
]]

vim.g['float_preview#docked'] = 0

vim.g.rustfmt_autosave = 1

vim.api.nvim_create_autocmd({"BufWritePre"}, {
    pattern = {"*.tf", "*.tfvars"},
    callback = vim.lsp.buf.formatting_sync,
})