local lspkind = require "lspkind"

local cmp = require "cmp"

-- vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
-- 	pattern = {"*"},
-- 	callback = function(ev)
-- 		vim.lsp.inlay_hint.enable(true)
-- 	end
-- })

cmp.setup {
	enabled = function()
		-- Disable completion in markdown files
		local buftype = vim.api.nvim_buf_get_option(0, 'buftype')
		local filetype = vim.api.nvim_buf_get_option(0, 'filetype')
		if filetype == 'markdown' then
			return false
		end
		return buftype ~= 'prompt'
	end,
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "nvim_lsp_signature_help" },
		{ name = "path" },
	}, {
		{ name = "buffer" },
	}),
	mapping = cmp.mapping.preset.insert({
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-a>"] = cmp.mapping.scroll_docs(4),
		["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
		["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
		["<C-y>"] = cmp.mapping(
			cmp.mapping.confirm {
				behavior = cmp.ConfirmBehavior.Insert,
				select = true
			},
			{ "i", "c" }
		),
	}),
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = 'symbol_text',
			maxwidth = 50,
			ellipsis_char = '...',
			show_labelDetails = true,
			before = require("tailwind-tools.cmp").lspkind_format,
		})
	},
	experimental = {
		native_menu = false,
		ghost_text = true,
	},
}

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

local ls = require "luasnip"
ls.config.set_config {
	history = false,
	updateevents = "TextChanged,TextChangedI",
}

vim.keymap.set({"i", "s"}, "<c-k>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })

vim.keymap.set({"i", "s"}, "<c-j>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lsp = require('lspconfig')

lsp.opts = {
	inlay_hints = { enabled = true },
}

lsp.gopls.setup{
    capabilities = capabilities,
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
                shadow = true,
            },
            staticcheck = true,
			hints = {
				rangeVariableTypes = true,
				parameterNames = true,
				constantValues = true,
				assignVariableTypes = false,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				functionTypeParameters = true,
			},
        },
    },
}

lsp.rust_analyzer.setup{
    capabilities = capabilities
}

lsp.terraformls.setup{
    capabilities = capabilities
}

lsp.pylsp.setup{
	capabilities = capabilities,
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					ignore = {'W391'},
					maxLineLength = 100
				}
			}
		}
	}
}

lsp.tsserver.setup{
    capabilities = capabilities
}

lsp.lua_ls.setup {
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = {'vim'},
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    },
}

lsp.zls.setup {
	capabilities = capabilities,
	settings = {
		zls = {
			semantic_tokens = 'none',
			enable_inlay_hints = true,
			inlay_hints_show_variable_type_hints = true,
			inlay_hints_show_parameter_name = true
		}
	}
}

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
	pattern = {"*.php"},
	callback = function(ev)
		vim.diagnostic.disable()
	end
})

lsp.phpactor.setup{
    capabilities = capabilities,
    init_options = {
        ["language_server_phpstan.enabled"] = false,
        ["language_server_psalm.enabled"] = false,
    }
}

lsp.html.setup{
	capabilities = capabilities
}

lsp.tailwindcss.setup({
    capabilities = capabilities,
    filetypes = { "go", "templ", "html" },
    init_options = {
        userLanguages = {
            go = "html"
        }
    },
    settings = {
        tailwindCSS = {
            includeLanguages = {
                go = "html",
            },
            experimental = {
                classRegex = {
                    -- Class() method patterns
                    'Class\\(["\'`]([^"\'`]*)["\'`]?\\)?',     -- Matches both Class("something") and Class("
                    'Class\\(["\'`]([^"\'`]*)',                -- Matches just Class("
                    -- Simple assignment patterns (with optional spaces)
                    'class\\s*=\\s*["\'`]([^"\'`]*)["\'`]',    -- Matches class = "..."
                    'class\\s*=\\s*["\'`]([^"\'`]*)',          -- Matches incomplete class = "
                    -- Short declaration patterns
                    'class\\s*:=\\s*["\'`]([^"\'`]*)["\'`]',   -- Matches class := "..."
                    'class\\s*:=\\s*["\'`]([^"\'`]*)',         -- Matches incomplete class := "
                    -- Concatenation patterns
                    'class\\s*\\+=\\s*["\'`]([^"\'`]*)["\'`]', -- Matches class += "..."
                    'class\\s*\\+=\\s*["\'`]([^"\'`]*)',       -- Matches incomplete class += "
                    -- Generic class-related variable patterns
                    '[cC]lass\\w*\\s*=\\s*["\'`]([^"\'`]*)["\'`]',    -- any assignment
                    '[cC]lass\\w*\\s*:=\\s*["\'`]([^"\'`]*)["\'`]',   -- any declaration
                    '[cC]lass\\w*\\s*\\+=\\s*["\'`]([^"\'`]*)["\'`]', -- any concatenation
                    -- Incomplete versions of generic patterns
                    '[cC]lass\\w*\\s*=\\s*["\'`]([^"\'`]*)',
                    '[cC]lass\\w*\\s*:=\\s*["\'`]([^"\'`]*)',
                    '[cC]lass\\w*\\s*\\+=\\s*["\'`]([^"\'`]*)',
                    -- String slice/array patterns
                    'Classes:\\s*\\[\\]string\\{[^}]*["\'`]([^"\'`]*)["\'`]',  -- Matches complete strings in Classes slice
                    'Classes:\\s*\\[\\]string\\{[^}]*["\'`]([^"\'`]*)',        -- Matches incomplete strings in Classes slice
                    '["\'`]([^"\'`]*)["\'`]\\s*,\\s*(?://.*)?\n',             -- Matches individual strings in multi-line array
                    '["\'`]([^"\'`]*)',                                        -- Matches incomplete strings in array context
                }
            },
            validate = true,
            trace = { server = "verbose" }, -- Enable detailed logging
        }
    },
    -- Add root patterns to help LSP find your project root
    root_dir = require('lspconfig').util.root_pattern(
        'tailwind.config.js',
        'tailwind.config.cjs',
        'tailwind.config.mjs',
        'tailwind.config.ts',
        'postcss.config.js',
        'postcss.config.cjs',
        'postcss.config.mjs',
        'postcss.config.ts',
        'package.json',
        'go.mod'
    )
})

vim.diagnostic.config{
  float={border="rounded"}
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})
