local telescope = require('telescope')
telescope.setup({
	pickers = {
		find_files = {
			find_command = {
				"rg",
				"--files",
				"--hidden",
				"--with-filename",
				"--line-number",
				"--column",
				"--glob=!**/.git/*",
				"--glob=!**/.idea/*",
				"--glob=!**/.vscode/*",
				"--glob=!**/build/*",
				"--glob=!**/dist/*",
				"--glob=!**/yarn.lock",
				"--glob=!**/package-lock.json",
				"--glob=!**/target/*",
				"--glob=!**/.gradle/*",
				"--glob=!**/.project/*",
			}
		},
	},
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
			require("telescope.themes").get_cursor {}
		}
	}
})

telescope.load_extension("ui-select")
telescope.load_extension("harpoon")
telescope.load_extension("project")
telescope.load_extension("git_worktree")
