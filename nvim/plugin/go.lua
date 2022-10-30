-- The following two autocmd perform auto save and autoimport for go
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.go" },
  callback = function()
	  vim.lsp.buf.format(nil, 3000)
  end,
})

vim.cmd[[
autocmd BufWritePre *.go :silent! lua vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
]]


-- Old vim-go configs just in case
--vim.g.go_def_mode = 'gopls'
--vim.g.go_doc_keywordprg_enabled = 0
--vim.g.go_info_mode = 'gopls'
--vim.g.go_addtags_transform = 'snakecase'
--vim.g.go_auto_sameids = 0
--vim.g.go_fmt_command = 'goimports'
--vim.g.go_term_mode = 'split'
--vim.g.go_term_enabled = 1
--vim.g.go_test_timout = 40
--vim.g.go_auto_type_info = 0
--vim.g.go_highlight_extra_types = 1
--vim.g.go_highlight_types = 1
--vim.g.go_highlight_fields = 1
--vim.g.go_highlight_operators = 1
--vim.g.go_highlight_functions = 1
--vim.g.go_highlight_methods = 1
--vim.g.go_highlight_structs = 1
--vim.g.go_highlight_build_constraints = 1
--vim.g.go_highlight_function_calls = 1
--vim.cmd [[
--au FileType go nmap <leader>gd <Plug>(go-doc)
--au FileType go nmap <leader>gi <Plug>(go-implements)
--au FileType go nmap <leader>gf <Plug>(go-info)
--au FileType go nmap <leader>gv <Plug>(go-run-vertical)
--au FileType go nmap <leader>gt <Plug>(go-test)
--au FileType go nmap <leader>gb <Plug>(go-describe)
--au FileType go nmap <leader>gs <Plug>(go-referrers)
--au FileType go nmap <leader>ge <Plug>(go-whicherrs)
--au FileType go nmap <leader>gg <Plug>(go-coverage-toggle)
--]]
