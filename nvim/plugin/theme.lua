require('nordic').colorscheme({
    underline_option = 'none',
    italic = false,
    italic_comments = true,
    minimal_mode = false,
    alternate_backgrounds = false
})

vim.g.nord_contrast = false
vim.g.nord_borders = false
vim.g.nord_disable_background = false
vim.g.nord_italic = false
vim.g.nord_uniform_diff_background = false
vim.g.nord_bold = false

vim.o.termguicolors = true
vim.g.colors_name = "nordic"

vim.cmd[[
colorscheme nord
hi StatusLine ctermfg=8 ctermbg=6 guibg=#88C0D0 guifg=#4C566A
hi VertSplit guifg=#3b4252
hi Pmenu guibg=NONE
hi NormalFloat guibg=NONE
hi FloatBorder guifg=#e5e9f0
hi ElVisual gui=bold
hi ElNormal gui=bold guifg=#88C0D0
hi ElCommand gui=bold guifg=#88C0D0
hi ElInsert gui=bold ctermfg=8 ctermbg=6 guibg=#88C0D0 guifg=#4C566A
hi ElVisualLine gui=bold ctermfg=8 ctermbg=6 guibg=#88C0D0 guifg=#4C566A
hi ElVisualBlock gui=bold ctermfg=8 ctermbg=6 guibg=#88C0D0 guifg=#4C566A
hi MyFunction gui=italic guifg=#88c0d0
hi MyBuiltin guifg=#8FBCBB
hi MyFunc guifg=#88c0d0
hi MyKeyword guifg=#5e81ac
]]

--hi MyBuiltin guifg=#ffa0a0
-- Highlight the @foo.bar capture group with the "Identifier" highlight group
--vim.api.nvim_set_hl(0, "@method.call", { link = "MyFunction" })
--vim.api.nvim_set_hl(0, "@function.call", { link = "MyFunction" })
--vim.api.nvim_set_hl(0, "@function.builtin", { link = "MyBuiltin" })
--vim.api.nvim_set_hl(0, "@function", { link = "MyFunc" })
--vim.api.nvim_set_hl(0, "@keyword", { link = "MyKeyword" })
