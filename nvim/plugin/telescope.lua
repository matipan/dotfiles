local telescope = require('telescope')
telescope.setup({
    defaults = {
        layout_config = {
            vertical = {
                width = 0.1,
                height = 0.1,
            }
        },
    }
})

telescope.load_extension("ui-select")
telescope.load_extension("harpoon")
telescope.load_extension("git_worktree")
telescope.load_extension("project")
