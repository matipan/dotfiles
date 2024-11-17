-- Global configurations
vim.cmd[[
set noswapfile
set nobackup
]]
vim.g.mapleader = ","
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
set.backspace = 'indent,eol,start'
set.completeopt = 'menu,menuone,noselect'
set.clipboard = set.clipboard + 'unnamedplus'
set.incsearch = true
set.inccommand = 'split'
set.pumheight = 25
set.colorcolumn = '80'
set.cursorline = true

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
augroup highlight_yank
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
augroup END

autocmd! FileType yaml setlocal shiftwidth=2 tabstop=2 expandtab softtabstop=2
autocmd! FileType json setlocal shiftwidth=2 tabstop=2 expandtab softtabstop=2
autocmd! FileType java setlocal shiftwidth=2 tabstop=2 expandtab softtabstop=2
autocmd! FileType javascript setlocal shiftwidth=4 tabstop=4 expandtab softtabstop=4
autocmd! FileType python setlocal shiftwidth=4 tabstop=4 expandtab softtabstop=4
autocmd! FileType php setlocal shiftwidth=4 tabstop=4 expandtab softtabstop=4
autocmd! FileType vim setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd! FileType scala setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd! FileType lua setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd! FileType go setlocal shiftwidth=4 tabstop=4 softtabstop=4
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
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				automatic_installation = true,
			})

		end,
	},
	{ "nvim-lua/plenary.nvim", lazy = false },
	{ 'ThePrimeagen/git-worktree.nvim', lazy = false },
	{ "smithbm2316/centerpad.nvim", lazy = false },
	{ "neovim/nvim-lspconfig", lazy = false },
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		lazy = false,
		config = function()
			require('nvim-treesitter.configs').setup({
				textobjects = {
					select = {
						enable = true,
						-- Automatically jump forward to textobj, similar to targets.vim
						lookahead = true,
						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							["af"] = { query = "@function.outer", desc = "Select outer function" },
							["if"] = { query = "@function.inner", desc = "Select inner function" },
							["ac"] = { query = "@class.outer", desc = "Select outer class" },
							-- You can optionally set descriptions to the mappings (used in the desc parameter of
							-- nvim_buf_set_keymap) which plugins like which-key display
							["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
							-- You can also use captures from other query groups like `locals.scm`
							["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
						},
						-- You can choose the select mode (default is charwise 'v')
						--
						-- Can also be a function which gets passed a table with the keys
						-- * query_string: eg '@function.inner'
						-- * method: eg 'v' or 'o'
						-- and should return the mode ('v', 'V', or '<c-v>') or a table
						-- mapping query_strings to modes.
						selection_modes = {
							['@parameter.outer'] = 'v', -- charwise
							['@function.outer'] = 'V', -- linewise
							['@class.outer'] = '<c-v>', -- blockwise
						},
						include_surrounding_whitespace = true,
					},
				},
			})
		end
	},
	{ "RishabhRD/popfix", lazy = false },
	{ "RishabhRD/nvim-cheat.sh", lazy = false },
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
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"onsails/lspkind.nvim",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
	},
	-- disable copilot for a bit
	--{ "github/copilot.vim", event = "InsertEnter" },

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
	{ "junegunn/fzf.vim", lazy = true },
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" }
	},

	-- Languages
	{ "rust-lang/rust.vim", lazy = true, ft = "rust" },
	{ "hashivim/vim-terraform", lazy = true, ft = "terraform" },
	{ "jjo/vim-cue", lazy = true, ft = "cue" },
	{ "scalameta/nvim-metals", lazy = true },
	{ "evanleck/vim-svelte", lazy = true, ft = "javascript" },
	{ "euclidianAce/BetterLua.vim", lazy = true, ft = "lua" },

	-- utils
	{ "voldikss/vim-floaterm", lazy = false },
	{ "tjdevries/express_line.nvim", lazy = false },
	{ "mbbill/undotree", lazy = false },
	{ "tpope/vim-fugitive", lazy = false },
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",         -- required
			"sindrets/diffview.nvim",        -- optional - Diff integration

			-- Only one of these is needed, not both.
			"nvim-telescope/telescope.nvim", -- optional
		},
		config = true
	},

	{ -- Useful plugin to show you pending keybinds.
		'folke/which-key.nvim',
		event = 'VimEnter', -- Sets the loading event to 'VimEnter'
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		config = function() -- This is the function that runs, AFTER loading
			require('which-key').setup({
				plugins = {
					marks = true,
				},
				triggers_nowait = {
					-- marks
					"`",
					"'",
					"g`",
					"g'",
					-- registers
					'"',
					"<c-r>",
					-- spelling
					"z=",
				},
			})

			-- Document existing key chains
			require('which-key').register {
				['<leader>l'] = { name = '[L]SP', _ = 'which_key_ignore' },
				['<leader>f'] = { name = '[F]ind', _ = 'which_key_ignore' },
				['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
				['<leader>e'] = { name = '[E]rrors (trouble)', _ = 'which_key_ignore' },
			}
		end,
	},
	{
		"folke/todo-comments.nvim",
		lazy = false,
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{
		"mistricky/codesnap.nvim",
		build = "make",
		config = function()
			require("codesnap").setup({
				mac_window_bar = false,
				bg_color = "#535c68",
				watermark = "",
				has_breadcrumbs = true,
				has_line_number = true,
				breadcrumbs_separator = "/"
			})
		end,
	},
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		lazy = false,
		version = false, -- set this if you want to always pull the latest change
		opts = {
			provider = "claude",
			claude = {
				endpoint = "https://api.anthropic.com",
				model = "claude-3-5-sonnet-20241022",
				temperature = 0,
				max_tokens = 4096,
			},
			behaviour = {
				auto_suggestions = false, -- Experimental stage
				auto_set_highlight_group = true,
				auto_set_keymaps = true,
				auto_apply_diff_after_generation = false,
				support_paste_from_clipboard = false,
			},
			hints = { enabled = false },
			-- add any opts here
		},
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		build = "make",
		-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
			{
				-- Make sure to set this up properly if you have lazy=true
				'MeanderingProgrammer/render-markdown.nvim',
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},
	{
		"luckasRanarison/tailwind-tools.nvim",
		name = "tailwind-tools",
		build = ":UpdateRemotePlugins",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope.nvim", -- optional
			"neovim/nvim-lspconfig", -- optional
		},
		opts = {} -- your configuration
	},
}

require("lazy").setup(plugins)
