-- LSP keymaps, actions and search
vim.keymap.set("n", "<leader>lf", ":lua vim.diagnostic.open_float()<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>la", ":lua vim.lsp.buf.code_action()<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>ln", ":lua vim.lsp.buf.rename()<CR>", { silent = true, noremap = true })
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
vim.keymap.set('n', '<leader>lr', '<cmd>Telescope lsp_references theme=ivy<cr>')
vim.keymap.set('n', '<leader>ls', '<cmd>Telescope lsp_document_symbols theme=ivy<cr>')
vim.keymap.set('n', '<leader>lw', '<cmd>Telescope lsp_workspace_symbols theme=ivy<cr>')
vim.keymap.set('n', '<leader>li', '<cmd>Telescope lsp_incoming_calls theme=ivy<cr>')
vim.keymap.set('n', '<leader>lo', '<cmd>Telescope lsp_outgoing_calls theme=ivy<cr>')
vim.keymap.set('n', '<leader>ld', '<cmd>Telescope diagnostics theme=ivy<cr>')
vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')

vim.keymap.set("n", "K", ":lua vim.lsp.buf.hover()<CR>", { silent = true, noremap = true})

-- Telescope - Files and
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files hidden=true theme=ivy<cr>')
vim.keymap.set('n', '<leader>fa', '<cmd>Telescope find_files cwd=$HOME/code<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers theme=ivy<cr>')
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
vim.keymap.set('n', '<C-P>', '<cmd>Telescope git_files theme=ivy<cr>')

vim.keymap.set('n', '<leader>vc', '<cmd>Telescope git_commits<cr>')
vim.keymap.set('n', '<leader>vb', '<cmd>Telescope git_branches<cr>')
vim.keymap.set('n', '<leader>vs', '<cmd>Telescope git_status<cr>')

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
vim.keymap.set('n', '<leader>o', ':only<cr>')
vim.keymap.set('n', ',f', ':NvimTreeToggle<CR>')

vim.cmd [[
nnoremap <silent> <c-space> :FloatermToggle<CR>
tnoremap <silent> <c-space> <c-\><c-n>:FloatermToggle<CR>
]]

vim.keymap.set('n', '<c-s>', '<cmd>Cheat<cr>')
vim.keymap.set('v', '<leader>d', '"_d')
