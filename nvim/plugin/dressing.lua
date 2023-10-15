require('dressing').setup({
	input = {
		-- Set to false to disable the vim.ui.input implementation
		enabled = true,
		default_prompt = "> ",
		-- Can be 'left', 'right', or 'center'
		title_pos = "left",
		-- When true, <Esc> will close the modal
		insert_only = true,
		-- When true, input will start in insert mode.
		start_in_insert = true,

		-- 'editor' and 'win' will default to being centered
		relative = "cursor",
		-- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
		prefer_width = 40,
		width = nil,
		-- min_width and max_width can be a list of mixed types.
		-- min_width = {20, 0.2} means "the greater of 20 columns or 20% of total"
		max_width = { 140, 0.9 },
		min_width = { 20, 0.2 },

		buf_options = {},
		win_options = {
			-- Window transparency (0-100)
			winblend = 10,
			-- Disable line wrapping
			wrap = false,
			-- Indicator for when text exceeds window
			list = true,
			listchars = "precedes:…,extends:…",
			-- Increase this for more context when text scrolls off the window
			sidescrolloff = 0,
		},

		override = function(conf)
			conf.anchor = "SW"
			conf.border = "rounded"
			return conf
		end,
	},
	select = {
		-- Set to false to disable the vim.ui.select implementation
		enabled = true,

		-- Priority list of preferred vim.select implementations
		backend = { "telescope" },

		-- Trim trailing `:` from prompt
		trim_prompt = true,

		-- Options for telescope selector
		-- These are passed into the telescope picker directly. Can be used like:
		telescope = require('telescope.themes').get_cursor({})
	},
})
