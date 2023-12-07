-- The following two autocmd perform auto save and autoimport for go
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.go" },
  callback = function()
	  local orignal = vim.notify
	  vim.notify = function(msg, level, opts)
		  if msg == 'No code actions available' then
			  return
		  end
		  orignal(msg, level, opts)
	  end

	  vim.lsp.buf.format(nil, 3000)
  end,
})

vim.cmd[[
autocmd BufWritePre *.go :silent! lua vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
]]
