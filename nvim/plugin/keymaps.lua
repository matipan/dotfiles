-- LSP keymaps, actions and search
vim.keymap.set("n", "<leader>lf", ":lua vim.diagnostic.open_float()<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>la", ":lua vim.lsp.buf.code_action()<CR>", { silent = true, noremap = true })
vim.keymap.set('n', '<leader>lr', '<cmd>Telescope lsp_references<cr>')
vim.keymap.set('n', '<leader>ls', '<cmd>Telescope lsp_document_symbols<cr>')
vim.keymap.set('n', '<leader>lw', '<cmd>Telescope lsp_workspace_symbols<cr>')
vim.keymap.set('n', '<leader>li', '<cmd>Telescope lsp_incoming_calls<cr>')
vim.keymap.set('n', '<leader>lo', '<cmd>Telescope lsp_outgoing_calls<cr>')
vim.keymap.set('n', '<leader>ld', '<cmd>Telescope diagnostics<cr>')

vim.keymap.set("n", "K", ":lua vim.lsp.buf.hover()<CR>", { silent = true, noremap = true})
vim.keymap.set("i", "<expr><tab>", "pumvisible() ? \"<c-n>\" : \"<tab>\"", { noremap = true })

-- Telescope - Files and
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
vim.keymap.set('n', '<C-P>', '<cmd>Telescope find_files<cr>')

vim.keymap.set('n', '<leader>vc', '<cmd>Telescope git_commits<cr>')
vim.keymap.set('n', '<leader>vb', '<cmd>Telescope git_branches<cr>')
vim.keymap.set('n', '<leader>vs', '<cmd>Telescope git_status<cr>')
vim.keymap.set('n', '<leader>wa', '<cmd>lua require("telescope").extensions.git_worktree.create_git_worktree()<CR>')
vim.keymap.set('n', '<leader>wl', '<cmd>lua require("telescope").extensions.git_worktree.git_worktrees()<CR>')

-- Key mappings
vim.keymap.set('n', '*', '*zz', { desc = 'Search and center screen' })
vim.keymap.set('n', ';', ':', { desc = 'Map ; to :'})
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to bottom window with C-j' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to top window with C-k' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right window with C-l' })
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left window with C-h' })

-- Window and tab navigations
vim.keymap.set('n', '}t', ':tabn<cr>')
vim.keymap.set('n', '{t', ':tabp<cr>')
vim.keymap.set('n', '}b', ':bn<cr>')
vim.keymap.set('n', '{b', ':bp<cr>')
vim.keymap.set('n', ',v', ':b#<CR><cr>')
vim.keymap.set('n', '<leader>bd', ':bd!<cr>')
vim.keymap.set('n', '<leader>bc', ':close<cr>')

vim.keymap.set('n',  '<esc>k', ':noh<cr>', { silent = true })
vim.keymap.set('i', '<Down>', '<NOP>')
vim.keymap.set('i', '<Up>', '<NOP>')
vim.keymap.set('i', '<Left>', '<NOP>')
vim.keymap.set('i', '<Right>', '<NOP>')
vim.keymap.set('n', '<Down>', 'ddp')
vim.keymap.set('n', '<Up>', 'ddkP')
vim.keymap.set('n', '<Left>', '<<<esc>')
vim.keymap.set('n', '<Right>', '>><esc>')
vim.keymap.set('i', '<c-u>', '<Esc>gUiw')
vim.keymap.set('n', '<c-u>', 'gUiw')
vim.keymap.set('n', '<leader>o', ':only<cr>')
vim.keymap.set('n', ',f', ':NvimTreeToggle<CR>')

vim.cmd [[
nnoremap <silent> <c-space> :FloatermToggle<CR>
tnoremap <silent> <c-space> <c-\><c-n>:FloatermToggle<CR>
]]


vim.keymap.set('n', '<c-s>', '<cmd>Cheat<cr>')

vim.keymap.set('v', '<leader>d', '"_d')
