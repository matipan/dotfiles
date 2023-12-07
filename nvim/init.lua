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
syntax on
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
autocmd! FileType java setlocal shiftwidth=2 tabstop=2 expandtab softtabstop=2
autocmd! FileType javascript setlocal shiftwidth=4 tabstop=4 expandtab softtabstop=4
autocmd! FileType python setlocal shiftwidth=4 tabstop=4 expandtab softtabstop=4
autocmd! FileType php setlocal shiftwidth=4 tabstop=4 expandtab softtabstop=4
autocmd! FileType vim setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd! FileType scala setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd! FileType lua setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd! FileType go setlocal shiftwidth=8 tabstop=8 softtabstop=8
autocmd! FileType dockerfile setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd! FileType scala setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd! FileType sbt setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd! BufReadPost *dockerfile* set syntax=dockerfile
autocmd! BufReadPost *.kt* set syntax=java
autocmd! BufReadPost *.hurl* set filetype=hurl
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

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	{ "nvim-lua/plenary.nvim", lazy = false },
	{ "neovim/nvim-lspconfig", lazy = false },
	{ "nvim-treesitter/nvim-treesitter", lazy = false},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		config = function()
			require("ibl").setup({
				indent = { char = '▏' },
				scope = {
					enabled = false,
				},
			})
		end
	},
	{
		'stevearc/oil.nvim',
		opts = {
			view_options = {
				show_hidden = true,
			},
			float = {
				padding = 2,
				max_width = 60,
				max_height = 60,
				border = "rounded",
				win_options = {
					winblend = 0,
				},
			},
		},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" }
	},
	{
		"shaunsingh/nord.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			require("tokyonight").setup({
				on_highlights = function(hl, c)
					local prompt = "#2d3149"
					hl.TelescopeNormal = {
						bg = c.bg_dark,
						fg = c.fg_dark,
					}
					hl.TelescopeBorder = {
						bg = c.bg_dark,
						fg = c.bg_dark,
					}
					hl.TelescopePromptNormal = {
						bg = prompt,
					}
					hl.TelescopePromptBorder = {
						bg = prompt,
						fg = prompt,
					}
					hl.TelescopePromptTitle = {
						bg = prompt,
						fg = prompt,
					}
					hl.TelescopePreviewTitle = {
						bg = c.bg_dark,
						fg = c.bg_dark,
					}
					hl.TelescopeResultsTitle = {
						bg = c.bg_dark,
						fg = c.bg_dark,
					}
				end
			})
		end
	},
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require('nightfox').setup({
				options = {
					transparent = false,
					terminal_colors = true,
					dim_inactive = false,
					module_default = true,
					inverse = {
						match_paren = false,
						visual = false,
						search = false,
					},
				},
			})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		lazy = false,
		config = function()
			require('gitsigns').setup({})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		lazy = false,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"petertriho/cmp-git",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
	},
	{ "github/copilot.vim", event = "InsertEnter" },

	-- UI stuff
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		config =  function()
			require('dressing').setup({
				input = {
					enabled = true,
					default_prompt = "> ",
					title_pos = "left",
					insert_only = true,
					start_in_insert = true,
					relative = "cursor",
					prefer_width = 40,
					width = nil,
					max_width = { 140, 0.9 },
					min_width = { 20, 0.2 },
					buf_options = {},
					win_options = {
						winblend = 10,
						wrap = false,
						list = true,
						listchars = "precedes:…,extends:…",
						sidescrolloff = 0,
					},
					override = function(conf)
						conf.anchor = "SW"
						conf.border = "rounded"
						return conf
					end,
				},
				select = {
					enabled = true,
					backend = { "telescope" },
					trim_prompt = true,
					telescope = require('telescope.themes').get_cursor({})
				},
			})
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-telescope/telescope-project.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
		},
		lazy = true,
	},
	{
		"ThePrimeagen/harpoon",
		lazy = true,
		config = function()
			require("harpoon").setup({
				save_on_toggle = false,
				save_on_change = true,
				enter_on_sendcmd = false,
				tmux_autoclose_windows = false,
				excluded_filetypes = { "harpoon" },
				mark_branch = false,
				tabline = false,
			})
		end,
	},
	{ "RishabhRD/popfix", lazy = true },
	{ "RishabhRD/nvim-cheat.sh", lazy = true },
	{ "junegunn/fzf.vim", lazy = true },

	-- Languages
	{ "rust-lang/rust.vim", lazy = true, ft = "rust" },
	{ "hashivim/vim-terraform", lazy = true, ft = "terraform" },
	{ "jjo/vim-cue", lazy = true, ft = "cue" },
	{ "tomlion/vim-solidity", lazy = true, ft = "solidity" },
	{ "scalameta/nvim-metals", lazy = true },
	{ "evanleck/vim-svelte", lazy = true, ft = "javascript" },
	{ "euclidianAce/BetterLua.vim", lazy = true, ft = "lua" },

	-- utils
	{ "voldikss/vim-floaterm", lazy = false },
	{ "tjdevries/express_line.nvim", lazy = false },
	{ "mbbill/undotree", lazy = false },
	{ "tpope/vim-fugitive", lazy = false },
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-neotest/neotest-go",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-go")({
						experimental = {
							test_table = true,
						},
						args = { "-count=1", "-timeout=60s" }
					})
				}
			})
		end,
	},
	{
		"mfussenegger/nvim-jdtls",
		lazy = true,
		ft = "java",
		config = function()
			local config = {
				cmd = {'/home/matipan/bin/jdt/bin/jdtls'},
				root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
			}
			require('jdtls').start_or_attach(config)

			vim.diagnostic.disable()
		end,
	},
}

require("lazy").setup(plugins)
