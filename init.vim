autocmd! FileType yaml setlocal shiftwidth=2 tabstop=2 expandtab softtabstop=2
autocmd! FileType json setlocal shiftwidth=2 tabstop=2 expandtab softtabstop=2
autocmd! FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab softtabstop=2
autocmd! FileType python setlocal shiftwidth=2 tabstop=2 expandtab softtabstop=2
autocmd! FileType vim setlocal shiftwidth=2 tabstop=2 expandtab softtabstop=2
autocmd! BufReadPost *dockerfile* set syntax=dockerfile
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

lua << EOF
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.local/share/nvim/plugged')

-- Programming language and autocomplete plugins
Plug 'rust-lang/rust.vim'
Plug 'hashivim/vim-terraform'
Plug 'jjo/vim-cue'
Plug('fatih/vim-go', { ['do'] = ':GoUpdateBinaries' })
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

-- Search
Plug 'nvim-lua/plenary.nvim'
Plug('nvim-telescope/telescope.nvim', {tag = '0.1.0'})

-- Styles
Plug 'kyazdani42/nvim-web-devicons'
Plug 'andersevenrud/nordic.nvim'
--Plug 'arcticicestudio/nord-vim'

-- File explorer and window configs
Plug 'voldikss/vim-floaterm'
Plug 'kyazdani42/nvim-tree.lua'

vim.call('plug#end')

-- Global configurations
vim.cmd[[
colorscheme nordic
set noswapfile
set nobackup
]]
vim.g.mapleader = "'"
vim.g.filetype = 'on'
vim.g.hidden = true
vim.cmd [[
filetype plugin indent on
]]

-- Vim options
local set = vim.opt
set.number = true
set.mouse = 'a'
set.autoread = true
set.scrolljump = 20
set.backspace = 'indent,eol,start'
set.completeopt = 'menu,menuone,noselect'
set.clipboard = set.clipboard + 'unnamedplus'
set.incsearch = true
set.inccommand = 'split'
set.pumheight = 25

-- Tab configs
set.autoindent = true
set.smartindent = true
set.smarttab = true
set.softtabstop = 0
set.tabstop = 8
set.shiftwidth = 8
set.smarttab = true

-- Key mappings
vim.keymap.set('n', '*', '*zz', { desc = 'Search and center screen' })
vim.keymap.set('n', ';', ':', { desc = 'Map ; to :'})
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to bottom window with C-j' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to top window with C-k' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right window with C-l' })
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left window with C-h' })
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
vim.keymap.set('n', '<leader>tn', ':TestNearest<CR>', { silent = true })
vim.keymap.set('n', '<leader>tf', ':TestFile<CR>', { silent = true })
vim.keymap.set('n', '<leader>ts', ':TestSuite<CR>', { silent = true })
vim.keymap.set('n', '<leader>tl', ':TestLast<CR>', { silent = true })
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
vim.keymap.set('n', '<leader>vc', '<cmd>Telescope git_commits<cr>')
vim.keymap.set('n', '<leader>vb', '<cmd>Telescope git_branches<cr>')
vim.keymap.set('n', '<leader>vs', '<cmd>Telescope git_status<cr>')
vim.keymap.set('n', '<leader>lr', '<cmd>Telescope lsp_references<cr>')
vim.keymap.set('n', '<leader>ld', '<cmd>Telescope diagnostics<cr>')
vim.keymap.set('n', '<C-P>', '<cmd>Telescope find_files<cr>')
vim.cmd [[
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
nnoremap <silent> <c-space> :FloatermToggle<CR>
tnoremap <silent> <c-space> <c-\><c-n>:FloatermToggle<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
]]

-- Plugin setups
vim.g.go_def_mode = 'gopls'
vim.g.go_doc_keywordprg_enabled = 0
vim.g.go_info_mode = 'gopls'
vim.g.go_addtags_transform = 'snakecase'
vim.g.go_auto_sameids = 0
vim.g.go_fmt_command = 'goimports'
vim.g.go_term_mode = 'split'
vim.g.go_term_enabled = 1
vim.g.go_test_timout = 40
vim.g.go_auto_type_info = 0
vim.g.go_highlight_extra_types = 1
vim.g.go_highlight_types = 1
vim.g.go_highlight_fields = 1
vim.g.go_highlight_operators = 1
vim.g.go_highlight_functions = 1
vim.g.go_highlight_methods = 1
vim.g.go_highlight_structs = 1
vim.g.go_highlight_build_constraints = 1
vim.g.go_highlight_function_calls = 1
vim.cmd [[
au FileType go nmap <leader>gd <Plug>(go-doc)
au FileType go nmap <leader>gi <Plug>(go-implements)
au FileType go nmap <leader>gf <Plug>(go-info)
au FileType go nmap <leader>gv <Plug>(go-run-vertical)
au FileType go nmap <leader>gt <Plug>(go-test)
au FileType go nmap <leader>gb <Plug>(go-describe)
au FileType go nmap <leader>gs <Plug>(go-referrers)
au FileType go nmap <leader>ge <Plug>(go-whicherrs)
au FileType go nmap <leader>gg <Plug>(go-coverage-toggle)
]]

vim.g['test#strategy'] = 'neovim'

vim.g['float_preview#docked'] = 0

vim.g.rustfmt_autosave = 1

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local cmp = require'cmp'

cmp.setup({
	snippet = {
          expand = function(args)
	  vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	experimental = {
    native_menu = false,
    ghost_text = true,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
	}, {
		{ name = 'buffer' },
	})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
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

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lsp = require('lspconfig')
lsp.gopls.setup{
	capabilities = capabilities,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    },
  },
}

lsp.rust_analyzer.setup{
	capabilities = capabilities
}

require('telescope').setup({
  defaults = {
    layout_config = {
      vertical = {
        width = 0.1,
        height = 0.1,
      }
    },
  },
})

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
EOF
