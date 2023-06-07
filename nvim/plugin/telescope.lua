local telescope = require('telescope')
telescope.setup({
    defaults = {
        layout_config = {
            vertical = {
                width = 0.1,
                height = 0.1
            }
        }
    },
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_cursor {
			}
		}  
	}
})

telescope.load_extension("ui-select")
telescope.load_extension("harpoon")
telescope.load_extension("project")
