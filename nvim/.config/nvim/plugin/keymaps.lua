vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'K', vim.lsp.buf.hover)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
vim.keymap.set("n", "K", ":lua vim.lsp.buf.hover()<CR>", { silent = true, noremap = true})
vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')

-- <leader>l - LSP
vim.keymap.set("n", "<leader>lf", ":lua vim.diagnostic.open_float()<CR>", { silent = true, noremap = true, desc = 'Open float' })
vim.keymap.set("n", "<leader>la", ":lua vim.lsp.buf.code_action()<CR>", { silent = true, noremap = true, desc = 'Code action' })
vim.keymap.set("n", "<leader>ln", ":lua vim.lsp.buf.rename()<CR>", { silent = true, noremap = true, desc = 'Rename' })
vim.keymap.set("n", "<leader>lh", ":lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>", { silent = true, noremap = true, desc = 'Toggle hints' })
vim.keymap.set('n', '<leader>lr', '<cmd>Telescope lsp_references theme=ivy<cr>', { desc = 'Search references' })
vim.keymap.set('n', '<leader>ls', '<cmd>Telescope lsp_document_symbols theme=ivy<cr>', { desc = 'Search document symbols' })
vim.keymap.set('n', '<leader>lw', '<cmd>Telescope lsp_workspace_symbols theme=ivy<cr>', { desc = 'Search workspace symbols' })
vim.keymap.set('n', '<leader>li', '<cmd>Telescope lsp_implementations theme=ivy<cr>', { desc = 'Search implementations' })
vim.keymap.set('n', '<leader>lo', '<cmd>Telescope lsp_outgoing_calls theme=ivy<cr>', { desc = 'Search outgoing calls' })
vim.keymap.set('n', '<leader>ld', '<cmd>Telescope diagnostics theme=ivy<cr>', { desc = 'Search diagnostics' })

-- <leader>e - Error handling
vim.keymap.set('n', '<leader>et', '<cmd>TroubleToggle<cr>', { desc = 'Toggle trouble' })
vim.keymap.set('n', '<leader>ew', '<cmd>Trouble workspace_diagnostics<cr>', { desc = 'Workspace diagnostics' })
vim.keymap.set('n', '<leader>ed', '<cmd>Trouble document_diagnostics<cr>', { desc = 'Document diagnostics' })

-- <leader>f - Fuzzy find
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope git_files hidden=true theme=ivy<cr>',	{ desc = 'Search git files' })
vim.keymap.set('n', '<leader>fa', '<cmd>Telescope find_files cwd=$HOME/code<cr>', { desc = 'Search all files in $HOME/code' })
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { desc = 'Search in files' })
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers theme=ivy<cr>', { desc = 'Search buffers' })
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope harpoon marks theme=ivy<cr>', { desc = 'Search harpoon marks' })
vim.keymap.set('n', '<leader>ft', ':Oil --float<CR>', { desc = 'Toggle file tree' })
vim.keymap.set('n', '<C-p>', '<cmd>Telescope find_files theme=ivy<cr>', { desc = 'Search all files in cwd' })

-- <leader>h - Harpoon
vim.keymap.set('n', '<leader>hm', ':lua require("harpoon.mark").add_file()<CR>', { noremap = true, silent = true, desc = 'Add mark' })
vim.keymap.set('n', '<leader>ht', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', { noremap = true, silent = true, desc = 'Toggle Harpoon' })
vim.keymap.set('n', '<leader>h1', ':lua require("harpoon.ui").nav_file(1)<CR>', { noremap = true, silent = true, desc = 'Navigate to mark 1' })
vim.keymap.set('n', '<leader>h2', ':lua require("harpoon.ui").nav_file(2)<CR>', { noremap = true, silent = true, desc = 'Navigate to mark 2' })
vim.keymap.set('n', '<leader>h3', ':lua require("harpoon.ui").nav_file(3)<CR>', { noremap = true, silent = true, desc = 'Navigate to mark 3' })
vim.keymap.set('n', '<leader>h4', ':lua require("harpoon.ui").nav_file(4)<CR>', { noremap = true, silent = true, desc = 'Navigate to mark 4' })

-- <leader>g - Git stuff
vim.keymap.set('n', '<leader>gp', '<cmd>Gitsigns preview_hunk<cr>', { desc = 'Preview hunk under cursor' })
vim.keymap.set('n', '<leader>gh', '<cmd>Gitsigns stage_hunk<cr>', { desc = 'Stage hunk under cursor' })
vim.keymap.set('n', '<leader>gw', ":lua require('telescope').extensions.git_worktree.create_git_worktree()", { desc = 'Create worktree' })
vim.keymap.set('n', '<leader>gc', '<cmd>Telescope git_commits<cr>', { desc = 'Search git commits' })
vim.keymap.set('n', '<leader>gb', '<cmd>Telescope git_branches<cr>', { desc = 'Search git branches' })
vim.keymap.set('n', '<leader>gs', '<cmd>Telescope git_status<cr>', { desc = 'Show git status' })
vim.keymap.set('n', '<leader>gn', '<cmd>Neogit kind=split_above<cr>', { desc = 'Open Neogit as a buffer in a top split' })

-- Key mappings
vim.keymap.set('n', '*', '*zz', { desc = 'Search and center screen' })
vim.keymap.set('n', '<C-i>', 'gg=G', { desc = 'Format the entire file' })

-- I constantly save files so I would reather keep the `;` keymap. Lets mappings
-- it before loosing this map.
vim.keymap.set('n', '<C-.>', ';', { desc = 'Move forward in find with Control dot'})
vim.keymap.set('n', ';', ':', { desc = 'Map ; to :'})
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to bottom window with C-j' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to top window with C-k' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right window with C-l' })
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left window with C-h' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down and center the screen' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up and center the screen' })

-- Window and tab navigations
vim.keymap.set('n', '<leader>z', "<cmd>lua require'centerpad'.toggle{ leftpad = 50, rightpad = 50 }<cr>", { silent = true, noremap = true })
vim.keymap.set('n', '}t', ':tabn<cr>')
vim.keymap.set('n', '{t', ':tabp<cr>')
vim.keymap.set('n', '}b', ':bn<cr>')
vim.keymap.set('n', '{b', ':bp<cr>')
vim.keymap.set('n', '<leader>bd', ':bd!<cr>')
vim.keymap.set('n', '<leader>bc', ':close<cr>')
vim.keymap.set('n', ',+', ':exe "resize " . (winheight(0) * 3/2)<CR>', {silent = true})
vim.keymap.set('n', ',-', ':exe "resize " . (winheight(0) * 2/3)<CR>', {silent = true})
vim.keymap.set('n', '<leader>+', ':exe "vertical resize " . (winheight(0) * 3/2)<CR>', {silent = true})
vim.keymap.set('n', '<leader>-', ':exe "vertical resize " . (winheight(0) * 2/3)<CR>', {silent = true})
vim.keymap.set('n',  '<esc>k', ':noh<cr>', { silent = true })
vim.keymap.set('i', '<Down>', '<NOP>')
vim.keymap.set('i', '<Up>', '<NOP>')
vim.keymap.set('i', '<Left>', '<NOP>')
vim.keymap.set('i', '<Right>', '<NOP>')
vim.keymap.set('n', '<Down>', 'ddp')
vim.keymap.set('n', '<Up>', 'ddkP')
vim.keymap.set('n', '<Left>', '<<<esc>')
vim.keymap.set('n', '<Right>', '>><esc>')
vim.keymap.set('n', '<leader>o', ':only<cr>')

vim.cmd [[
nnoremap <silent> <c-space> :FloatermToggle<CR>
tnoremap <silent> <c-space> <c-\><c-n>:FloatermToggle<CR>
]]

require('nvim-cheat')
vim.keymap.set('n', '<c-s>', '<cmd>Cheat<cr>')
vim.keymap.set('v', '<leader>d', '"_d')
